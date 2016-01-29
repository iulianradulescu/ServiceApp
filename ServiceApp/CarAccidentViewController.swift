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
    var damages = [CarDamage]( )
    var selectedDamages = [CarDamage]( )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextBtn = UIBarButtonItem(title: "Continua", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("nextStep"))
        self.navigationItem.rightBarButtonItem = nextBtn
        
        damages = CarDamage.allCarDamages()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = car!.name
    }
    
    @IBAction func toggleAccidentMarker(sender: UIButton) {
        //check to see if it is on or off
        let marker = sender.titleForState(UIControlState.Normal)!
        if let idx = CarDamage.findElementFor(marker, inArray: selectedDamages) {
            //we turn it off
            selectedDamages.removeAtIndex(idx)
            sender.setImage(UIImage(named: "checkmarkOff"), forState: UIControlState.Normal)
        } else {
            let idx = CarDamage.findElementFor(marker, inArray: damages)!
            selectedDamages.append(damages[idx])
            sender.setImage(UIImage(named: "checkmarkOn"), forState: UIControlState.Normal)
        }
        
        print(selectedDamages)
    }
    func nextStep( ) {
        self.performSegueWithIdentifier("accidentDetails", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "accidentDetails" {
            let destController = segue.destinationViewController as! CarAccidentDetailsViewController
            destController.damages = self.selectedDamages
        }
    }
}