//
//  SelectCategoryView.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/28/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation
import UIKit


class SelectCategoryView: UIViewController {
    var regionArray = ["anywhere"];
    var sectorArray = ["anything"];
    let singleton = Singleton()
    @IBOutlet weak var AnywhereView: UIButton!
    @IBOutlet weak var AfricaView: UIButton!
    @IBOutlet weak var AsiaView: UIButton!
    @IBOutlet weak var AnythingS: UIButton!
    @IBOutlet weak var AgricultureS: UIButton!
    @IBOutlet weak var CommunityS: UIButton!

    @IBAction func AnythingSector(sender: AnyObject) {
//        println("anything")
        if(!contains(sectorArray,"anything")){
            sectorArray = []
            sectorArray.append("anywhere")
            AnythingS.tintColor = UIColor.redColor()
            AgricultureS.tintColor = UIColor.blueColor()
            CommunityS.tintColor = UIColor.blueColor()
        }
    }
    @IBAction func AgricultureSector(sender: AnyObject) {
//        println("Agriculture")
        if(contains(sectorArray, "anything")){
            sectorArray = []
            sectorArray.append("Agriculture")
            AnywhereView.tintColor = UIColor.blueColor()
            AgricultureS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Agriculture")){
                sectorArray.append("Agriculture")
                AgricultureS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func CommunitySector(sender: AnyObject) {
//        println("Community")
        if(contains(sectorArray, "Community Economic Development")){
            sectorArray = []
            sectorArray.append("Community Economic Development")
            AnywhereView.tintColor = UIColor.blueColor()
            CommunityS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Community Economic Development")){
                sectorArray.append("Community Economic Development")
                CommunityS.tintColor = UIColor.redColor()
            }
        }
    }
    
    @IBAction func Search(sender: AnyObject) {
//        println("Search")
        println(regionArray)
        println(sectorArray)
        
        // SEND to the next view, the table
        // singleton.filter(regionArray, sectorArray: sectorArray) // deleted this
        // instead, call segue with this info
    }

    @IBAction func AnywhereRegion(sender: AnyObject) {
//        println("anywhere")
        if(!contains(regionArray,"anywhere")){
            regionArray = []
            regionArray.append("anywhere")
//            println(regionArray)
            AnywhereView.tintColor = UIColor.redColor()
            AsiaView.tintColor = UIColor.blueColor()
            AfricaView.tintColor = UIColor.blueColor()
        }
    }
    @IBAction func AfricaRegion(sender: AnyObject) {
//        println("Africa")
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("africa")
//            println(regionArray)
            AnywhereView.tintColor = UIColor.blueColor()
            AfricaView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"africa")){
                regionArray.append("africa")
//                println(regionArray)
                AfricaView.tintColor = UIColor.redColor()
            }
        }
    }
    
    @IBAction func AsiaRegion(sender: AnyObject) {
//        println("Asia")
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("asia")
//            println(regionArray)
            AnywhereView.tintColor = UIColor.blueColor()
            AsiaView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"asia")){
                regionArray.append("asia")
//                println(regionArray)
                AsiaView.tintColor = UIColor.redColor()
            }
        }
    }
}