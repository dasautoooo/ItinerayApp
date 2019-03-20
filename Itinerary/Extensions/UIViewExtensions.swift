//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/20/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

extension UIView {
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
