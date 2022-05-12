//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Nikolay Zhukov on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(dateTF.text!)
        dateComponents.month = Int(monthTF.text!)
        dateComponents.year = Int(yearTF.text!)
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        
        let date = calendar.date(from: dateComponents)
        
        let weekday = dateFormater.string(from: date!)
        
        resultLabel.text = weekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

