//
//  ReferenceData.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 30/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation

struct CarDamage {
    var code: String
    var description: String
    
    static func allCarDamages( ) -> [CarDamage] {
        var damagesDict: NSDictionary?
        var damages = [CarDamage]( )
        if let path = NSBundle.mainBundle().pathForResource("DamagesReferenceData", ofType: "plist") {
            damagesDict = NSDictionary(contentsOfFile: path)
        }
        
        if let dictionary = damagesDict {
            for (code, description) in dictionary {
                damages.append(CarDamage(code: code as! String, description: description as! String))
            }
        }
        
        return damages
    }
    
    static func findElementFor(code: String, inArray: [CarDamage]) -> Int? {
        let index = inArray.indexOf({$0.code == code})
        return index
    }
}

struct BoardMarker {
    var code: String
    var description: String
}