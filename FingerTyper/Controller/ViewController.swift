//
//  ViewController.swift
//  FingerTyper
//
//  Created by Rotana Seang on 15/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    
    var highestScore = 0
    var lastGameScore = 0
    var firstGamePlayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiate labels
        highScoreLabel.text = ""
        highScoreLabel.isHidden = true
        
        //check if the first game is over
        if firstGamePlayed == true {
            showHighScore()
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func showHighScore() {
        //checks if the returned score is higher
        if lastGameScore > highestScore {
            highestScore = lastGameScore //set the new high score
            highScoreLabel.text = "Your Highscore is: \(highestScore)"
            highScoreLabel.isHidden = false
        }
        
    }
    
}

