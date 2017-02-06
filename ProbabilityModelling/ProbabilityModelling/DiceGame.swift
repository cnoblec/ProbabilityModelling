//
//  DiceGame.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-02-03.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

class DiceGame
{
    static func diceGame(choiceArray: [Choice]) -> Int
    {
        diceTwoRolls = cubeOfNumbers.roll(times: choiceArray.count)!
        diceOneRolls = cubeOfNumbers.roll(times: choiceArray.count)!
        var array = choiceArray
        var finalScore = 0
        
        // itterate the length of the choices given and check if we need to toggle the tab
        
        for i in stride(from: 0, through: choiceArray.count - 1, by: 1)
        {
            // to keep track of how many times we take it off the tab
            var tabToggle = 0
            for e in stride(from: 0, through: diceOneRolls.count - 1, by: 1)
            {
                if choiceArray[i].value == Int(diceOneRolls[e]) + Int(diceTwoRolls[e])
                {
                    tabToggle += 1
                    if (tabToggle < 3)
                    {
                        // invert if its on the tab or not
                        array[i].tab = !array[i].tab
                    }
                }
            }
            // calculate the score based off of values when tab is true
            if array[i].tab == true
            {
                finalScore += array[i].value
            }
        }
        return finalScore
    }
}
