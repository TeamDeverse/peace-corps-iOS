//
//  resultsCellView.swift
//  PeaceCorps Openings
//
//  Created by Patrick Crawford on 5/13/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class resultsCellView: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sectorLabel: UILabel!
    @IBOutlet var countryRegionLabel: UILabel!
    @IBOutlet var departByLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var favButton: UIButton!
    var index:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func favToggle(sender: AnyObject) {
        
        var jobEntry = single.getJobFromIndex(index)
        if jobEntry.favorited == false{
            // call singleton, make it True
            favButton.setImage(UIImage(named:"Star-Favorites"), forState: .Normal)
            jobEntry.favorited = true
            single.setFavotireAtInted(index, favorited: true)
        }
        else{
            // call singleton, make it False
            favButton.setImage(UIImage(named:"star_none"), forState: .Normal)
            jobEntry.favorited = false
            single.setFavotireAtInted(index, favorited: false)
        }
        
        
    }
}
