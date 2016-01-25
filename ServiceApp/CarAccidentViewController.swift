//
//  File.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 20/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class CarAccidentViewController : UIViewController {
    
    var car: CarDetails?
    var selectedMarkers = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextBtn = UIBarButtonItem(title: "Continua", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("nextStep"))
        self.navigationItem.rightBarButtonItem = nextBtn
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = car!.name
    }
    
    @IBAction func toggleAccidentMarker(sender: UIButton) {
        //check to see if it is on or off
        let marker = sender.titleForState(UIControlState.Normal)!
        if selectedMarkers.contains( marker ) {
            //we turn it off
            selectedMarkers.remove( marker )
            sender.setImage(UIImage(named: "checkmarkOff"), forState: UIControlState.Normal)
        } else {
            selectedMarkers.insert( marker )
            sender.setImage(UIImage(named: "checkmarkOn"), forState: UIControlState.Normal)
        }
    }
    func nextStep( ) {
        //go to the next screen
    }
}