//
//  listing-table.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 5/12/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit
let single = Singleton()

//class ListTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
class ListTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "genericCell")
        println("it's loaded...kinda")
        
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int {
        return 1
    }

//    this is the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shared = single.numOfElements()
        println("it's connected")
        println(shared)
        return shared
    }
    
//    this is a for loop after the view is loaded, per cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("genericCell") as UITableViewCell
        println("hello cell")
        
        return cell
    }
    
//     this is what happens when you click on a cell(generalized for all)
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath)
    }

}