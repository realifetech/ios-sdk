//
//  SellImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public class SellImplementing: Sell {

    public let product: ProductProvidable
    public let basket: BasketProvidable
    public let order: OrderProvidable
    public let fulfilmentPoint: FulfilmentPointProvidable
    public let payment: PaymentProvidable
    public let colorStore: ColorStorable
    public let applicationURLOpener: ApplicationURLOpening

    public var orderingJourneyUrl: String
    public var orderingJourneyViewUpdater: OrderingJourneyViewUpdating

    public init(
        product: ProductProvidable,
        basket: BasketProvidable,
        order: OrderProvidable,
        fulfilmentPoint: FulfilmentPointProvidable,
        payment: PaymentProvidable,
        orderingJourneyUrl: String,
        colorStore: ColorStorable,
        applicationURLOpener: ApplicationURLOpening,
        orderingJourneyViewUpdater: OrderingJourneyViewUpdating
    ) {
        self.product = product
        self.basket = basket
        self.order = order
        self.fulfilmentPoint = fulfilmentPoint
        self.payment = payment
        self.orderingJourneyUrl = orderingJourneyUrl
        self.colorStore = colorStore
        self.applicationURLOpener = applicationURLOpener
        self.orderingJourneyViewUpdater = orderingJourneyViewUpdater
    }

    /// Get the Web Ordering Journey view controller with orderingJourneyUrl
    /// - Returns: UIHostingController<OrderingJourneyView>
    /// - Example:
    /// ```
    /// import SwiftUI
    ///
    /// let viewController = RealifeTech.Sell.createOrderingJourneyViewController()
    /// navigationController?.present(viewController, animated: true, completion: nil)
    /// ```
    public func createOrderingJourneyViewController() -> UIHostingController<OrderingJourneyView> {
        let oJVC = OrderingJourneyViewController(urlString: orderingJourneyUrl,
                                                 colorStore: colorStore,
                                                 javascriptRunDetails: orderingJourneyViewUpdater.javascriptRunDetails,
                                                 applicationURLOpener: applicationURLOpener)
        orderingJourneyViewUpdater.orderingJourneyView = oJVC.rootView
        return oJVC
    }

    /// Get the Web Ordering Journey SwiftUI view with orderingJourneyUrl
    /// - Returns: OrderingJourneyView (SwiftUI View)
    /// - Example:
    /// ```
    /// @State var isModal = false
    ///
    /// Button("Launch") {
    ///     isModal.toggle()
    /// }
    /// .sheet(isPresented: $isModal) {
    ///     RealifeTech.Sell.createOrderingJourneyView()
    /// }
    /// ```
    public func createOrderingJourneyView() -> OrderingJourneyView {
        let javascriptRunDetails = orderingJourneyViewUpdater.javascriptRunDetails
        let orderingJourneyView = OrderingJourneyView(urlString: orderingJourneyUrl,
                                                      colorStore: colorStore,
                                                      javascriptRunDetails: javascriptRunDetails,
                                                      applicationURLOpener: applicationURLOpener)
        orderingJourneyViewUpdater.orderingJourneyView = orderingJourneyView
        return orderingJourneyView
    }
}
