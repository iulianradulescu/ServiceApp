//
//  MarkerCollectionViewController.swift
//  ServiceApp
//
//  Created by Iulian Radulescu on 18/01/16.
//  Copyright © 2016 Iulian Radulescu. All rights reserved.
//

import Foundation
import UIKit

class MarkerCollectionViewController : UICollectionViewController {
    
    var selectedMarkers = Set<String>()
    
    var markerSelectionDelegate: MarkerSelectionDelegate?
    
    var markers = ["M1","M2", "M3", "M4", "M5", "M6","M7","M8", "M9","M10"]

    
    @IBAction func saveSelection(sender: AnyObject) {
        self.markerSelectionDelegate?.saveMarkers(selectedMarkers.filter({ $0 == $0}))
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return markers.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MarkerViewCell", forIndexPath: indexPath) as! MarkerCollectionViewCell
        
        //TODO: here we should have an image for each marker
        cell.marker.setImage(UIImage(named: "MM"), forState: UIControlState.Normal)
        cell.value = markers[indexPath.row]
        
        cell.delegate = self
        
        if selectedMarkers.contains(markers[indexPath.row]) {
            cell.toggleMarkerSelection()
        }
        
        return cell
    }
}

extension MarkerCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width:80, height:80)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    }
}

extension MarkerCollectionViewController: IndividualMarkerDelegate {
    func addMarker(marker: String) {
        self.selectedMarkers.insert(marker)
    }
    
    func removeMarker(marker: String) {
        self.selectedMarkers.remove(marker)
    }
}

protocol MarkerSelectionDelegate {
    func saveMarkers(selectedMarkers:[String])
}

protocol IndividualMarkerDelegate {
    func addMarker(marker: String)
    func removeMarker(marker: String)
}