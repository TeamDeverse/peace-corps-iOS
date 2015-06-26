//
//  SelectCategoryController.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation
import UIKit


class SelectCategoryController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var regionSelection: UICollectionView!
    //regionSelection.delegate = self
    
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
    // format: (api-id, image name, displayed text, toggle status [defaults])
    var locations: [(String, String, String, Bool)] = [
        ("anywhere", "regionanywhere.jpg", "Anywhere",true),
        ("africa", "regionafrica.jpg", "Africa",false),
        ("asia", "regionasia.jpg", "Asia",false),
        ("centralamerica", "regioncentralamericamexico.jpg", "Central America & Mexico",false),
        ("easteurope", "regioneasterneuropecentralasia.jpg","Eastern Europe and Central Asia",false),
        ("northafrica", "regionnorthafricamiddle.jpg", "North Africa",false),
        ("pacificislands", "regionpacificislands.jpg", "Pacific Islands",false),
        ("southamerica", "regionsouthamerica.jpg", "South America",false),
        ("caribbean", "regioncaribbean.jpg", "The Caribbean",false)
    ]
    
    
    //CollectionView.delegate = self
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
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
        cell.image.image = UIImage(named:locations[indexPath.row].1)
        cell.title.text = locations[indexPath.row].2
        cell.tintLabel.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            cell.title.font = UIFont(name: cell.title.font.fontName, size: 34)
        }
        
        // define the states of selection by coloring the cell or not
        if locations[indexPath.row].3{
            cell.tintLabel.backgroundColor = UIColor(red:193/256, green:107/256,blue:50/256,alpha:0.7)
        }
        else{
            cell.tintLabel.backgroundColor = UIColor(red:0/256, green:0/256,blue:0/256,alpha:0.1)
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0{
            locations[0].3 = true
            // set the rest false
            for i in 1...locations.count-1{
                locations[i].3 = false
            }
        }
        else if locations[indexPath.row].3{
           locations[indexPath.row].3 = false
        }
        else if locations[indexPath.row].3==false{
            locations[indexPath.row].3 = true
            locations[0].3 = false
        }
        // now reload the data.
        self.regionSelection!.reloadData()
    }
    
    @IBAction func pressNext(sender: AnyObject) {
        // no code to run, all happens in the segue
    }
    
    // on going to the next view, pass the data along
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSectors") {
            
            // combine together into one string the region data
            // then start segue to next view
            regionstring = ""
            if locations[0].3 == false{ // only pass in region if not 'anywhere'
                for state in 0...locations.count-1{
                    if locations[state].3{
                        regionstring = regionstring+"region="+locations[state].0+"&"
                    }
                }
                regionstring = dropLast(regionstring) // don't include the last &
            }
            
            if let viewController: SelectSectorController = segue.destinationViewController as? SelectSectorController {
                //println(regionstring)
                viewController.regionstring = regionstring
            }
            
        }
    }
}

