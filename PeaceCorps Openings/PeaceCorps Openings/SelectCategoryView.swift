//
//  SelectCategoryView.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/28/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation
import UIKit
var regionArray = ["anywhere"];
var sectorArray = ["anything"];

class SelectCategoryView: UIViewController {
    let singleton = Singleton()
    @IBOutlet weak var AnywhereView: UIButton!
    @IBOutlet weak var AfricaView: UIButton!
    @IBOutlet weak var AsiaView: UIButton!
    //to connect
    @IBOutlet weak var SouthAmericaView: UIButton!
    @IBOutlet weak var CarribeanView: UIButton!
    @IBOutlet weak var CentralAmericaMexicoView: UIButton!
    @IBOutlet weak var PacificIslandsView: UIButton!
    
    @IBOutlet weak var AnythingS: UIButton!
    @IBOutlet weak var AgricultureS: UIButton!
    @IBOutlet weak var CommunityS: UIButton!
    //more sectors to connect
    @IBOutlet weak var EducationS: UIButton!
    @IBOutlet weak var EnvironmentS: UIButton!
    @IBOutlet weak var HealthS: UIButton!
    @IBOutlet weak var YouthS: UIButton!
    
    func region()->[String]{
        return regionArray
    }
    
    func sector()->[String]{
        return sectorArray
    }
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
            AnythingS.tintColor = UIColor.blueColor()
            AgricultureS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Agriculture")){
                sectorArray.append("Agriculture")
                AgricultureS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func EducationSector(sender: AnyObject) {
        if(contains(sectorArray, "anything")){
            sectorArray = []
            sectorArray.append("Education")
            AnythingS.tintColor = UIColor.blueColor()
            EducationS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Education")){
                sectorArray.append("Education")
                EducationS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func EnvironmentSector(sender: AnyObject) {
        if(contains(sectorArray, "anything")){
            sectorArray = []
            sectorArray.append("Environment")
            AnythingS.tintColor = UIColor.blueColor()
            EnvironmentS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Environment")){
                sectorArray.append("Environment")
                EnvironmentS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func HealthSector(sender: AnyObject) {
        if(contains(sectorArray, "anything")){
            sectorArray = []
            sectorArray.append("Health")
            AnythingS.tintColor = UIColor.blueColor()
            HealthS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Health")){
                sectorArray.append("Health")
                HealthS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func YouthSector(sender: AnyObject) {
        if(contains(sectorArray, "anything")){
            sectorArray = []
            sectorArray.append("Youth")
            AnythingS.tintColor = UIColor.blueColor()
            YouthS.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(sectorArray,"Youth")){
                sectorArray.append("Youth")
                YouthS.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func CommunitySector(sender: AnyObject) {
//        println("Community")
        if(contains(sectorArray, "Community Economic Development")){
            sectorArray = []
            sectorArray.append("Community Economic Development")
            AnythingS.tintColor = UIColor.blueColor()
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
    @IBAction func SouthAmerica(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("southamerica")
            AnywhereView.tintColor = UIColor.blueColor()
            SouthAmericaView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"southamerica")){
                regionArray.append("southamerica")
                SouthAmericaView.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func Carribean(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("carribean")
            AnywhereView.tintColor = UIColor.blueColor()
            CarribeanView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"carribean")){
                regionArray.append("carribean")
                CarribeanView.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func CentralAmericaMexico(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("centralamerica")
            AnywhereView.tintColor = UIColor.blueColor()
            CentralAmericaMexicoView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"centralamerica")){
                regionArray.append("centralamerica")
                CentralAmericaMexicoView.tintColor = UIColor.redColor()
            }
        }
    }

    
}