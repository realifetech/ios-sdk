//
//  RLTViewCreatable.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI

public protocol RLTViewCreatable: RLTCreatable {
    func embed(in containerView: UIView, on parentViewController: UIViewController)
    var unwrappedGenericView: AnyView? { get }
}

extension RLTViewCreatable where Self: UIViewController {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        embed(in: containerView, on: parentViewController)
    }
    var unwrappedGenericView: AnyView? { return nil }
}

public extension RLTViewCreatable where Self: View {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        let hostingController = UIHostingController(rootView: self)
        hostingController.view.backgroundColor = .clear
        hostingController.embed(in: containerView, on: parentViewController)
    }
    var unwrappedGenericView: AnyView? { return AnyView(self) }
}

private extension UIViewController {
    func embed(in containerView: UIView, on parentViewController: UIViewController) {
        view.frame = containerView.bounds
        containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: containerView.topAnchor),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        parentViewController.addChild(self)
        didMove(toParent: parentViewController)
    }
}
