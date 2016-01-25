//
//  CarSelectionViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 18/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class CarSelectionViewController : UITableViewController {
    var cars = [CarDetails]( )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: here we should take the cars from the savings
        //cars = [String]( )
        cars.append(CarDetails(manufacturer:"Mercedes", model:"C180",VIN:"12345678"))
        cars.append(CarDetails(manufacturer:"BMW", model:"M6",VIN:"12345678"))
        cars.append(CarDetails(manufacturer:"Audi", model:"A4",VIN:"32432432"))        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("car")! as UITableViewCell
        cell.textLabel?.text = cars[indexPath.row].manufacturer + " " + cars[indexPath.row].model
        cell.detailTextLabel?.text = "VIN: " + cars[indexPath.row].VIN
        return cell;
    }
}