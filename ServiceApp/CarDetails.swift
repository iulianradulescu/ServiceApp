//
//  File.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 16/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation

struct CarDetails {
    var manufacturer: String
    var model : String
    var VIN: String
    
    var name: String {
        get {
            return manufacturer + " " + model
        }
    }
}