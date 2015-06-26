//
//  JobList.swift
//  PeaceCorps Openings
//
//  Created by Joseph Carle on 4/22/15.
//  Copyright (c) 2015 GAI. All rights reserved.
//
import Foundation
struct Job{
    var title   : String = ""
    var req_id  : String = ""
    var country : String = ""
    var region  : String = ""
    var sector  : String = ""
    var apply_date   : String = ""
    var know_by : String = ""
    var staging_start_date  : String = ""
    var featured    : Bool = false
    var project_description : String = ""
    var required_skills : String = ""
    var desired_skills  : String = ""
    var language_skills : String = ""
    var language_skills_comments    : String = ""
    var volunteers_requested    : Int = 0
    var accepts_couples : Bool = false
    var living_conditions_comments  : String = ""
    var country_medical_considerations  : String = ""
    var country_site_url    : String = ""
    var country_flag_image  : String = ""
    var opening_url : String = ""
    var favorited : Bool = false
    
    init(){
        self.title=""
        self.req_id=""
        self.country=""
        self.region=""
        self.sector=""
        self.apply_date=""
        self.know_by=""
        self.staging_start_date=""
        self.featured=false
        self.project_description=""
        self.required_skills=""
        self.desired_skills=""
        self.language_skills=""
        self.language_skills_comments=""
        self.volunteers_requested=0
        self.accepts_couples=false
        self.living_conditions_comments=""
        self.country_medical_considerations=""
        self.country_site_url=""
        self.country_flag_image=""
        self.opening_url=""
        self.favorited=false
    }
    
    // define the functions
    func toDictionary() -> Dictionary<String, Any>{
        var d = Dictionary<String, Any>()
        
        d["title"]=self.title
        d["req_id"]=self.req_id
        d["country"]=self.country
        d["region"]=self.region
        d["sector"]=self.sector
        d["apply_date"]=self.apply_date
        d["know_by"]=self.know_by
        d["staging_start_date"]=self.staging_start_date
        d["featured"]=self.featured
        d["project_description"]=self.project_description
        d["required_skills"]=self.required_skills
        d["desired_skills"]=self.desired_skills
        d["language_skills"]=self.language_skills
        d["language_skills_comments"]=self.language_skills_comments
        d["volunteers_requested"]=self.volunteers_requested
        d["accepts_couples"]=self.accepts_couples
        d["living_conditions_comments"]=self.living_conditions_comments
        d["country_medical_considerations"]=self.country_medical_considerations
        d["country_site_url"]=self.country_site_url
        d["country_flag_image"]=self.country_flag_image
        d["opening_url"]=self.opening_url
        d["favorited"]=self.favorited
        return d
    }
    
    
}
func jobFromDictionary(d:Dictionary<String,Any>)->Job{
    
    var j=Job()
    
    j.title=d["title"]as!String
    j.req_id=d["req_id"]as!String
    j.country=d["country"]as!String
    j.region=d["region"]as!String
    j.sector=d["sector"]as!String
    j.apply_date=d["apply_date"]as!String
    j.know_by=d["know_by"]as!String
    j.staging_start_date=d["staging_start_date"]as!String
    j.featured=d["featured"]as!Bool
    j.project_description=d["project_description"]as!String
    j.required_skills=d["required_skills"]as!String
    j.desired_skills=d["desired_skills"]as!String
    j.language_skills=d["language_skills"]as!String
    j.language_skills_comments=d["language_skills_comments"]as!String
    j.volunteers_requested=d["volunteers_requested"]as!Int
    j.accepts_couples=d["accepts_couples"]as!Bool
    j.living_conditions_comments=d["living_conditions_comments"]as!String
    j.country_medical_considerations=d["country_medical_considerations"]as!String
    j.country_site_url=d["country_site_url"]as!String
    j.country_flag_image=d["country_flag_image"]as!String
    j.opening_url=d["opening_url"]as!String
    j.favorited=d["favorited"]as!Bool
    return j
}
extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
}
class Node<T>{
    var value: T?
    var next: Node<T>?
    init(){}
    init(value: T) {
        self.value = value
    }
}
class JobList{
    var count: Int = 0
    var headNode: Node<Job> = Node<Job>()
    var lastNode: Node<Job> = Node<Job>()
    init() {
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func insert(value: Job) {
        var node = Node<Job>(value: value)
        if self.isEmpty() {
            self.headNode = node
            self.lastNode = node
        } else {
            node.next = self.headNode
            self.headNode = node
        }
        self.count++
    }
    
    
    //make better to string
    func toString(){
        var myNode = headNode;
        var i = 0
        while (myNode.next != nil){
            if let myOtherNode = myNode.value{
                println("\(i). \(myOtherNode.country) \(myOtherNode.region) \(myOtherNode.apply_date)")
                i++
                myNode = myNode.next!
            }
        }
        if let myOtherNode = myNode.value{
            println("\(i). \(myOtherNode.country) \(myOtherNode.region) \(myOtherNode.apply_date)")
        }
}
//    init(headNode: Node<Job>, lastNode: Node<Job>){
//        self.headNode = headNode
//        self.lastNode = lastNode
//    }
//
//
//    func createNode(myJob: Job)->Node<Job>{
//        var myNode = Node(item: myJob)
//        return myNode
//
//    }
//
//    func insert(myJob: Job, newNode: Node<Job>){
//        //inserts jobs in list
//
//        if(JobList.headNode){
//            JobList.headNode = newNode
//            JobList.lastNode = newNode
//        } else{
//            JobList.lastNode.next = newNode
//            JobList.lastNode = newnode
//        }
//    }
}