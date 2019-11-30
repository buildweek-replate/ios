//
//  pickupRequestController.swift
//  Replate
//
//  Created by Rick Wolter on 11/21/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation



class PickupRequestController {
    
    var pickupRequests = [PickupRequest]()
    init() {
        loadFromPersistentStore()
    }
    
    
     var pickupRequestListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let filename = "Replate.plist"
        return dir.appendingPathComponent(filename)
    }
    
    
    
    
    func createpickupRequest(business: String, foodType : String, amount : Int, assignVolunteer: String,completed: Bool = false ) {
        let pickupRequest = PickupRequest(business: business, foodType: foodType, amount: amount, assignVolunteer: assignVolunteer, completed: completed)
           pickupRequests.append(pickupRequest)
        print("pickup created with \(pickupRequest)")
           saveToPersistentStore()
       }
       
       func deletepickupRequest(_ pickupRequest: PickupRequest) {
           guard let pickupRequestIndex = pickupRequests.firstIndex(of: pickupRequest) else { return }
           pickupRequests.remove(at: pickupRequestIndex)
           saveToPersistentStore()
       }
    
    func updatePickupRequest(pickupRequest: PickupRequest, business: String, foodType : String, amount : Int, assignVolunteer: String,completed: Bool = false ) {
    guard let pickUpIndex = pickupRequests.firstIndex(of: pickupRequest) else { return }
        pickupRequests[pickUpIndex].business = business
        pickupRequests[pickUpIndex].foodType = foodType
        pickupRequests[pickUpIndex].amount = amount
        pickupRequests[pickUpIndex].assignVolunteer = assignVolunteer
        
        
        
    }
    
//    func updateRequestPickedUp() {
//
//        guard let pickUpIndex = pickupRequests.firstIndex(of: pickupRequest) else { return }
//
//    if (pickupRequest.pickedUp) {
//        pickupRequests[pickUpIndex].pickedUp = false
//    } else {
//        pickupRequests[pickUpIndex].pickedUp = true
//    }
//    saveToPersistentStore()
//    }
    
    
    
    private func saveToPersistentStore() {
           guard let url = pickupRequestListURL else { return }
           
           do {
               let encoder = PropertyListEncoder()
               let pickupRequestsData = try encoder.encode(pickupRequests)
               try pickupRequestsData.write(to: url)
           } catch {
               print("Error saving Pickup Requests data: \(error)")
           }
       }
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = pickupRequestListURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let pickupData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPickups = try decoder.decode([PickupRequest].self, from: pickupData)
            pickupRequests = decodedPickups
        } catch {
            print("Error loading books data: \(error)")
        }
    }
    
    
    
    
}
