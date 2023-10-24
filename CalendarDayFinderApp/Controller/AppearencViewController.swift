//
//  AppearencViewController.swift
//  CalendarDayFinderApp
//
//  Created by liga.griezne on 24/10/2023.
//

import UIKit

class AppearencViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var closeButtonX: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closeItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func openSettings(_ sender: Any) {
        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }

    func setLabelText() {
        textLabel.text = traitCollection.userInterfaceStyle == .dark ? "Dark Mode on"  : "Dark Mode off"
    }
}

        extension AppearencViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}

