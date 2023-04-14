//
//  SettingsViewController.swift
//  DayFinder
//
//  Created by Arkadijs Makarenko on 12/04/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func oprenSettingTapped(_ sender: Any) {
        openSettings()
    }
    
    func openSettings(){
        guard let settingURL = URL(string: UIApplication.openSettingsURLString) else {return}
        
        if UIApplication.shared.canOpenURL(settingURL){
            UIApplication.shared.open(settingURL)
        }
    }
    
    func setLabelText(){
        var text = "Unable to set mode"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode On"
        }else{
            text = "Light Mode On"
        }
        textLabel.text = text
    }
    

}

extension SettingsViewController{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
