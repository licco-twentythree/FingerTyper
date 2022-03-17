//
//  GameController.swift
//  FingerTyper
//
//  Created by Rotana Seang on 18/5/21.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var fingerTyper = FingerTyper()
    var currentWord = Word(word: "Placeholder") //placeholder word
    var score = 0 //intialise the score variable
    var remainingTime = 60// initialise the amount of seconds the game will take
    var gameFinished = false
    
    var timer = Timer()
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var userEntryTextField: UITextField!
    @IBOutlet weak var currentWordLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEntryTextField.becomeFirstResponder() //starts the user in the textfield
        
        fingerTyper.loadArray() //load the array of words
        
        timerLabel.text = String(remainingTime)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.countDown()
        }
        
        currentWord = fingerTyper.words.randomElement() ?? Word(word: "Random") //select a random element of the words
        fingerTyper.removeWord(wordToBeRemoved: currentWord) //remove that element from the array so it doesnt show again
        currentWordLabel.text = currentWord.word //set the label as the text
        
    }
    
    
    @IBAction func userTyped(_ sender: Any) {
        if currentWordLabel.text == userEntryTextField.text && gameFinished == false { //if the user enters the word correctly
            
            let pathToSound = Bundle.main.path(forResource: "correct", ofType: "wav")!
            let soundURL = URL(fileURLWithPath: pathToSound)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                Swift.print("Sound Was unable to be found")
            }
                
            
            userEntryTextField.text = "" //set the tf to no text
            
            score = fingerTyper.addScore(currentScore: score, currentWord: currentWord) //get the score
            scoreLabel.text = String(score) //set the score to the label
            
            
            currentWord = fingerTyper.words
                .randomElement() ?? Word(word: "Error") //randomly select a word again
            fingerTyper.removeWord(wordToBeRemoved: currentWord) //remove it from the list so it doesnt appear again
            currentWordLabel.text = currentWord.word //set the text for the new word
            
        } else if gameFinished == true {
            endGame()
        }
    }
    
    
    
    @objc func countDown() {
        remainingTime -= 1
        timerLabel.text = String(remainingTime) //changes the label to show the timer counting down
        
        if remainingTime == 0 { // if the timer hits - then stop the game
            timer.invalidate()
            gameFinished = true
        }
    }
    
    //send the scores to the main memu so that the high score can be displayed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainMenu" {
            let destination = segue.destination as! ViewController
            destination.lastGameScore = score
            destination.firstGamePlayed = true
        }
    }
    
    @objc func endGame() {
        userEntryTextField.isHidden = true //disable text field
        performSegue(withIdentifier: "toMainMenu", sender: self) //segues the user into the main menu
        
    }
    
   
    
}
