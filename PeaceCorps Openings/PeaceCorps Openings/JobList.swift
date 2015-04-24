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
    //        init(title   : String,
    //            req_id  : String,
    //            country : String,
    //            region  : String,
    //            sector  : String,
    //            apply_date   : String,
    //            know_by : String,
    //            staging_start_date  : String,
    //            featured    : Bool,
    //            project_description : String,
    //            required_skills : String,
    //            desired_skills  : String,
    //            language_skills : String,
    //            language_skills_comments    : String,
    //            volunteers_requested    : Int,
    //            accepts_couples : Bool,
    //            living_conditions_comments  : String,
    //            country_medical_considerations  : String,
    //            country_site_url    : String,
    //            country_flag_image  : String,
    //            opening_url : String){
    //                self.title = title
    //                self.req_id = req_id
    //                self.country = country
    //                self.region = region
    //                self.sector = sector
    //                self.apply_date = apply_date
    //                self.know_by = know_by
    //                self.staging_start_date = staging_start_date
    //                self.featured = featured
    //                self.project_description = project_description
    //                self.required_skills = required_skills
    //                self.desired_skills = desired_skills
    //                self.language_skills = language_skills
    //                self.language_skills_comments = language_skills_comments
    //                self.volunteers_requested = volunteers_requested
    //                self.accepts_couples = accepts_couples
    //                self.living_conditions_comments = living_conditions_comments
    //                self.country_medical_considerations = country_medical_considerations
    //                self.country_site_url = country_site_url
    //                self.country_flag_image = country_flag_image
    //                self.opening_url = opening_url
    //        }
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
        var i = 1
        while (i < count){
            println(myNode.value?.country)
            i++
            myNode = myNode.next!
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