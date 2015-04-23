//
//  ViewController.swift
//  PeaceCorps Openings
//
//  Created by Roseanna Chu on 4/14/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    lazy var data = NSMutableData()
    
//    struct Job{
//        let title   : String
//        let req_id  : String
//        let country : String
//        let region  : String
//        let sector  : String
//        let appy_date   : String
//        let know_by : String
//        let staging_start_date  : String
//        let featured    : Boolean
//        let project_description : String
//        let required_skills : String
//        let desired_skills  : String
//        let language_skills : String
//        let language_skills_comments    : String
//        let volunteers_requested    : Int
//        let accepts_couples : Boolean
//        let living_conditions_comments  : String
//        let country_medical_considerations  : String
//        let country_site_url    : String
//        let country_flag_image  : String
//        let opening_url : String
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        startConnection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func startConnection(){
//        let urlPath: String = "http://www.peacecorps.gov/api/v1/openings/?keyword=teacher"
//        var url: NSURL = NSURL(string: urlPath)!
//        var request: NSURLRequest = NSURLRequest(URL: url)
//        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
//        connection.start()
//    }
//    
//    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
//        self.data.appendData(data)
//    }
//
//    func connectionDidFinishLoading(connection: NSURLConnection!) {
//        var err: NSError
//        // throwing an error on the line below (can't figure out where the error message is)
//        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        //iterate(jsonResult)
//    }
//
//    func iterate(jsonResults: NSDictionary){
//        let dataArray = jsonResults["results"] as NSArray;
//        
//        println("Data items count: \(dataArray.count)")
//        
//        for item in dataArray { // loop through data items
//            let obj = item as NSDictionary
//            for (key, value) in obj {
//                println("Property: \(key as String)")
//                println("Value: \"\(value)\"")
//            }
//        }
//
//    }
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
//    
//    func filter(userInput: String, jsonResults: NSDictionary){
//        let dataArray = jsonResults["results"] as NSArray;
//        println("Data items count: \(dataArray.count)")
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