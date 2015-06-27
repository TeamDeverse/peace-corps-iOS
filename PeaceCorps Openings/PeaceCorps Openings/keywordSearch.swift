//
//  keywordSearch.swift
//  PeaceCorps Openings
//
//  Created by Patrick W. Crawford on 6/26/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class keywordSearch: UIViewController {
    
    @IBOutlet var extrainfolabel: UILabel!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        //searchBar.delegate = self
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            extrainfolabel.font = UIFont(name: extrainfolabel.font.fontName, size: 24)
            buttonNext.titleLabel?.font = UIFont(name: buttonNext.titleLabel!.font.fontName, size: 30)
        }
        
    }
    

    @IBAction func goToTable(sender: AnyObject) {
        // no code here, just in prepare
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSegueWithIdentifier("fromKeyToTable", sender: self)
    }
    
    func searchBarShouldReturn(searchBar: UITextField!) -> Bool {   //delegate method
        searchBar.resignFirstResponder()
        // run segue
        return true
    }
    
    // on going to the next view, pass the data along
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "fromKeyToTable") {
            // combine together into one string the region data
            // then start segue to next view
            var sectorstring = searchBar.text
            let newString = sectorstring.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            if let viewController: ListTableController = segue.destinationViewController as? ListTableController {
                viewController.urlString = "keyword="+newString
                viewController.showingOnlyFavorites=false
            }
            
        }
    }

}
