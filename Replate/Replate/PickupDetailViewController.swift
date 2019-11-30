//
//  PickupDetailViewController.swift
//  Replate
//
//  Created by Rick Wolter on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class PickupDetailViewController: UIViewController {

    var pickupRequest: PickupRequest?
    var pickupRequestController: PickupRequestController?
    
    @IBOutlet weak var businessTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var volunteerTextField: UITextField!
    @IBOutlet weak var waitingForPickupLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func donateButtoneTapped(_ sender: UIBarButtonItem) {
        
        if (pickupRequest == nil) {

            guard let pickupRequestController = pickupRequestController, let business = businessTextField.text, let type = typeTextField.text,let volunteer = volunteerTextField.text else {return}
           
//            if let business = businessTextField.text, let type = typeTextField.text, let volunteer = volunteerTextField.text {
//                print("\(business),\(type),\(volunteer)")
//            }
//                       !business.isEmpty, let type = typeTextField.text,
//                    !type.isEmpty,let volunteer = volunteerTextField.text,
//                       !volunteer.isEmpty  else { return }
            guard  let pickupAmount = Int(amountTextField.text!) else { return }
                    //print("pickup created with \(business),\(type),\(volunteer),\(pickupAmount)!!!")
            pickupRequestController.createpickupRequest(business: business,foodType: type, amount: pickupAmount, assignVolunteer: volunteer)
           //print("pickup created I think!!!")
            
               } else {
                   guard let pickupRequestController = pickupRequestController,
                       let pickupRequest = pickupRequest,
                          let business = businessTextField.text,
                          !business.isEmpty,let type = typeTextField.text,
                       !type.isEmpty, let pickupAmount = Int(amountTextField.text ?? "1"),
                           let volunteer = volunteerTextField.text,
                          !volunteer.isEmpty  else { return }
                   
            pickupRequestController.updatePickupRequest(pickupRequest: pickupRequest, business: business,foodType: type, amount: pickupAmount, assignVolunteer: volunteer)
                  
               }
    
           }
           
        
    
    
    func updateViews() {
           if (pickupRequest == nil) {
               self.title = "Add a new pick up."
           } else {
            if let businessTitle = pickupRequest?.business {
                self.title = "\(businessTitle)'s Donation"
            }
            
            businessTextField.text = pickupRequest?.business
            typeTextField.text = pickupRequest?.foodType
            if let amount = pickupRequest?.amount {
             let amountString = String(amount)
            amountTextField.text = amountString
            }
            volunteerTextField.text = pickupRequest?.assignVolunteer
            waitingForPickupLabel.text = "Waiting for pickup."
            
           }
       }
       

}
