//
//  OrderingJourneyViewController.swift
//  RealifeTech
//
//  Created by Mickey Lee on 18/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public class OrderingJourneyViewController: UIHostingController<OrderingJourneyView> {

    init(urlString: String, colorStore: ColorStorable) {
        super.init(
            rootView: OrderingJourneyView(urlString: urlString, colorStore: colorStore))
        rootView.dismiss = dismiss
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        return nil
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
