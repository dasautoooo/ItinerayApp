//
//  TripModel.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/19/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

class TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
