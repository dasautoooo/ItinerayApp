//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Leonard Chen on 3/19/19.
//  Copyright © 2019 Leonard Chen. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
        
        view.backgroundColor = Theme.background
        
        addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                // Perform Delete
                TripFunctions.deleteTrip(index: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true)

        }
        
        delete.image = #imageLiteral(resourceName: "Delete")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> Void) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            
            actionPerformed(true)
        }
        
        edit.image = #imageLiteral(resourceName: "Edit")
        edit.backgroundColor = UIColor(named: "EditColor")
        return UISwipeActionsConfiguration(actions: [edit])
    }
}
