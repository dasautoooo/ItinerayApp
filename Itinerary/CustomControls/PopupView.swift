//
//  PopupView.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/21/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

class PopupView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.background
    }

}
