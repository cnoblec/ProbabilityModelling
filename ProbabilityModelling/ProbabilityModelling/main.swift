//
//  main.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-16.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

let numberedCube = Die(sides: 6)
let diceOne = Die(sides: 6)
let diceTwo = Die(sides: 6)
var diceOneRolls : [Int] = []
var diceTwoRolls : [Int] = []
var diceSum : [Int] = []
var rolls : [Int] = []
var differentRolls = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
var count = 0
var probDist: [Int:Float] = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
var x = 0

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

var choices : [Choice] = []

repeat
{
    // Prompt the user
    print("Please enter your #\(choices.count + 1) choice ", terminator: "")
    var tempChoice: Choice = Choice(value: 0, tab: false)
    
    // Unwrap the optional (readLine always returns an optional String data type)
    if let input = readLine(strippingNewline: true)
    {
        // We have a non-nil value, now to try to get it as an Int
        if let inputAsInteger = Int(input)
        {
            // Use this input, it's good
            if (inputAsInteger <= diceOne.sides + diceTwo.sides && inputAsInteger > 1)
            {
            tempChoice.value = inputAsInteger
            choices.append(tempChoice)
            } else {
                print("Please enter an integer value for your selection")
            }
            
        } else {
            // Tell the user what they need to do
            print("Please enter an integer value for your selection")
        }
    }
} while choices.count < 6


