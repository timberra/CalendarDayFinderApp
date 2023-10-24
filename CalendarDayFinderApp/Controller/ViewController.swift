//
//  ViewController.swift
//  CalendarDayFinderApp
//
//  Created by liga.griezne on 23/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextFiled: UITextField!
    @IBOutlet weak var monthTextFiled: UITextField!
    @IBOutlet weak var yearTextFiled: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    
    var isFind = true
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func findDayOfWeek(_ sender: Any) {
        isValidDate()
        findButtonTapped()
    }
    
    func isValidDate() {
        guard let dayText = dayTextFiled.text,
              let monthText = monthTextFiled.text,
              let yearText = yearTextFiled.text,
              let day = Int(dayText),
              let month = Int(monthText),
              let year = Int(yearText)
        else {
            resultLabel.text = "Invalide date"
            return
        }
        let calendar = Calendar(identifier: .gregorian)
        
        guard (1...12).contains(month) else {
            resultLabel.text = "Invalid month"
            return
        }
        
        guard let maxDay = calendar.range(of: .day, in: .month, for: calendar.date(from: DateComponents(year: year, month: month, day: 1))!),
              (1...maxDay.count).contains(day) else {
            resultLabel.text = "Invalid day"
            return
        }
        
        if let date = calendar.date(from: DateComponents(year: year, month: month, day: day)) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayOfWeek = dateFormatter.string(from: date)
            resultLabel.text = dayOfWeek
            
        } else {
            resultLabel.text = "Invalid date"
        }
    }
    
    func findButtonTapped() {
        isFind.toggle()
        if isFind {
            dayTextFiled.text = ""
            monthTextFiled.text = ""
            yearTextFiled.text = ""
            resultLabel.text = "Result"
            findButton.setTitle("Find", for: .normal)
        } else {
            findButton.setTitle("Clear", for: .normal)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let info = segue.destination as? InfoViewController else {return}
            info.info = "Day is"
            info.desc = resultLabel.text
        }
    }
}

