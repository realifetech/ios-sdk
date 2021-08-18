//
//  OrderingJourneyViewController.swift
//  RealifeTech
//
//  Created by Mickey Lee on 18/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public final class OrderingJourneyViewController: UIHostingController<OrderingJourneyView> {

    init(urlString: String) {
        super.init(rootView: OrderingJourneyView(urlString: urlString))
        rootView.dismiss = dismiss
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
