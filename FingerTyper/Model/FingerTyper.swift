//
//  FingerTyper.swift
//  FingerTyper
//
//  Created by Rotana Seang on 15/5/21.
//

import Foundation

class FingerTyper {
        
    var words = [Word]() //initialise array of words
    
    var strings: [String] = [] //initialise array of strings to be made into the word structure data type
    
    func loadArray() {
        //this loads the words from words.txt into a word data type
        if let path = Bundle.main.path(forResource: "words", ofType: "txt"){
            do {
                let file = try String(contentsOfFile: path)
                strings = file.components(separatedBy: "\n")
            } catch let error {
                Swift.print("Fatal Error: \(error.localizedDescription)")
            }
        }
        
        for string in strings {
            let myObject = Word(word: string)
            words.append(myObject)
        }
    }
    //when a user correctly types add score ontop
    func addScore(currentScore: Int, currentWord: Word) -> Int {
        let newScore = currentScore + currentWord.getPointsWorth()
        return newScore
    }
    //removes the word from the array so it doesnt appear again
    func removeWord(wordToBeRemoved: Word) {
        var i = 0;
        for word in words {
            if wordToBeRemoved.word == word.word{
                words.remove(at: i)
            }
            i+=1
        }
    }
}









