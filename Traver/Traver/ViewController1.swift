//
//  ViewController1.swift
//  Traver
//
//  Created by Student on 09/11/23.
//  Copyright © 2023 Student. All rights reserved.
//


import UIKit

class ViewController1: UIViewController {
    
    
    @IBOutlet weak var startTime: UIDatePicker!
    
    @IBOutlet weak var endTime: UIDatePicker!
    
    //    @IBOutlet weak var startTime: UIDatePicker!
//    @IBOutlet weak var endTime: UIDatePicker!
//    
    @IBAction func bookRide(_ sender: Any) {
        let diffTime = Int(endTime.date.timeIntervalSince1970 - startTime.date.timeIntervalSince1970)
        let caseHours = diffTime / 3600
        let caseMinutes = (diffTime % 3600) / 60
        
        let interval = DateInterval(start: startTime.date, end: endTime.date)
        let durationHours = interval.duration / 3600
        let durationMinutes = (interval.duration.truncatingRemainder(dividingBy: 3600)) / 60
        
        let alert = UIAlertController(title: "Ride Booked",
                                      message: "\(diffTime) seconds = \(caseHours) h:\(caseMinutes) m\nDuration = \(durationHours) hrs: \(durationMinutes) m",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


