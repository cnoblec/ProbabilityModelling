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
var rounds = 0
var gameMode = 1
var repeatedInput = false
var validInput = false
var testsPerDeck = 1
var percentSuccess = 0
var programMode = 0

var topTierChoice: [[Int]] = [[]]

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

func diceGame(choiceArray: [Choice]) -> Int
{
    diceTwoRolls = cubeOfNumbers.roll(times: 6)!
    diceOneRolls = cubeOfNumbers.roll(times: 6)!
    var array = choiceArray
    var finalScore = 0
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

repeat
{
    print("Would you like to play the game(1) or see the best hands(2)?: ", terminator: "")
    
    // Unwrap the optional (readLine always returns an optional String data type)
    if let input = readLine(strippingNewline: true)
    {
        // We have a non-nil value, now to try to get it as an Int
        if let inputAsInteger = Int(input)
        {
            // Use this input, if its in the right range
            if (inputAsInteger <= 2 && inputAsInteger >= 1)
            {
                validInput = true
                programMode = inputAsInteger
            } else {
                print("Please enter an integer between 1 and 2")
            }
        } else {
            // Tell the user what they need to do
            print("Please enter an integer between 1 and 2")
        }
    }
} while programMode == 0


if programMode == 1
{
    // For taking input and trying what the user provided the fuctionality for different game modes is built in already
    
    
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
    
    
    
} else if programMode == 2 {
    repeat
    {
        print("Enter the number of tests you want to run per hand (higher will be more accurate but take much longer): ", terminator: "")
        
        // Unwrap the optional (readLine always returns an optional String data type)
        if let input = readLine(strippingNewline: true)
        {
            // We have a non-nil value, now to try to get it as an Int
            if let inputAsInteger = Int(input)
            {
                // Use this input, if its in the right range
                if (inputAsInteger <= 100 && inputAsInteger >= 0)
                {
                    validInput = true
                    testsPerDeck = inputAsInteger
                } else {
                    print("Please enter an integer between 0 and 100")
                }
            } else {
                // Tell the user what they need to do
                print("Please enter an integer between 0 and 100")
            }
        }
    } while validInput == false
    
    
    validInput = false
    
    repeat
    {
        print("Enter minimun success rate as a percent (ex. 90 for at least 90% success rate, rounds to the nearest 10): ", terminator: "")
        
        // Unwrap the optional (readLine always returns an optional String data type)
        if let input = readLine(strippingNewline: true)
        {
            // We have a non-nil value, now to try to get it as an Int
            if let inputAsInteger = Int(input)
            {
                // Use this input, if its in the right range
                if (inputAsInteger <= 100 && inputAsInteger >= 0)
                {
                    validInput = true
                    percentSuccess = inputAsInteger
                } else {
                    print("Please enter an integer between 0 and 100")
                }
            } else {
                // Tell the user what they need to do
                print("Please enter an integer between 0 and 100")
            }
        }
    } while validInput == false
    
    print("This will take a second, the program is checking every possible hand...")
    
    var handChoice : [Choice] = [choice, choice, choice, choice, choice]
    var bestChoiceID : [Int] = []
    
    for a in stride(from: 2, through: 12, by: 1)
    {
        handChoice[0] = (Choice.init(value: a, tab: false))
        for b in stride(from: 2, through: 12, by: 1)
        {
            handChoice[1] = (Choice.init(value: b, tab: false))
            for c in stride(from: 2, through: 12, by: 1)
            {
                handChoice[2] = (Choice.init(value: c, tab: false))
                for d in stride(from: 2, through: 12, by: 1)
                {
                    handChoice[3] = (Choice.init(value: d, tab: false))
                    for e in stride(from: 2, through: 12, by: 1)
                    {
                        var deckSuccess = 0
                        var topTierHandInt: [Int] = []
                        handChoice[4] = (Choice.init(value: e, tab: false))
                        //print(diceGame(choiceArray: choiceItt))
                        // try each deck 10 times
                        for _ in stride(from: 1, through: testsPerDeck, by: 1)
                        {
                            if (diceGame(choiceArray: handChoice) == 0)
                            {
                                deckSuccess += 1
                            }
                        }
                        if deckSuccess >= testsPerDeck - (100-percentSuccess)/10*(testsPerDeck/10)
                        {
                            for card in stride(from: 0, through: handChoice.count - 1, by: 1)
                            {
                                topTierHandInt.append(handChoice[card].value)
                            }
                            topTierChoice.append(topTierHandInt)
                        }
                    }
                }
            }
        }
    }
    print("The choices with at least \((testsPerDeck - (100-percentSuccess)/10*(testsPerDeck/10))*100/(testsPerDeck))% success rate are...")
    print(topTierChoice)
}
