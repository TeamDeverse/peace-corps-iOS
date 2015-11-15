//
//  ListTableController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit
let single = Singleton()

//class ListTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
class ListTableController: UITableViewController {
    
    
    // getting data from segue
    var urlString:String!
    var showingOnlyFavorites:Bool!
    
    // at first, cap the number of responses to return for faster viewing
    var loadLimited = false
    
    var temp: Job!
    var tempIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if self.showingOnlyFavorites == false{
            loadLimited=true
            // show a "load all button", only when pulling from website / when something has loaded
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshButton")
            // this actually grabs the results! And can be SLOW (hence initially limiting to 25)
            single.filter(self.urlString, limitload: loadLimited)
            
        }
        else{
            single.showFavorites()
        }
        //println("it's loaded...kinda b")
        
    }
    
    // pressing the icon to refresh all
    func refreshButton() {
        loadLimited = false
        single.filter(self.urlString, limitload: loadLimited)
        self.tableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshButton")
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let shared = single.numOfElements()
        if self.showingOnlyFavorites == false{
            if single.numOfElements()==0{
                self.title = "No results found"
            }
            else if (single.numOfElements()==25 && loadLimited){
                self.title = "25+ openings"
                
                if self.showingOnlyFavorites == false{
                    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load All", style: UIBarButtonItemStyle.Plain, target: self, action: "refreshButton")
                }
            }
            else if single.numOfElements()==1{
                self.title = "Found \(single.numOfElements()) opening"
            }
//            else if single.numOfElements()==99{
//                self.title = "Found \(single.numOfElements())+ openings"
//            }
            else{
                self.title = "Found \(single.numOfElements()) openings"
            }
            
            if Reachability.isConnectedToNetwork()==false{
                self.title="No connection"
                navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshButton")
            }
        }
        else{
            self.title = "Stored Favorites"
        }
        return single.numOfElements()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: tempIndex, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // set the type of cell based on the storyboard cell prototype and associated class
        let cell:resultsCellView = tableView.dequeueReusableCellWithIdentifier("ResultsCell", forIndexPath: indexPath) as! resultsCellView
        
        
        if single.numOfElements()==0{
            cell.titleLabel!.text = "No results found"
            return cell
        }
        
        temp = single.getJobFromIndex(indexPath.row) //jobArray[indexPath.row]
        //
        // HERE we should take the information for the ith back end element of the list (i=indexPath.row)
        // and set the following elements to show this.
        //
        // set fields from passed in data
        cell.titleLabel!.text = temp.title
        cell.sectorLabel!.text = temp.sector
        cell.countryRegionLabel!.text = (temp.country+", "+temp.region).capitalizedString
        cell.departByLabel!.text = "Departs: "+temp.staging_start_date
        cell.index = indexPath.row
        if temp.favorited{
            cell.favButton.setImage(UIImage(named:"Star-Favorites"), forState: .Normal)
        }
        else{
            cell.favButton.setImage(UIImage(named:"star_none"), forState: .Normal)
        }
        cell.backgroundColor = UIColor(red:225/256, green:223/256,blue:198/256,alpha:1)
        // temporary test variable, should read from the passed in data
        // also set the favorites button state.
        
        // arrays for checking and setting which image to use
        let sectormatcharray = ["Agriculture","Community","Education","Environment","Health","Youth","Youth in Development","Community Economic Development"]
        let sectorimgsarray = ["sectoragriculture.jpg","sectorcommunity.jpg","sectoreducation.jpg","sectorenvironment.jpg","sectorhealth.jpg","sectoryouth.jpg","sectoryouth.jpg","sectorcommunity.jpg"]
        
        // make similar arrays for the region.. then make background of cell colored and the actual
        // image be the region
        
        // set the correct sector image icon
        for i in 0...(sectormatcharray.count-1){
            //println(i)
            if temp.sector == sectormatcharray[i]{
                cell.imgView.image = UIImage(named:sectorimgsarray[i])
            }
        }
        // default case = no image, if there isn't a match
        return cell
    }
    
    
    // run the segue transition on tapping an entry
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tempIndex = indexPath.row // set this so we know how many in the linked list to move through // was before
        self.performSegueWithIdentifier("toResult", sender: indexPath);
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResult") {
            
            // Assign the variable to the value from the node here
            // instead of all this.. just pass the job INDEX in the singleton.
            
            var destinationVC:ResultEntryController = ResultEntryController()
            destinationVC = segue.destinationViewController as! ResultEntryController
            destinationVC.indexRow = tempIndex
            
        }
    }

}
