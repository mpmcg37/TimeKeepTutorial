//
//  Employee.swift
//  TimeKeepTutorial
//
//  Created by Mitch on 3/11/15.
//  Copyright (c) 2015 Mitch. All rights reserved.
//

import Foundation

class Employee {
    let startedDate = NSDate(), PIN = UInt(random()%1000)
    var date: NSDate, totalTime: Int, clockedIn = false
    var intervals = [String: Int]()
    var dates = [NSDate]()
    var nf = NSNumberFormatter()
    
    
    init(){
        date = NSDate()
        totalTime = 0
        nf.maximumFractionDigits = 3
    }
    
    func clockIn(newDate: NSDate){
        if !clockedIn {
            clockedIn = true
            dates.append(newDate)
            date = newDate
        }
    }
    
    func clockOut(newDate: NSDate) -> String{
        if clockedIn {
            let length = Int(newDate.timeIntervalSinceDate(date))
            totalTime+=length
            dates.append(newDate)
            intervals[newDate.description] = length
            clockedIn = false
            return toString()
        }
        return ""
    }
    
    private func secondsToHours(time: Int) -> String?{
        return nf.stringFromNumber((Double(time)/3600))
    }
    
    func clockInTime() -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(date)
    }
    
    func toString() -> String {
        return secondsToHours(totalTime)!
    }
    
    var hoursInfo: String {
        return "Total Hours: " + secondsToHours(totalTime)!
    }
    
}
