//
//  Business.swift
//  Replate
//
//  Created by Rick Wolter on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation


//Authenticated `business` can create,read,  update and delete a `businessProfile`. At a minimum, this must include the following properties: (mobile, web)
//- `username`: String
//- `businessName`: String
//- `businessAddress`: String
//- `phoneNumber`

class Business: Codable {
    
    
    var userName: String = ""
    var businessName: String = ""
    var businessAddress: String
    var phoneNumber: String
    
    
    init(username: String, businessName: String, businessAddress: String, phoneNumber: String){
        self.userName = username
        self.businessName = businessName
        self.businessAddress = businessAddress
        self.phoneNumber = phoneNumber
        
    }
    
    
}
