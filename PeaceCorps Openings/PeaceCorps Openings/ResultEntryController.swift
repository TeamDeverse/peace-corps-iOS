//
//  ResultEntryController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit
//let single = Singleton() // singleton already available everywhere

class ResultEntryController: UIViewController {

    // information form segue gets put here
    var indexRow: Int!
    var jobEntry: Job!
    
    // the labels in the UI
    @IBOutlet var entryTitle: UILabel!
    @IBOutlet var sector: UILabel!
    @IBOutlet var openSpots: UILabel!
    @IBOutlet var dates: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var paragraphTitle: UILabel!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    
    
    // built in funcitons
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:225/256, green:223/256,blue:198/256,alpha:1.0)
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            descriptionTextView.font = UIFont(name: descriptionTextView.font.fontName, size: 22)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // STEP 3: using the variables passed in to set the UI views on load
        //println("chekcing sector label")
        //println(sectorLabel)
        // here, set all the elements accordingly
        
        self.jobEntry = single.getJobFromIndex(indexRow)
        
        
        entryTitle.text = self.jobEntry.title
        sector.text = self.jobEntry.sector
        //descriptionTextView.text = self.jobEntry.project_description
        setTextviewContent()
        
        // configure dates:
//        let datStringDefs = "Apply date / Know date / Start date"
//        let datString =
        dates.text = "Apply date / Know date / Start date\n\(self.jobEntry.apply_date) / \(self.jobEntry.know_by) / \(self.jobEntry.staging_start_date)"
        self.title = (self.jobEntry.country+", "+self.jobEntry.region).capitalizedString
        
        if self.jobEntry.volunteers_requested == 1 {
            self.openSpots.text = String(self.jobEntry.volunteers_requested)+" spot"
        }
        else{
            self.openSpots.text = String(self.jobEntry.volunteers_requested)+" spots"
        }
        
        // setup favorites
        if jobEntry.favorited==true{
            favoriteButton.setImage(UIImage(named:"Star-Favorites"), forState: .Normal)
        }
        else{
            favoriteButton.setImage(UIImage(named:"star_none"), forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // toggle favorites
    @IBAction func toggleFavorite(sender: AnyObject) {
        if jobEntry.favorited == false{
            // call singleton, make it True
            favoriteButton.setImage(UIImage(named:"Star-Favorites"), forState: .Normal)
            jobEntry.favorited = true
            single.setJobAtIndex(indexRow, updateJob: jobEntry)
        }
        else{
            // call singleton, make it False
            favoriteButton.setImage(UIImage(named:"star_none"), forState: .Normal)
            jobEntry.favorited = false
            single.setJobAtIndex(indexRow, updateJob: jobEntry)
        }
    }
    
    // callable by anything, done in viewDidLoad and by the segmentedControlChange
    func setTextviewContent(){
        switch segmentControl.selectedSegmentIndex{
        case 0:
            paragraphTitle.text = "Project Description"
            var couples = "Position does not accept couples"
            if jobEntry.accepts_couples{
                couples = "Position accepts couples"
            }
            descriptionTextView.text = jobEntry.title+"\n"+couples+"\n\n"+jobEntry.project_description
            
            // set the text of the paragraph to be the descirption!
        case 1:
            paragraphTitle.text = "Skills"
            
            descriptionTextView.text = "Required skills\n\n" + jobEntry.required_skills + "\n\nDesired skills\n\n"+jobEntry.desired_skills
            
        case 2:
            paragraphTitle.text = "Living Conditions"
            descriptionTextView.text = jobEntry.living_conditions_comments// + "\n\nCountry Medical Considerations\n\n"+jobEntry.country_medical_considerations // medical considerations is formatted for html, more parsing necessary
            
        default:
            break;
        }
    }
    
    @IBAction func segmentedControlChange(sender: AnyObject) {
        setTextviewContent()
    }
    
    @IBAction func gotoListing(sender: AnyObject) {
        // pass in listing URL
        UIApplication.sharedApplication().openURL(NSURL(string: jobEntry.opening_url)!)
    }
    @IBAction func gotoWebsite(sender: AnyObject) {
        // pass in local website
        UIApplication.sharedApplication().openURL(NSURL(string: jobEntry.country_site_url)!)
    }
}