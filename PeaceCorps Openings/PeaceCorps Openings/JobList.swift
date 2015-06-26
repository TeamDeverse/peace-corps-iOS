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