//
//  about.swift
//  PeaceCorps Openings
//
//  Created by Patrick W. Crawford on 6/26/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class about: UIViewController {
    @IBOutlet var dismissButton: UIButton!

    @IBAction func dismissView(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func learnMore(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.deverse.org/programs/boston-college-spring-2015/")!)
    }
    @IBAction func contactDeverse(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto:hello@deverse.org")!)
        // good faith this will work on an actual device.
        
    }
}
