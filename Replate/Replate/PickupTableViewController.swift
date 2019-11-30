//
//  PickupTableViewController.swift
//  Replate
//
//  Created by Rick Wolter on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class PickupTableViewController: UITableViewController {

    var apiController = APIController()
    var pickupRequestController = PickupRequestController()
    
    
    
     override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           tableView.reloadData()
           // transition to login view if conditions require
//           if apiController.bearer == nil {
//               performSegue(withIdentifier: "LoginViewModalSegue", sender: self)
//           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        //pickupRequestController.createpickupRequest(business: "sonny", foodType: "Peas", amount: 12, assignVolunteer: "Doug")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pickupRequestController.pickupRequests.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        print("Before the cell assignment")
        let pickupRequest = pickupRequestController.pickupRequests[indexPath.row]
        cell.textLabel?.text = pickupRequest.business
        print("After the cell assignment \(cell.textLabel?.text)")

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       if (segue.identifier == "addSegue") {
       if let addVC = segue.destination as? PickupDetailViewController {
           addVC.pickupRequestController = pickupRequestController
        }
           
        
       } else if (segue.identifier == "detailSegue"){
        print("This should be detail VC")
            if let detailVC = segue.destination as? PickupDetailViewController,  let indexPath = tableView.indexPathForSelectedRow {
                detailVC.pickupRequestController = pickupRequestController
                detailVC.pickupRequest = pickupRequestController.pickupRequests[indexPath.row]
            }
            
            }
        }
    }
    


