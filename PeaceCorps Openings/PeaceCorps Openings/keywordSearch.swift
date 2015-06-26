//
//  keywordSearch.swift
//  PeaceCorps Openings
//
//  Created by Patrick W. Crawford on 6/26/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class keywordSearch: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        //searchBar.delegate = self
        
        
        
    }
    

    @IBAction func goToTable(sender: AnyObject) {
        // no code here, just in prepare
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        println("here2!")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSegueWithIdentifier("fromKeyToTable", sender: self)
    }
    
    func searchBarShouldReturn(searchBar: UITextField!) -> Bool {   //delegate method
        searchBar.resignFirstResponder()
        // run segue
        println("here!")
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
