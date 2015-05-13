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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
