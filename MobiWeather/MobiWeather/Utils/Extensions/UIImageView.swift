//
//  UIImageView.swift
//  MobiWeather
//
//  Created by Parth Adroja on 12/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString : String?, indicator: Bool = true) {
        if indicator {
            self.kf.indicatorType = .activity
        }
        if let imageUrl = urlString, !imageUrl.isEmpty {
            self.kf.setImage(with: URL(string: imageUrl))
        } else {
            self.image = UIImage(named: "img_cloud_day")
        }
    }
}
