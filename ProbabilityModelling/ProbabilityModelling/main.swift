//
//  main.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-16.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

var diceOne : [Int] = []
var diceTwo : [Int] = []
var diceSum : [Int] = []
var rolls : [Int] = []
var differentRolls = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
var count = 0
var probDist: [Int:Float] = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]
var x = 0

struct Choice
{
    var number : Int
    var value : Int
    var tab : Bool
    init (number: Int, value: Int, tab: Bool)
    {
        self.number = number
        self.value = value
        self.tab = tab
    }
}

var choices : [Choice] = []

for i in stride(from: 0, through: 999999, by: 1)
{
    diceOne.append(Int(arc4random_uniform(6))+1)
    diceTwo.append(Int(arc4random_uniform(6))+1)
    diceSum.append(diceOne[i]+diceTwo[i])
    x = Int(diceSum[i])
    differentRolls[x]! += 1
    count += 1
}

print("the count is \(count)")

for i in stride(from: 2, through: 12, by: 1)
{
    var a = 0
    if let y = differentRolls[i] as Int?
    {
        a = y
        probDist[i] = Float(a)/Float(count)
    }
    if let b = probDist[i] as Float?
    {
        print("\(i): \(b*100)%")
    }
}
