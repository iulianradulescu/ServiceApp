//
//  MarkerCollectionViewCell.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 18/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class MarkerCollectionViewCell : UICollectionViewCell {
    
    var selectedMarker = false
    @IBOutlet weak var marker: UIButton!
    var value: String?
    
    var delegate: IndividualMarkerDelegate?
    
    @IBAction func selectMarker(sender: UIButton) {
        self.toggleMarkerSelection()
    }
    
    func toggleMarkerSelection( ) {
        selectedMarker = !selectedMarker
        //change a property to the image
        
        if selectedMarker {
            self.marker.alpha = 0.5
            delegate!.addMarker( value! )
        } else {
            self.marker.alpha = 1.0
            delegate!.removeMarker( value! )
        }
    }
}