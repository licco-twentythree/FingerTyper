//
//  Word.swift
//  FingerTyper
//
//  Created by Rotana Seang on 15/5/21.
//

import Foundation
//added comment 9:31pm -amin 

struct Word {
    
    var word: String
    
    func getPointsWorth() -> Int {
        var points = 0;
        for _ in word {
            points+=1
        }
        print(points)
        return points
    }
    
}
