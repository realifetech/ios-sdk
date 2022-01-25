//  Copyright © 2020 VenueNext. All rights reserved.
// This file is provided by VenueNext SDK, and it should be used as provided.
// VenueNext SDK document: https://venuenext.github.io/ios-2/apple-pay/

import Foundation
import Braintree
import BraintreeDropIn

/*

@objc class VNBraintree: NSObject, PaymentProcessable, PaymentRepresentable {
    let zeroCost = "0.00"
    private var merchantId: String?
    private var applePayEnabled: Bool = false

    var cardType: String = ""
    var lastFour: String = ""
    var cardHolderName: String? = ""
    var nonce: String = ""
    var instrument: PaymentMethodInstrument = .creditCard

    private var applePayError: NSError?
    private var braintreeApiClient: BTAPIClient?
    private var queue = OperationQueue()

    override public init() {
        self.applePayEnabled = false
    }

    public init(merchantId: String) {
        self.merchantId = merchantId
        self.applePayEnabled = true
    }

    private func resetToDefaults() {
        braintreeApiClient = nil
        nonce = ""
        applePayError = nil
    }
    // swiftlint:disable:next line_length
    func processPayment(from viewController: UIViewController?, transactionData: [String: Any], completion: @escaping (PaymentRepresentable?, NSError?) -> Void) {
        resetToDefaults()
        guard let token = (transactionData["braintreeClientToken"] as? String) else { return }
        let request = BTDropInRequest()
        request.paypalDisabled = true
        request.vaultManager = true
        request.applePayDisabled = !self.applePayEnabled
        request.cardDisabled = false
        // swiftlint:disable:next line_length
        let dropIn = BTDropInController(authorization: token, request: request, handler: { (controller, result, error) in

            defer {
                controller.dismiss(animated: true, completion: nil)
            }

            guard error == nil else {
                completion(nil, error as NSError?)
                return
            }

            guard result?.isCancelled == false else {
                completion(nil, nil)
                return
            }

            guard let result = result else {
                // Use the BTDropInResult properties to update your UI
                completion(nil, nil)
                return
            }

            switch result.paymentOptionType {

            case.applePay:
                self.applePayError = nil
                self.braintreeApiClient = BTAPIClient(authorization: token)

                self.queue.isSuspended = true
                let blockOp = BlockOperation {
                    if let error = self.applePayError {
                        completion(nil, error)
                        return
                    }
                    self.instrument = .applePay
                    completion(self, nil)
                }
                self.queue.addOperation(blockOp)

                guard let viewController = viewController else {
                    // swiftlint:disable:next line_length
                    completion(nil, NSError(source: self, code: 422, userInfo: [NSLocalizedDescriptionKey: "PKPaymentAuthorizationViewController must be launched from a viewcontroller"]))
                    return
                }

                self.tappedApplePay(from: viewController, transactionData: transactionData, completion: completion)
            default:
                self.instrument = .creditCard
                guard let nonce = result.paymentMethod?.nonce else {
                    // swiftlint:disable:next line_length
                    let error = NSError(source: self, code: 404, userInfo: [NSLocalizedDescriptionKey: "Payment Method did not provide a nonce"])
                    completion(nil, error)
                    return
                }

                self.nonce = nonce
                completion(self, nil)
            }
        })
        if let dropIn = dropIn {
            viewController?.present(dropIn, animated: true, completion: nil)
        }
    }
    // swiftlint:disable:next line_length
    func completedPayment(orderId: String, quantity: Int, discount: Double, tips: Double, tax: Double, total: Double, paymentTypes: String?) { }
}

extension VNBraintree: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        if nonce.isEmpty {
            // swiftlint:disable:next line_length
            applePayError = NSError(source: self, code: -1, userInfo: [NSLocalizedDescriptionKey: "User canceled ApplePay"])
        }
        queue.isSuspended = false
        controller.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    // swiftlint:disable:next line_length
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        guard let braintreeApiClient = braintreeApiClient else {
            // Indicate failure via completion callback.
            completion(PKPaymentAuthorizationResult(status: .failure, errors: nil))
            return
        }
        let applePayClient = BTApplePayClient(apiClient: braintreeApiClient)
        applePayClient.tokenizeApplePay(payment) { [weak self] tokenizedApplePayPayment, error in
            guard let tokenizedApplePayPayment = tokenizedApplePayPayment else {
                // Tokenization failed. Check `error` for the cause of the failure.
                guard let self = self else { return }
                self.applePayError = error as NSError?
                // Indicate failure via completion callback.
                completion(PKPaymentAuthorizationResult(status: .failure, errors: nil))
                return
            }
            self?.nonce = tokenizedApplePayPayment.nonce
            // Then indicate success or failure via the completion callback, e.g.
            completion(PKPaymentAuthorizationResult.init(status: .success, errors: nil))
        }
    }
    // swiftlint:disable:next line_length
    func setupPaymentRequest(for transactionData: [String: Any], completion: @escaping (PKPaymentRequest?, Error?) -> Void) {
        guard let braintreeApiClient = braintreeApiClient else {
            // swiftlint:disable:next line_length
            let error = NSError(source: self, code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not setup Apple Pay payments because BTAPIClient is nil"])
            completion(nil, error)
            return
        }

        let applePayClient = BTApplePayClient(apiClient: braintreeApiClient)
        // You can use the following helper method to create a PKPaymentRequest which will set the `countryCode`,
        // `currencyCode`, `merchantIdentifier`, and `supportedNetworks` properties.
        // You can also create the PKPaymentRequest manually. Be aware that you'll need to keep these in
        // sync with the gateway settings if you go this route.
        applePayClient.paymentRequest { (paymentRequest, error) in
            guard let paymentRequest = paymentRequest, let merchantId = self.merchantId else {
                completion(nil, error)
                return
            }
            paymentRequest.merchantIdentifier = merchantId
            // We recommend collecting billing address information, at minimum
            // billing postal code, and passing that billing postal code with all
            // Apple Pay transactions as a best practice.
            paymentRequest.requiredBillingContactFields = [.emailAddress]

            let pkContact = PKContact()
            pkContact.emailAddress = transactionData["email"] as? String
            paymentRequest.billingContact = pkContact

            var items = [PKPaymentSummaryItem]()
            if let subtotal = transactionData["subtotal"] as? String {
                if subtotal != self.zeroCost {
                    items.append(PKPaymentSummaryItem(label: "Subtotal", amount: NSDecimalNumber(string: subtotal)))
                }
            }
            if let discount = transactionData["discount"] as? String {
                if discount != self.zeroCost {
                    items.append(PKPaymentSummaryItem(label: "Discount", amount: NSDecimalNumber(string: discount)))
                }
            }
            if let serviceCharge = transactionData["serviceCharge"] as? String {
                // swiftlint:disable:next line_length
                if serviceCharge != self.zeroCost {
                    items.append(PKPaymentSummaryItem(label: "Service Charge", amount: NSDecimalNumber(string: serviceCharge)))
                }
            }
            if let tax = transactionData["tax"] as? String {
                items.append(PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: tax)))
            }
            if let tip = transactionData["tip"] as? String {
                items.append(PKPaymentSummaryItem(label: "Tip", amount: NSDecimalNumber(string: tip)))
            }
            if let orderTotal = transactionData["orderTotal"] as? String {
                items.append(PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: orderTotal)))
            }
            // Set other PKPaymentRequest properties here
            paymentRequest.merchantCapabilities = .capability3DS
            paymentRequest.paymentSummaryItems = items
            completion(paymentRequest, nil)
        }
    }
    // swiftlint:disable:next line_length
    func tappedApplePay(from viewController: UIViewController, transactionData: [String: Any], completion: @escaping (PaymentRepresentable?, NSError?) -> Void) {
        self.setupPaymentRequest(for: transactionData) { (paymentRequest, error) in
            if let error = error {
                completion(nil, error as NSError)
                return
            }
            guard let request = paymentRequest else { return }
            // swiftlint:disable:next line_length
            // Example: Promote PKPaymentAuthorizationViewController to optional so that we can verify
            // that our paymentRequest is valid. Otherwise, an invalid paymentRequest would crash our app.
            if let vc = PKPaymentAuthorizationViewController(paymentRequest: request) as PKPaymentAuthorizationViewController? {
                vc.delegate = self
                viewController.present(vc, animated: true, completion: nil)
            } else {
                print("Error: Payment request is invalid.")
            }
        }
    }
}
*/
