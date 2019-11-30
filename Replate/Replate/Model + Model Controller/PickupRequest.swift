//
//  Donation.swift
//  Replate
//
//  Created by Rick Wolter on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation


//Authenticated `business` can create a `pickupRequest` that must include the following properties: (mobile, web)
//- `type` of food item: String
//- `amount` of food item by count/weight: Integer
//- `preferredPickupTime`: datetime

struct PickupRequest: Codable, Equatable {
    
    var business: String
    var foodType: String
    var amount: Int
    var assignVolunteer: String
    var pickedUp: Bool = false
   // var identifier = UUID()

    
    
    init(business: String,foodType: String, amount: Int ,assignVolunteer: String ,completed: Bool = false) {
        self.business = business
        self.foodType = foodType
        self.amount = amount
        self.assignVolunteer = assignVolunteer
        self.pickedUp = completed
    }
    

//    name: "New Food Item",
//    time: "113033",
//    description: "Wow look at this food to be donated",
//    is_claimed: "0", //0 if false, 1 if true
//    pickup_date: “01/01/2019“

    
}
