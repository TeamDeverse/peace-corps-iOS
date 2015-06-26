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
    
    var temp: Job!
    var tempIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.showingOnlyFavorites == false{
            single.filter(self.urlString)
        }
        else{
            single.showFavorites()
        }
        //println("it's loaded...kinda b")
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let shared = single.numOfElements()
        if single.numOfElements()==0{
            self.title = "No results found"
        }
        else if single.numOfElements()==1{
            self.title = "Found \(single.numOfElements()) opening"
        }
        else if single.numOfElements()==99{
            self.title = "Found \(single.numOfElements())+ openings"
        }
        else{
            self.title = "Found \(single.numOfElements()) openings"
        }
        return single.numOfElements()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: tempIndex, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // set the type of cell based on the storyboard cell prototype and associated class
        var cell:resultsCellView = tableView.dequeueReusableCellWithIdentifier("ResultsCell", forIndexPath: indexPath) as! resultsCellView
        
        
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
            
            // skip to the right place in the head
            //var temp1 = fitting.headNode
            //for var i = 0; i < (tempIndex); ++i {
            //    temp1 = temp1.next!
            //}
            
            // Assign the variable to the value from the node here
            // instead of all this.. just pass the job INDEX in the singleton.
            
            var destinationVC:ResultEntryController = ResultEntryController()
            destinationVC = segue.destinationViewController as! ResultEntryController
            destinationVC.indexRow = tempIndex
            
        }
    }

}
