//
//  ViewController.swift
//  TimeKeepTutorial
//
//  Created by Mitch on 3/11/15.
//  Copyright (c) 2015 Mitch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var people = [String: Employee]()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hoursLabel.hidden = true
        infoLabel.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clockInOut(sender: UIButton) {
        var firstTime = false
        if let name = nameField.text {
            if people.indexForKey(name) == nil {
                people[name] = Employee()
                firstTime = true
            }
            
            if people[name]?.clockedIn != true
            {
                people[name]?.clockIn(NSDate())
                hoursLabel.text = "\(name) Clocked In"
                if firstTime {
                    infoLabel.text = "Your PIN is \(people[name]!.PIN)"
                    infoLabel.hidden = false
                }
                else{
                    infoLabel.hidden = true
                }
            }
            
            else {
                var time = people[name]!
                hoursLabel.text = "\(name) Clocked out with \(time.clockOut(NSDate())) hours"
                infoLabel.text = "Hours for current period: \(time.toString())"
                infoLabel.hidden = false
            }
            hoursLabel.hidden = false
        }
    }
}

