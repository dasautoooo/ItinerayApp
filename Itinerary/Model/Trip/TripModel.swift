//
//  TripModel.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/19/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import Foundation

class TripModel {
    let id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
