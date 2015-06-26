//
//  Singleton.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/29/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import Foundation

class Singleton {
    var jobList = JobList()
    var fittingJobs = JobList()
    var jobArray = [Job]()
    
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
        //return fittingJobs.count
        return jobArray.count
    }
    
    // setters and getters
    func getJobFromIndex(id:Int) ->Job{
        //println("Checking")
        return jobArray[id]
    }
    func setJobAtIndex(id:Int, updateJob:Job){
        var samestate = (jobArray[id].favorited == updateJob.favorited)
        jobArray[id] = updateJob
        // check if favorited changed
        if samestate == false{
            setFavotireAtInted(id, favorited: updateJob.favorited)
        }
    }
    
    func showFavorites(){
        // set favorites to be in the array of lists
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingPathComponent("storedJobs")
        let fileManager = NSFileManager.defaultManager()
        //check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            return // error, plist couldn't be found
        }
        
        let storedJobs = NSMutableDictionary(contentsOfFile: path)
        if let dict = storedJobs {
            
                
            jobArray.removeAll(keepCapacity: false)
            for (j, vals) in dict{
                jobArray.append(jobFromDictionary((vals as? Dictionary<String, AnyObject>)!)) // convert it to a Job!
            }
            
            
        } else {
            println("error accessing plist")
        }
        
    }
    
    func setFavotireAtInted(id:Int, favorited: Bool){
        jobArray[id].favorited = favorited
        
        // do stuff, save to/from plist etc
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingPathComponent("storedJobs")
        let fileManager = NSFileManager.defaultManager()
        //check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            return // error, plist couldn't be found
        }
        
        let storedJobs = NSMutableDictionary(contentsOfFile: path)
        if let dict = storedJobs {
            if jobArray[id].favorited{
                // add or update the ID to the list
                //dict[jobArray[id].req_id] = "hello!" // call a func that makes dictionary out of Job object
                let v = jobArray[id].toDictionary()
                //dict[jobArray[id].req_id] = v as? Dictionary<String, AnyObject>
                dict[jobArray[id].req_id] = v
                
                //dict[jobArray[id].req_id] = dict as NSDictionary
                println(dict)
                dict.writeToFile(path, atomically: false)
            }
            else{
                // remove this ID from the dictionary
                dict.removeObjectForKey(jobArray[id].req_id)
                dict.writeToFile(path, atomically: false)
            }
            
        } else {
            println("error accessing plist")
        }
        
        
    }
    
    
    required init() {
        //iter("http://www.peacecorps.gov/api/v1/openings/?page=1")
    }

    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        
        return boardsDictionary
    }
    
    
    
    // new "filtering" function, the only one used now
    // the one with NSArray was using a method of grabbing all entries and then
    // having the app parse through the desired ones to show
    // The method below makes the server only return what we want.
    func filter(urlInput: String){//->[Job]{
        
        iter("http://www.peacecorps.gov/api/v1/openings/?"+urlInput+"&page_size=99")
        //var temp = jobList.headNode
        //return jobArray
    }
    
    /*
    func filter(regionArray: NSArray, sectorArray: NSArray)->JobList{
        //var fittingJobs = JobList()
        var temp = jobList.headNode
        
        // previous implemented method with post-grab filtering, replaced by the above pre-gra
        
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
    }*/

    func iter(myUrl: String){
        
        // clear existing job list
        //jobList = JobList()
        self.jobArray = [Job]()
        var i = 0
        var url = myUrl
        
        //find a better constraint ; was 3 before, for "3 pages".
        // should be "while returned != nil" of some kind
        while (url != "null" || i==10){
            
            var first = getJSON(url)
            var second = parseJSON(first)
            
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
                    if(key as! String == "know_date"){
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
                //jobList.insert(newJob)
                self.jobArray.append(newJob)
            }
            //println(second["next"] as! NSString)
            //second = parseJSON(getJSON(second["next"] as! String)) // UN uncomment
            //println((second["next"]?.length())!)
            i++
            if second["next"] is NSNull{
                break
            }
            url = second["next"]as! String
        }
        //println("CHECKING THE LIST")
        //println(jobArray)
        return
    }

}

