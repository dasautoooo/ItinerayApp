//
//  UIButtonExtensions.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/21/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton() {
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
