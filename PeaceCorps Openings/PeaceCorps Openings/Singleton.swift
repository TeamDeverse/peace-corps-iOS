//
//  Singleton.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/29/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation

class Singleton {
    let jobList = JobList()

    class func sharedInstance() -> Singleton! {
        struct Static {
            static var instance: Singleton? = nil
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = self()
        }
        
        return Static.instance!
    }
    
    required init() {
        iter("http://www.peacecorps.gov/api/v1/openings/?page=1")
    }

    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        return boardsDictionary
    }
    
    func filter(regionArray: NSArray, sectorArray: NSArray){
        var fittingJobs = JobList()
        var temp = jobList.headNode
        if(jobList.isEmpty()){
            return
        }
        if (regionArray.containsObject("anywhere") && sectorArray.containsObject("anything")){
            jobList.toString()
            return
        }
        else if(regionArray.containsObject("anywhere")){
            while(temp.next != nil){
                if(sectorArray.containsObject((temp.value)!.sector)){
                    fittingJobs.insert((temp.value)!)
                    temp = temp.next!
                }
                temp = temp.next!
            }
            fittingJobs.toString()
            return
        }
        else if(sectorArray.containsObject("anything")){
            while(temp.next != nil){
                if(regionArray.containsObject((temp.value)!.region)){
                    fittingJobs.insert((temp.value)!)
                    temp = (temp.next)!
                }
                temp = temp.next!
            }
//            println("To String")
            fittingJobs.toString()
            return
        }
        else{
            while (temp.next != nil){
                if(regionArray.containsObject((temp.value)!.region) && sectorArray.containsObject((temp.value)!.sector)){
                    fittingJobs.insert((temp.value)!)
                    temp = (temp.next)!
                }
                temp = temp.next!
            }
            fittingJobs.toString()
            return
        }
    }

    func iter(myUrl: String){
        var first = getJSON(myUrl)
        var second = parseJSON(first)
        var i = 0
        
        //find a better constraint
        while (i < 3){
            var dataArray = second["results"] as NSArray
            
            for item in dataArray { // loop through data items
                let obj = item as NSDictionary
                var newJob = Job()
                for (key, value) in obj {
                    if(key as NSString == "title"){
                        newJob.title = value as NSString
                    }
                    if(key as NSString == "req_id"){
                        newJob.req_id = value as NSString
                    }
                    if(key as NSString == "country"){
                        newJob.country = value as NSString
                    }
                    if(key as NSString == "region"){
                        newJob.region = value as NSString
                    }
                    if(key as NSString == "sector"){
                        newJob.sector = value as NSString
                    }
                    if(key as NSString == "apply_date"){
                        newJob.apply_date = value as NSString
                    }
                    if(key as NSString == "know_by"){
                        newJob.know_by = value as NSString
                    }
                    if(key as NSString == "staging_start_date"){
                        newJob.staging_start_date = value as NSString
                    }
                    if(key as NSString == "featured"){
                        newJob.featured = value as Bool
                    }
                    if(key as NSString == "project_description"){
                        newJob.project_description = value as NSString
                    }
                    if(key as NSString == "required_skills"){
                        newJob.required_skills = value as NSString
                    }
                    if(key as NSString == "desired_skills"){
                        newJob.desired_skills = value as NSString
                    }
                    if(key as NSString == "language_skills"){
                        newJob.language_skills = value as NSString
                    }
                    if(key as NSString == "language_skills_comments"){
                        newJob.language_skills_comments = value as NSString
                    }
                    if(key as NSString == "volunteers_requested"){
                        newJob.volunteers_requested = value as Int
                    }
                    if(key as NSString == "accepts_couples"){
                        newJob.accepts_couples = value as Bool
                    }
                    if(key as NSString == "living_conditions_comments"){
                        newJob.living_conditions_comments = value as NSString
                    }
                    if(key as NSString == "country_medical_considerations"){
                        newJob.country_medical_considerations = value as NSString
                    }
                    if(key as NSString == "country_site_url"){
                        newJob.country_site_url = value as NSString
                    }
                    if(key as NSString == "country_flag_image"){
                        newJob.country_flag_image = value as NSString
                    }
                    if(key as NSString == "opening_url"){
                        newJob.opening_url = value as NSString
                    }
                    //println("Property: \(key as String)")
                    //println("Value: \"\(value)\"")
                }
                jobList.insert(newJob)
            }
//            println(second["next"] as NSString)
            second = parseJSON(getJSON(second["next"] as NSString))
            //println((second["next"]?.length())!)
            i++
        }
        var dataArray = second["results"] as NSArray
        
        for item in dataArray { // loop through data items
            let obj = item as NSDictionary
            var newJob = Job()
            for (key, value) in obj {
                if(key as NSString == "title"){
                    newJob.title = value as NSString
                }
                if(key as NSString == "req_id"){
                    newJob.req_id = value as NSString
                }
                if(key as NSString == "country"){
                    newJob.country = value as NSString
                }
                if(key as NSString == "region"){
                    newJob.region = value as NSString
                }
                if(key as NSString == "sector"){
                    newJob.sector = value as NSString
                }
                if(key as NSString == "apply_date"){
                    newJob.apply_date = value as NSString
                }
                if(key as NSString == "know_by"){
                    newJob.know_by = value as NSString
                }
                if(key as NSString == "staging_start_date"){
                    newJob.staging_start_date = value as NSString
                }
                if(key as NSString == "featured"){
                    newJob.featured = value as Bool
                }
                if(key as NSString == "project_description"){
                    newJob.project_description = value as NSString
                }
                if(key as NSString == "required_skills"){
                    newJob.required_skills = value as NSString
                }
                if(key as NSString == "desired_skills"){
                    newJob.desired_skills = value as NSString
                }
                if(key as NSString == "language_skills"){
                    newJob.language_skills = value as NSString
                }
                if(key as NSString == "language_skills_comments"){
                    newJob.language_skills_comments = value as NSString
                }
                if(key as NSString == "volunteers_requested"){
                    newJob.volunteers_requested = value as Int
                }
                if(key as NSString == "accepts_couples"){
                    newJob.accepts_couples = value as Bool
                }
                if(key as NSString == "living_conditions_comments"){
                    newJob.living_conditions_comments = value as NSString
                }
                if(key as NSString == "country_medical_considerations"){
                    newJob.country_medical_considerations = value as NSString
                }
                if(key as NSString == "country_site_url"){
                    newJob.country_site_url = value as NSString
                }
                if(key as NSString == "country_flag_image"){
                    newJob.country_flag_image = value as NSString
                }
                if(key as NSString == "opening_url"){
                    newJob.opening_url = value as NSString
                }
                //println("Property: \(key as String)")
                //println("Value: \"\(value)\"")
            }
            jobList.insert(newJob)
        }
        return
    }

}

