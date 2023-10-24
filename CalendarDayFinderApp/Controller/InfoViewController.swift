//
//  InfoViewController.swift
//  CalendarDayFinderApp
//
//  Created by liga.griezne on 24/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var info: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info, let desc = desc {
            appInfoLabel.text = info
            appDescLabel.text = desc
        }
        
    }

}
