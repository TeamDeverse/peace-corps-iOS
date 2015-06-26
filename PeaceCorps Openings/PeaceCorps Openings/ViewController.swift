//
//  ViewController.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/14/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet var buttonTop: UIButton!
    @IBOutlet var buttonMiddle: UIButton!
    @IBOutlet var buttonBottom: UIButton!
    @IBOutlet var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var logButton : UIBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: "infoButtonAction")
        self.navigationItem.rightBarButtonItem = logButton
        
        // make it larger on ipads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            buttonTop.titleLabel?.font = UIFont(name: buttonTop.titleLabel!.font.fontName, size: 30)
            buttonMiddle.titleLabel?.font = UIFont(name: buttonMiddle.titleLabel!.font.fontName, size: 30)
            buttonBottom.titleLabel?.font = UIFont(name: buttonBottom.titleLabel!.font.fontName, size: 30)
            aboutButton.titleLabel?.font = UIFont(name: aboutButton.titleLabel!.font.fontName, size: 30)
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // on going to the next view, pass the data along
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showFavorites") {
            if let viewController: ListTableController = segue.destinationViewController as? ListTableController {
                viewController.urlString = ""
                viewController.showingOnlyFavorites=true
            }
            
        }
    }
}

