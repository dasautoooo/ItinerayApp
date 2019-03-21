//
//  AppUIButton.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/21/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(.white, for: .normal)
    }

}
