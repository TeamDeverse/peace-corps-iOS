//
//  ResultEntryController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class ResultEntryController: UIViewController {
    
    // information form segue gets put here
    var titleString : String!
    var favoriteStatus = false
    
    // the labels in the UI
    @IBOutlet var entryTitle: UILabel!
    @IBOutlet var sector: UILabel!
    @IBOutlet var countryRegion: UILabel!
    @IBOutlet var openSpots: UILabel!
    @IBOutlet var dates: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var paragraphTitle: UILabel!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    
    
    // built in funcitons
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTitle.text = titleString
        // (note to self: possibly may need to setters above here instead)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // here, set all the elements accordingly
        entryTitle.text = titleString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // toggle favorites
    @IBAction func toggleFavorite(sender: AnyObject) {
        if favoriteStatus == false{
            // call singleton, make it True
            println("toggled to true")
            favoriteButton.setImage(UIImage(named:"star_none"), forState: .Normal)
            favoriteStatus = true
        }
        else{
            // call singleton, make it False
            println("toggled to false")
            favoriteButton.setImage(UIImage(named:"Star-Favorites"), forState: .Normal)
            favoriteStatus = false
        }
    }
    
    @IBAction func segmentedControlChange(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            paragraphTitle.text = "Project Description"
            // set the text of the paragraph to be the descirption!
        case 1:
            paragraphTitle.text = "Required Skills"
        case 2:
            paragraphTitle.text = "Living Conditions"
        default:
            break;
        }
    }
    
    // if user presses the button at the bottom, opens website
    // another variable field that needs setting
    @IBAction func gotoWebsite(sender: AnyObject) {
        // pass in local website/read that var
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.peacecorps.gov/")!)
    }
}