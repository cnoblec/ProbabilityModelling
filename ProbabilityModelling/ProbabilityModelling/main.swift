//
//  main.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-16.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

let cubeOfNumbers = Die(sides: 6)
var diceOneRolls : [Int] = []
var diceTwoRolls : [Int] = []
var finalScore = 0
var rounds = 0
var gameMode = 1
var repeatedInput = false
var validInput = false

struct Choice
{
    var value : Int
    var tab : Bool
    init (value: Int, tab: Bool)
    {
        self.value = value
        self.tab = tab
    }
}

var choice = Choice.init(value: 0, tab: false)
var choices : [Choice] = []


repeat
{
    print("Enter 1 for repeats and 0 for no repeats on choices ", terminator: "")
    
    // Unwrap the optional (readLine always returns an optional String data type)
    if let input = readLine(strippingNewline: true)
    {
        // We have a non-nil value, now to try to get it as an Int
        if let inputAsInteger = Int(input)
        {
            // Use this input, if its in the right range
            if (inputAsInteger <= 1 && inputAsInteger >= 0)
            {
                validInput = true
                gameMode = inputAsInteger
            } else {
                print("Please enter a valid input for your selection")
            }
        } else {
            // Tell the user what they need to do
            print("Please enter an integer value for your selection")
        }
    }
} while validInput == false

repeat
{
    // Prompt the user
    print("Please enter your #\(choices.count + 1) choice ", terminator: "")
    var tempChoice: Choice = Choice(value: 0, tab: true)
    
    // Unwrap the optional (readLine always returns an optional String data type)
    if let input = readLine(strippingNewline: true)
    {
        // We have a non-nil value, now to try to get it as an Int
        if let inputAsInteger = Int(input)
        {
            // Use this input, if its in the right range
            if (inputAsInteger <= cubeOfNumbers.sides * 2 && inputAsInteger > 1)
            {
                if (gameMode == 0)
                {
                    for i in stride(from: 0, through: choices.count - 1, by: 1)
                    {
                        if choices[i].value == inputAsInteger
                        {
                            repeatedInput = true
                        }
                    }
                    if repeatedInput == false
                    {
                        tempChoice.value = inputAsInteger
                        choices.append(tempChoice)
                    } else {
                        print("No repeats are allowed")
                        repeatedInput = false
                    }
                } else {
                    tempChoice.value = inputAsInteger
                    choices.append(tempChoice)
                }
            } else {
                // Tell the user what they need to do
                print("Please enter an integer value for your selection")
            }
        } else {
            // Tell the user what they need to do
            print("Please enter an integer value for your selection")
        }
    }
} while choices.count < 5

func diceGame(choiceArray: [Choice]) -> Int
{
    diceTwoRolls = cubeOfNumbers.roll(times: 6)!
    diceOneRolls = cubeOfNumbers.roll(times: 6)!
    var array = choiceArray
    finalScore = 0
    for i in stride(from: 0, through: array.count - 1, by: 1)
    {
        var tabSwaps = 0
        for e in stride(from: 0, through: diceOneRolls.count - 1, by: 1)
        {
            if array[i].value == Int(diceOneRolls[e]) + Int(diceTwoRolls[e])
            {
                tabSwaps += 1
                if (tabSwaps < 3)
                {
                    array[i].tab = !array[i].tab
                }
            }
        }
        if array[i].tab == true
        {
            finalScore += array[i].value
        }
    }
    return finalScore
}

var choiceItt : [Choice] = [choice, choice, choice, choice, choice]

for a in stride(from: 0, through: 11, by: 1)
{
    choiceItt[0] = (Choice.init(value: a, tab: false))
    for b in stride(from: 0, through: 11, by: 1)
    {
        choiceItt[1] = (Choice.init(value: b, tab: false))
        for c in stride(from: 0, through: 11, by: 1)
        {
            choiceItt[2] = (Choice.init(value: c, tab: false))
            for d in stride(from: 0, through: 11, by: 1)
            {
                choiceItt[3] = (Choice.init(value: d, tab: false))
                for e in stride(from: 0, through: 11, by: 1)
                {
                    choiceItt[4] = (Choice.init(value: e, tab: false))
                    print(diceGame(choiceArray: choiceItt))
                }
            }
        }
    }
}

// print("your final score was \(diceGame(choiceArray: choices))")
// print("the rolls were")
// for i in stride(from: 0, through: choices.count - 1, by: 1)
// {
//     print("\(Int(diceOneRolls[i]) + Int(diceTwoRolls[i]))")
// }


