//
//  ViewController.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/14/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    lazy var data = NSMutableData()
    let jobList = JobList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startConnection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConnection(){
        let urlPath: String = "http://www.peacecorps.gov/api/v1/openings/?keyword=teacher"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        iterate(jsonResult)
    }
    
    func iterate(jsonResults: NSDictionary){
        let dataArray = jsonResults["results"] as NSArray
        
        println("Data items count: \(dataArray.count)")
        
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
        jobList.toString()
    }
    //    func insert(jsonResults: NSDictionary){
    //        let dataArray = jsonResults["results"] as NSArray;
    //        println("Data items count: \(dataArray.count)")
    //        for item in dataArray { // loop through data items
    //            let obj = item as NSDictionary
    //            for (key, value) in obj {
    //                    println("Property: \(key as String)")
    //                    println("Value: \"\(value)\"")
    //            }
    //        }
    //    }
    
    //    func filter(userInput: String, jsonResults: NSDictionary){
    //        let dataArray: NSArray = jsonResults["results"] as NSArray;
    ////        println("Data items count: \(dataArray.count)")
    //        for item in dataArray { // loop through data items
    //            let obj = item as NSDictionary
    //            for (key, value) in obj {
    //                if(key as NSString == userInput){
    //                    println("Property: \(key as String)")
    //                    println("Value: \"\(value)\"")
    //                }
    //            }
    //        }
    //    }
}