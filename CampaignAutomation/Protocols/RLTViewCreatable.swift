//
//  RLTViewCreatable.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI

protocol RLTViewCreatable: RLTCreatable {
    func embed(in containerView: UIView, on parentViewController: UIViewController)
}

extension RLTViewCreatable where Self: UIViewController {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        embed(in: containerView, on: parentViewController)
    }
}

private extension UIViewController {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        view.frame = containerView.bounds
        containerView.addSubview(view)
        parentViewController.addChild(self)
        didMove(toParent: parentViewController)
    }
}

extension RLTViewCreatable where Self: View {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        let hostingController = UIHostingController(rootView: self)
        hostingController.view.backgroundColor = .clear
        hostingController.embed(in: containerView, on: parentViewController)
    }
}
