//
//  TripModel.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/19/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import Foundation

class TripModel {
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}
