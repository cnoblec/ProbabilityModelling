//
//  TwoDiceDistribution.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-20.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation


// For modleing the probability of rolling two dice and looking at their distribustion
//var differentRolls = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
//var probDist: [Int:Float] = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
//var diceSum : [Int] = []
//var count = 0
//var x = 0
//
//for i in stride(from: 0, through: 999, by: 1)
//{
//    diceOneRolls.append(Int(arc4random_uniform(6))+1)
//    diceTwoRolls.append(Int(arc4random_uniform(6))+1)
//    diceSum.append(diceOneRolls[i]+diceTwoRolls[i])
//    x = Int(diceSum[i])
//    differentRolls[x]! += 1
//    count += 1
//}
//
//print("the count is \(count)")
//
//for i in stride(from: 2, through: 12, by: 1)
//{
//    var a = 0
//    if let y = differentRolls[i] as Int?
//    {
//        a = y
//        probDist[i] = Float(a)/Float(count)
//    }
//    if let b = probDist[i] as Float?
//    {
//        print("\(i): \(b*100)%")
//    }
//}


//
// commented out user interface single selection code
//


// print("your final score was \(diceGame(choiceArray: choices))")
// print("the rolls were")
// for i in stride(from: 0, through: choices.count - 1, by: 1)
// {
//     print("\(Int(diceOneRolls[i]) + Int(diceTwoRolls[i]))")
// }

//
// For taking input and trying what the user provided the fuctionality for different game modes is built in already
//

//repeat
//{
//    print("Enter 1 for repeats and 0 for no repeats on choices ", terminator: "")
//
//    // Unwrap the optional (readLine always returns an optional String data type)
//    if let input = readLine(strippingNewline: true)
//    {
//        // We have a non-nil value, now to try to get it as an Int
//        if let inputAsInteger = Int(input)
//        {
//            // Use this input, if its in the right range
//            if (inputAsInteger <= 1 && inputAsInteger >= 0)
//            {
//                validInput = true
//                gameMode = inputAsInteger
//            } else {
//                print("Please enter a valid input for your selection")
//            }
//        } else {
//            // Tell the user what they need to do
//            print("Please enter an integer value for your selection")
//        }
//    }
//} while validInput == false
//
//repeat
//{
//    // Prompt the user
//    print("Please enter your #\(choices.count + 1) choice ", terminator: "")
//    var tempChoice: Choice = Choice(value: 0, tab: true)
//
//    // Unwrap the optional (readLine always returns an optional String data type)
//    if let input = readLine(strippingNewline: true)
//    {
//        // We have a non-nil value, now to try to get it as an Int
//        if let inputAsInteger = Int(input)
//        {
//            // Use this input, if its in the right range
//            if (inputAsInteger <= cubeOfNumbers.sides * 2 && inputAsInteger > 1)
//            {
//                if (gameMode == 0)
//                {
//                    for i in stride(from: 0, through: choices.count - 1, by: 1)
//                    {
//                        if choices[i].value == inputAsInteger
//                        {
//                            repeatedInput = true
//                        }
//                    }
//                    if repeatedInput == false
//                    {
//                        tempChoice.value = inputAsInteger
//                        choices.append(tempChoice)
//                    } else {
//                        print("No repeats are allowed")
//                        repeatedInput = false
//                    }
//                } else {
//                    tempChoice.value = inputAsInteger
//                    choices.append(tempChoice)
//                }
//            } else {
//                // Tell the user what they need to do
//                print("Please enter an integer value for your selection")
//            }
//        } else {
//            // Tell the user what they need to do
//            print("Please enter an integer value for your selection")
//        }
//    }
//} while choices.count < 5
