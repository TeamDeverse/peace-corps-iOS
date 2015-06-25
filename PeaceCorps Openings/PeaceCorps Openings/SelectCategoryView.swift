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
    //to connect
    @IBOutlet weak var Europe: UIButton!
    @IBOutlet weak var CarribeanView: UIButton!
    @IBOutlet weak var CentralAmericaMexicoView: UIButton!
    @IBOutlet weak var PacificIslandsView: UIButton!
    @IBOutlet weak var NorthAfrica: UIButton!
    
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
        if(!contains(sectorArray,"anything")){
            sectorArray = []
            sectorArray.append("anything")
            AnythingS.tintColor = UIColor.redColor()
            AgricultureS.tintColor = UIColor.blueColor()
            CommunityS.tintColor = UIColor.blueColor()
            EnvironmentS.tintColor = UIColor.blueColor()
            HealthS.tintColor = UIColor.blueColor()
            YouthS.tintColor = UIColor.blueColor()
        }
    }
    
    @IBAction func AgricultureSector(sender: AnyObject) {
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
        if(contains(sectorArray, "anything")){
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
        if(!contains(regionArray,"anywhere")){
            regionArray = []
            regionArray.append("anywhere")
            AnywhereView.tintColor = UIColor.redColor()
            AsiaView.tintColor = UIColor.blueColor()
            AfricaView.tintColor = UIColor.blueColor()
            Europe.tintColor = UIColor.blueColor()
            CarribeanView.tintColor = UIColor.blueColor()
            CentralAmericaMexicoView.tintColor = UIColor.blueColor()
            NorthAfrica.tintColor = UIColor.blueColor()
            PacificIslandsView.tintColor = UIColor.blueColor()
        }
    }
    @IBAction func AfricaRegion(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("africa")
            AnywhereView.tintColor = UIColor.blueColor()
            AfricaView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"africa")){
                regionArray.append("africa")
                AfricaView.tintColor = UIColor.redColor()
            }
        }
    }
    
    @IBAction func AsiaRegion(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("asia")
            AnywhereView.tintColor = UIColor.blueColor()
            AsiaView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"asia")){
                regionArray.append("asia")
                AsiaView.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func Europe(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("europe")
            AnywhereView.tintColor = UIColor.blueColor()
            Europe.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"europe")){
                regionArray.append("europe")
                Europe.tintColor = UIColor.redColor()
            }
        }
    }
    @IBAction func NorthAfrica(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("africa")
            AnywhereView.tintColor = UIColor.blueColor()
            NorthAfrica.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"africa")){
                regionArray.append("africa")
                NorthAfrica.tintColor = UIColor.redColor()
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
    @IBAction func PacificIslands(sender: AnyObject) {
        if(contains(regionArray, "anywhere")){
            regionArray = []
            regionArray.append("pacificislands")
            AnywhereView.tintColor = UIColor.blueColor()
            PacificIslandsView.tintColor = UIColor.redColor()
        }
        else{
            if(!contains(regionArray,"pacificislands")){
                regionArray.append("pacificislands")
                PacificIslandsView.tintColor = UIColor.redColor()
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