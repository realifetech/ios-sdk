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
        Bundle(for: Self.self).loadNibNamed(Self.xibName, owner: self, options: nil)
        contentView.constrainToFill(self)
    }

}
