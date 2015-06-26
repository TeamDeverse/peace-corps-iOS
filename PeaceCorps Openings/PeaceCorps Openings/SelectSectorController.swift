//
//  SelectSectorController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation
import UIKit

class SelectSectorController: UIViewController, UICollectionViewDataSource {
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var regionSelection: UICollectionView!
    // for previous segue data-passing
    var regionstring:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regionSelection.backgroundColor = UIColor.clearColor()
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            nextButton.titleLabel?.font = UIFont(name: nextButton.titleLabel!.font.fontName, size: 24)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // collection view stuff //
    
    let reuseIdentifier = "locationCell"
    
    var sectors: [(String, String, String, Bool)] = [
        ("", "", "",false),
        ("anything", "sectoranything.jpg", "Anything",true),
        ("", "", "",false),
        ("agriculture", "sectoragriculture.jpg", "Agriculture",false),
        ("Community%20Economic%20Development", "sectorcommunity.jpg","Community Economic Development",false),
        ("education", "sectoreducation.jpg", "Education",false),
        ("environment", "sectorenvironment.jpg", "Environment",false),
        ("health", "sectorhealth.jpg", "Health",false),
        ("Youth%20in%20Development", "sectoryouth.jpg", "Youth in Development",false)
    ]
    
    
    //CollectionView.delegate = self
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectors.count
    }
    
    // for cell size
    func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        // make the cells a percentage width of the screen, to make 3 columns
        let cellWidth = (self.regionSelection.frame.size.width - 10*2)/3
        return CGSize(width:cellWidth, height:cellWidth)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! gridCell
        cell.backgroundColor = UIColor.blackColor()
        //cell.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:100,height:100))
        // Configure the cell
        cell.image.image = UIImage(named:sectors[indexPath.row].1)
        cell.title.text = sectors[indexPath.row].2
        cell.tintLabel.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            cell.title.font = UIFont(name: cell.title.font.fontName, size: 34)
        }
        
        // define the states of selection by coloring the cell or not
        if sectors[indexPath.row].3{
            //cell.tintLabel.backgroundColor = UIColor(red:193/256, green:107/256,blue:50/256,alpha:0.7)
            cell.tintLabel.backgroundColor = UIColor(red:170/256, green:44/256,blue:44/256,alpha:0.7)
        }
        else if indexPath.row != 0 && indexPath.row != 2{
            cell.tintLabel.backgroundColor = UIColor(red:0/256, green:0/256,blue:0/256,alpha:0.1)
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    if indexPath.row == 1{
        // set the rest false
        for i in 0...sectors.count-1{
            sectors[i].3 = false
        }
        sectors[1].3 = true
    }
    else if sectors[indexPath.row].3{
        sectors[indexPath.row].3 = false
    }
    else if sectors[indexPath.row].3==false && sectors[indexPath.row].0 != ""{
        sectors[indexPath.row].3 = true
        sectors[1].3 = false
    }
    // now reload the data.
        self.regionSelection!.reloadData()
    }
    
    @IBAction func pressNext(sender: AnyObject) {
        // no code to go here, just need to do in segue
    }
    
    
    // on going to the next view, pass the data along
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toTableListFromSector") {
            // combine together into one string the region data
            // then start segue to next view
            var sectorstring = ""
            if sectors[1].3 == false{ // only pass in region if not 'anywhere'
                for state in 3...sectors.count-1{
                    if sectors[state].3{
                        sectorstring = sectorstring+"sector="+sectors[state].0+"&"
                    }
                }
                sectorstring = dropLast(sectorstring) // don't include the last &
            }
            
            //println("Sectors:")
            //println(sectorstring)
            
            //println("Regions:")
            //println(regionstring)
            
            if let viewController: ListTableController = segue.destinationViewController as? ListTableController {
                viewController.urlString = regionstring+"&"+sectorstring
                viewController.showingOnlyFavorites=false
            }
            
        }
    }
    
}
