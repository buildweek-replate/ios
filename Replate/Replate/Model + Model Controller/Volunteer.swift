//
//  Volunteer.swift
//  Replate
//
//  Created by Rick Wolter on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class Volunteer: Codable {
    
    
    let userName: String
    let volunteerName: String
    let password: String
    let  phoneNumber: String
  
   
    
    init(userName: String, volunteerName: String = "", password: String, phoneNumber: String = "") {
        self.userName = userName
        self.volunteerName = volunteerName
        self.password = password
        self.phoneNumber = phoneNumber
    }
    
    
    
    
    
    
    
    
    }
    
    
