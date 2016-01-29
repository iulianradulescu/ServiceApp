//
//  ProblemReportingViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 19/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class ProblemReportingViewController: UITableViewController, MarkerSelectionDelegate {
    
    var car: CarDetails?
    var markers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add a navigation button item
        let sendMessage = UIBarButtonItem(title: "Trimite", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("sendMessage"))
        self.navigationItem.rightBarButtonItem = sendMessage
    }
    
    func sendMessage( ) {
        //TODO; send message and save it
        
        //display an alert and on ok, dismiss the controller
        let info = UIAlertController(title: "Transmitere Mesaj", message: "Mesajul dumneavoastra a fost comunicat catre service. In ce mai scurt timp veti fi contactat de un reprezentant pentru a va ajuta", preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
            self.navigationController!.popViewControllerAnimated(true)
        }
        
        info.addAction( ok )
        self.presentViewController(info, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 160.0
        } else {
            return 44.0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = car!.name
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return markers.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Localizare"
        case 1:
            return "Martori de bord"
        case 2:
            return "Informatii suplimentare"
        default:
            return "Altele"
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 1 {
            //add an extra button to the right if not exists   
            if let last = view.subviews.last {
                if last.isKindOfClass(UIButton) {
                    return;
                }
            }
            
            let button = UIButton(type: UIButtonType.System)
            button.frame = CGRectMake(view.frame.size.width - 100.0, 0.0, 100.0, view.frame.size.height);
            button.setTitle("Selecteaza", forState: UIControlState.Normal)
            button.addTarget(self, action: Selector("sectionHeaderButtonPressed"), forControlEvents: UIControlEvents.TouchUpInside)
            
            view.addSubview( button )
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMarkers" {
            let navController = segue.destinationViewController as! UINavigationController
            let controller = navController.topViewController! as! MarkerCollectionViewController
            
            for marker in self.markers {
                controller.selectedMarkers.insert( marker )
            }
            
            controller.markerSelectionDelegate = self
        }
    }
    
    func sectionHeaderButtonPressed( ) {
        //perform a segue
        self.performSegueWithIdentifier("showMarkers", sender: self)
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
            let cell = tableView.dequeueReusableCellWithIdentifier("marker")! as UITableViewCell
            cell.textLabel?.text = markers[indexPath.row]
            return cell
        case 2:
            return tableView.dequeueReusableCellWithIdentifier("additionalInfo")! as UITableViewCell
        default:
            return tableView.dequeueReusableCellWithIdentifier("additionalInfo")! as UITableViewCell
        }
    }
    
    func saveMarkers(selectedMarkers:[String]) {
        self.markers = selectedMarkers
        self.tableView.reloadData()
    }

}

