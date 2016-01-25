//
//  UserDetailsViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 15/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class UserDetailsViewController: UITableViewController {
    
    var cars = [CarDetails]( )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: here we should take the cars from the savings
        //cars = [String]( )
        cars.append(CarDetails(manufacturer:"Mercedes", model:"C180",VIN:"12345678"))
        cars.append(CarDetails(manufacturer:"BMW", model:"M6",VIN:"12345678"))
        //add at the end an entry for adding a new car
        cars.append(CarDetails(manufacturer:"Masina Noua", model:"",VIN:""))
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return cars.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "UTILIZATOR"
        } else {
            return "MASINA MEA"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCellWithIdentifier("name")! as UITableViewCell
            case 1:
                return tableView.dequeueReusableCellWithIdentifier("email")! as UITableViewCell
            case 2:
                return tableView.dequeueReusableCellWithIdentifier("phone")! as UITableViewCell
            case 3:
                return tableView.dequeueReusableCellWithIdentifier("street")! as UITableViewCell
            case 4:
                return tableView.dequeueReusableCellWithIdentifier("city")! as UITableViewCell
            default:
                return tableView.dequeueReusableCellWithIdentifier("carDetails")! as UITableViewCell
            }
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("carDetails")! as UITableViewCell
            cell.textLabel?.text = cars[indexPath.row].manufacturer + " " + cars[indexPath.row].model
            cell.detailTextLabel?.text = "VIN: " + cars[indexPath.row].VIN
            return cell;
        }
    }
    
    
}