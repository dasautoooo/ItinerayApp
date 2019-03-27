//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/19/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
