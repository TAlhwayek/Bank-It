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
    
    
    // Get new random number 1 - 1000
    func getNewNumber() -> Int {
        // Update displayed number
        displayedNumber = nextNumber
        nextNumber = Int(arc4random_uniform(1001))
        
        // Disallow duplicates (just in case)
        if (nextNumber == displayedNumber) {
            nextNumber = Int(arc4random_uniform(1001))
        }
        // This is used to update the number label
        return displayedNumber
    }
    
    // Get score
    func getScore() -> Int {
        return score
    }
    
    // Checks for correct answer
    // Input: A bool that indicates which button was pressed
    // Output: Returns true if correct or false if incorrect
    func checkNumbers(userPressedHigher: Bool) -> Bool {
        var userGotItCorrect: Bool = false
        // Checking for correct answer
        if (nextNumber > displayedNumber && userPressedHigher) {
            userGotItCorrect = true
        } else if (displayedNumber > nextNumber && !userPressedHigher) {
            userGotItCorrect = true
        } else {
            userGotItCorrect = false
        }

        // Update score is answer is correct
//        if (userGotItCorrect) {
//            score += 1
//        }

        return userGotItCorrect
    }
}
