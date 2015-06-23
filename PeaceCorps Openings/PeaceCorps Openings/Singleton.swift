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
    var fittingJobs = JobList()
    
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
    
    func numOfElements()->Int{
        return fittingJobs.count
    }
    
    required init() {
        iter("http://www.peacecorps.gov/api/v1/openings/?page=1")
    }

    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        
        return boardsDictionary
    }
    
    func filter(regionArray: NSArray, sectorArray: NSArray)->JobList{
//        var fittingJobs = JobList()
        var temp = jobList.headNode
        if(jobList.isEmpty()){
            return jobList
        }
        if (regionArray.containsObject("anywhere") && sectorArray.containsObject("anything")){
            jobList.toString()
            return jobList
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
            return fittingJobs
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
            return fittingJobs
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
            return fittingJobs
        }
    }

    func iter(myUrl: String){
        var first = getJSON(myUrl)
        var second = parseJSON(first)
        var i = 0
        
        //find a better constraint
        while (i < 3){
            var dataArray = second["results"]as! NSArray
            
            for item in dataArray { // loop through data items
                let obj = item as! NSDictionary
                var newJob = Job()
                for (key, value) in obj {
                    if(key as! String == "title"){
                        newJob.title = value as! String
                    }
                    if(key as! String == "req_id"){
                        newJob.req_id = value as! String
                    }
                    if(key as! String == "country"){
                        newJob.country = value as! String
                    }
                    if(key as! String == "region"){
                        newJob.region = value as! String
                    }
                    if(key as! String == "sector"){
                        newJob.sector = value as! String
                    }
                    if(key as! String == "apply_date"){
                        newJob.apply_date = value as! String
                    }
                    if(key as! String == "know_by"){
                        newJob.know_by = value as! String
                    }
                    if(key as! String == "staging_start_date"){
                        newJob.staging_start_date = value as! String
                    }
                    if(key as! String == "featured"){
                        newJob.featured = value as! Bool
                    }
                    if(key as! String == "project_description"){
                        newJob.project_description = value as! String
                    }
                    if(key as! String == "required_skills"){
                        newJob.required_skills = value as! String
                    }
                    if(key as! String == "desired_skills"){
                        newJob.desired_skills = value as! String
                    }
                    if(key as! String == "language_skills"){
                        newJob.language_skills = value as! String
                    }
                    if(key as! String == "language_skills_comments"){
                        newJob.language_skills_comments = value as! String
                    }
                    if(key as! String == "volunteers_requested"){
                        newJob.volunteers_requested = value as! Int
                    }
                    if(key as! String == "accepts_couples"){
                        newJob.accepts_couples = value as! Bool
                    }
                    if(key as! NSString == "living_conditions_comments"){
                        newJob.living_conditions_comments = value as! String
                    }
                    if(key as! NSString == "country_medical_considerations"){
                        newJob.country_medical_considerations = value as! String
                    }
                    if(key as! NSString == "country_site_url"){
                        newJob.country_site_url = value as! String
                    }
                    if(key as! NSString == "country_flag_image"){
                        newJob.country_flag_image = value as! String
                    }
                    if(key as! NSString == "opening_url"){
                        newJob.opening_url = value as! String
                    }
                    //println("Property: \(key as String)")
                    //println("Value: \"\(value)\"")
                }
                jobList.insert(newJob)
            }
//            println(second["next"] as NSString)
            second = parseJSON(getJSON(second["next"] as! String))
            //println((second["next"]?.length())!)
            i++
        }
        var dataArray = second["results"] as! NSArray
        
        for item in dataArray { // loop through data items
            let obj = item as! NSDictionary
            var newJob = Job()
            for (key, value) in obj {
                if(key as! String == "title"){
                    newJob.title = value as! String
                }
                if(key as! String == "req_id"){
                    newJob.req_id = value as! String
                }
                if(key as! String == "country"){
                    newJob.country = value as! String
                }
                if(key as! String == "region"){
                    newJob.region = value as! String
                }
                if(key as! String == "sector"){
                    newJob.sector = value as! String
                }
                if(key as! String == "apply_date"){
                    newJob.apply_date = value as! String
                }
                if(key as! String == "know_by"){
                    newJob.know_by = value as! String
                }
                if(key as! String == "staging_start_date"){
                    newJob.staging_start_date = value as! String
                }
                if(key as! String == "featured"){
                    newJob.featured = value as! Bool
                }
                if(key as! String == "project_description"){
                    newJob.project_description = value as! String
                }
                if(key as! String == "required_skills"){
                    newJob.required_skills = value as! String
                }
                if(key as! String == "desired_skills"){
                    newJob.desired_skills = value as! String
                }
                if(key as! String == "language_skills"){
                    newJob.language_skills = value as! String
                }
                if(key as! String == "language_skills_comments"){
                    newJob.language_skills_comments = value as! String
                }
                if(key as! String == "volunteers_requested"){
                    newJob.volunteers_requested = value as! Int
                }
                if(key as! String == "accepts_couples"){
                    newJob.accepts_couples = value as! Bool
                }
                if(key as! String == "living_conditions_comments"){
                    newJob.living_conditions_comments = value as! String
                }
                if(key as! String == "country_medical_considerations"){
                    newJob.country_medical_considerations = value as! String
                }
                if(key as! String == "country_site_url"){
                    newJob.country_site_url = value as! String
                }
                if(key as! String == "country_flag_image"){
                    newJob.country_flag_image = value as! String
                }
                if(key as! String == "opening_url"){
                    newJob.opening_url = value as! String
                }
                //println("Property: \(key as String)")
                //println("Value: \"\(value)\"")
            }
            jobList.insert(newJob)
        }
        return
    }

}

