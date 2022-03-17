//
//  SettingsViewController.swift
//  FingerTyper
//
//  Created by Amin Azam on 19/5/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeSliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeSlider.value = 60 //set the default value for the slider
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let vc = segue.destination as! GameViewController
            vc.remainingTime = Int(timeSlider.value)
        }
    }
    
    @IBAction func timeSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        timeSliderLabel.text = "\(currentValue)"
    }
    
    


}
