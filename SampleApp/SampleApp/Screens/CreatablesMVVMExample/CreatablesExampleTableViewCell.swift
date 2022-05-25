//
//  CreatablesExampleTableViewCell.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/5/25.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import UIKit
import RealifeTech

class CreatablesExampleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupBannerView(_ banner: RLTBanner) {
        // set up banner view
        textLabel?.text = banner.title
    }

}
