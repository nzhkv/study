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
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {
            return resultLabel.text = "Insert correct date"
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        let weekday = dateFormater.string(from: date)
        
        resultLabel.text = weekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

