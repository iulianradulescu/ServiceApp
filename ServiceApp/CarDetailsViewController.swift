//
//  CarDetailsViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 16/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class CarDetailsViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add left and right navigation bar itesms
    }
    @IBAction func cancelEditing(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveEditing(sender: UIBarButtonItem) {
        //TODO: perform some actual savings
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}