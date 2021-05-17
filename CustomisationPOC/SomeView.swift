//
//  SomeView.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

class SomeView: UIView {
    static let xibName = "SomeView"
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customFontLabel: UILabel!
    @IBOutlet weak var arbitraryValueLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle.contentResourceBundle
        let nib = UINib(nibName: SomeView.xibName, bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            self.addSubview(view)
            contentView.constrainToFill(self)
        }
    }
}
