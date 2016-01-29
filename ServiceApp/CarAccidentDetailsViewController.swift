//
//  CarAccidentDetailsViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 29/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class CarAccidentDetailsViewController : UITableViewController {
    
    var damages = [CarDamage]( )
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return damages.count
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 3 {
            return 160.0
        } else {
            return 44.0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Localizare"
        case 1:
            return "Stare Masina"
        case 2:
            return "Avarii"
        case 3:
            return "Informatii suplimentare"
        default:
            return "Altele"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("location")! as UITableViewCell
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Adresa"
                cell.detailTextLabel?.text = "Splaiul Independentei nr.154, Sector 5, Bucuresti"
            case 1:
                cell.textLabel?.text = "Longitudine"
                cell.detailTextLabel?.text = "34.3242342342321"
            case 2:
                cell.textLabel?.text = "Latitudine"
                cell.detailTextLabel?.text = "44.232323232432"
            default:
                cell.textLabel?.text = "Altele"
                cell.detailTextLabel?.text = "N/A"
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("carStatus")! as UITableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("damage")! as UITableViewCell
            cell.textLabel?.text = damages[indexPath.row].description
            return cell
        case 3:
            return tableView.dequeueReusableCellWithIdentifier("additionalInfo")! as UITableViewCell
        default:
            return tableView.dequeueReusableCellWithIdentifier("additionalInfo")! as UITableViewCell
        }
    }


    
}
