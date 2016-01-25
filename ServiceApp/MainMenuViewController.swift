//
//  ViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 15/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    var cars = [CarDetails]( )
    var selectedCar: CarDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: here we should take the cars from the savings
        //cars = [String]( )
        cars.append(CarDetails(manufacturer:"Mercedes", model:"C180",VIN:"12345678"))
        cars.append(CarDetails(manufacturer:"BMW", model:"M6",VIN:"12345678"))
        cars.append(CarDetails(manufacturer:"Audi", model:"A4",VIN:"32432432"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reportProblem(sender: UIButton) {
        self.doPerformSegue("ReportProblem")
    }
    
    
    @IBAction func scheduleAtService(sender: UIButton) {
       //self.doPerformSegue("ReportAccident")
    }
    
    @IBAction func reportAnAccident(sender: UIButton) {
        self.doPerformSegue("ReportAccident")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ReportProblem" {
            let controller = segue.destinationViewController as! ProblemReportingViewController
            controller.car = self.selectedCar
        } else if segue.identifier == "ReportAccident" {
            let controller = segue.destinationViewController as! CarAccidentViewController
            controller.car = self.selectedCar
        }
    }
    
    func doPerformSegue(identifier: String) {
        let carSelection = UIAlertController(title: "Lista masini", message: "Selecteaza o masina", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        carSelection.addAction( cancelAction )
        
        for car in cars {
            let action = UIAlertAction(title: car.manufacturer + " " + car.model,
                style: UIAlertActionStyle.Default){ alertAction in
                    //mark the selected car
                    self.selectedCar = car
                    //we perform a segue
                    self.performSegueWithIdentifier(identifier, sender: self)
            }
            
            carSelection.addAction(action)
        }
        
        self.presentViewController(carSelection, animated: true, completion: nil)
    }
}

