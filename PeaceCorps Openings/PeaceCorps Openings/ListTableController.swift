//
//  ListTableController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit
let single = Singleton()
let arrays = SelectCategoryView()

//class ListTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
class ListTableController: UITableViewController {
    // let data = data()
    var fitting = JobList()
    var temp = Node<Job>()
    var start = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        var region = arrays.region()
        var sector = arrays.sector()
        println(region)
        fitting = single.filter(region, sectorArray: sector)
        println("it's loaded...kinda b")
        //tableView.backgroundColor = UIColor.grayColor()
        // cell.backgroundColor = UIColor.clearColor() // use this once a nice background color is used
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shared = single.numOfElements()
        println("Number of elements passed in (rows):")
//        temp = temp.next!
        println(shared)
        return shared
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // set the type of cell based on the storyboard cell prototype and associated class
        var cell:resultsCellView = tableView.dequeueReusableCellWithIdentifier("ResultsCell", forIndexPath: indexPath) as resultsCellView
        if (start == 0){
            temp = fitting.headNode
        }
        else{
            if(temp.next != nil){
                temp = temp.next!
            }
            else{
                return cell
            }
        }
        //
        // HERE we should take the information for the ith back end element of the list (i=indexPath.row)
        // and set the following elements to show this.
        //
        // set fields from passed in data
        cell.titleLabel!.text = temp.value?.title
        cell.sectorLabel!.text = temp.value?.sector
        cell.countryRegionLabel!.text = temp.value?.region
        cell.departByLabel!.text = temp.value?.staging_start_date
        // temporary test variable, should read from the passed in data
        var sectorname = "agriculture"
        start = 1
        // arrays for checking and setting which image to use
        let sectormatcharray = ["agriculture","etc"]
        let sectorimgsarray = ["sectoragriculture.jpg","etc"]
        
        // set the correct sector image icon
        for i in 0...(sectormatcharray.count-1){
            println(i)
            if sectorname == sectormatcharray[i]{
                cell.imgView.image = UIImage(named:sectorimgsarray[i])
            }
        }
        // default case = no image, if there isn't a match
        return cell
    }
    
    
    // run the segue transition on tapping an entry
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("toResult", sender: indexPath);
//        // all the information to send
        println(indexPath.row)
        var temp1 = fitting.headNode
        for var i = 0; i < (indexPath.row); ++i {
            temp1 = temp1.next!
        }
        var openingTitle = temp1.value?.title // should come from listing, e.g. fitleredJobs[indexPath.row].title
        println(openingTitle)

//         setup the segue and so forth
        let destinationVC = ResultEntryController()
        destinationVC.titleString = openingTitle
        destinationVC.performSegueWithIdentifier("toResult", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "toResult") {
            var openingTitle = "The Listing Title" // hard coded right now, grab from incoming data!
            // add other variables here to pass, all the text
            
            println("Doing segue, hard coded title set...")
            println(openingTitle)
            
            var destinationVC:ResultEntryController = ResultEntryController()
            destinationVC = segue.destinationViewController as ResultEntryController
            destinationVC.titleString = openingTitle
            
        }
    }

}
