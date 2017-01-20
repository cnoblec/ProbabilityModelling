//
//  TwoDiceDistribution.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-20.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation


// For modleing the probability of rolling two dice and looking at their distribustion


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
