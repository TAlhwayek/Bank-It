//
//  bankClass.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/30/23.
//

import UIKit

class BankClass {
    // Needed variables
    var displayedNumber: Int = 0
    var nextNumber: Int = Int(arc4random_uniform(1001))
    var score: Int = 0
    var lives: Int = 3
    
    // Used to store gamesPlayed statistic
    var gamesPlayed: Int {
        get {
            return UserDefaults.standard.integer(forKey: "GamesPlayedKey")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "GamesPlayedKey")
        }
    }
    
    // Get high score
    var highScore: Int {
        get {
            return UserDefaults.standard.integer(forKey: "HighScoreKey")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "HighScoreKey")
        }
    }
    
    // Get new random number 1 - 1000
    func getNewNumber() -> Int {
        // Update displayed number
        displayedNumber = nextNumber
        // Generate new number
        nextNumber = Int(arc4random_uniform(1000))
        
        // Disallow duplicates (just in case)
        if (nextNumber == displayedNumber) {
            nextNumber = Int(arc4random_uniform(1000))
        }
        // This is used to update the number label
        return displayedNumber
    }
    
    // Get score
    func getScore() -> Int {
        return score
    }
    
    // Get lives
    func getLives() -> Int {
        return lives
    }
    
    // Checks for correct answer
    // Input: A bool that indicates which button was pressed
    // Output: Returns true if correct or false if incorrect
    func checkNumbers(userPressedHigher: Bool) -> Bool {
        var userGotItCorrect: Bool = false
        // Checking for correct answer
        // If user pressed higher and the answer is correct
        if (nextNumber > displayedNumber && userPressedHigher) {
            userGotItCorrect = true
        // If user pressed lower and the answer is correct
        } else if (displayedNumber > nextNumber && !userPressedHigher) {
            userGotItCorrect = true
        // The answer is incorrect
        } else {
            userGotItCorrect = false
            lives -= 1
        }
        
        return userGotItCorrect
    }
    
    // Update high score if new score is larger than the old high score
    func updateHighScore() -> Int {
        if score > highScore {
            highScore = score
        }
        return highScore
    }
    
    // Update games played
    func updateGamesPlayed() -> Int {
        gamesPlayed += 1
        return gamesPlayed
    }
    
    // Returns games played
    func getGamesPlayed() -> Int {
        return gamesPlayed
    }
}
