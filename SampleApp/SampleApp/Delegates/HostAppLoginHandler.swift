//
//  HostAppLoginHandler.swift
//  SampleApp
//
//  Created by Ross Patman Work on 24/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech

/*
    Whether you launch host app login via deep link or manually before opening the web view,
    the web view should be updated with the token details.
 */

class HostAppLoginHandler {

    var window: UIWindow?
    var loginVC: ExampleLoginViewController?

    func handleHostAppLoginIfNecessary(url: URL?) -> Bool {
        if RealifeTech.Identity.isHostAppLoginDeepLink(url: url) {
            loginVC = createLoginViewController()
            window?.rootViewController?.show(loginVC ?? UIViewController(), sender: nil)
            return true
        }
        return false
    }

    func createLoginViewController() -> ExampleLoginViewController {
        return ExampleLoginViewController(completion: { email, firstName, lastName in
            self.fetchSalt { salt in
                RealifeTech.Identity.attemptLogin(emailAddress: email,
                                                  firstName: firstName,
                                                  lastName: lastName,
                                                  salt: salt) { error in
                    if let error = error {
                        print(error)
                    } else {
                        print("success")
                        self.dismissLoginVC()
                    }
                }
            }
        })
    }

    func fetchSalt(completion: (String) -> Void) {
        completion("saltexample")
    }

    // Dismiss your login flow + activity indicator
    func dismissLoginVC() {
        loginVC?.dismiss()
        loginVC = nil
    }
}
