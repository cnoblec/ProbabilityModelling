//
//  Die.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-01-18.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

class Die
{
    var sides : Int
    init (sides:Int)
    {
        self.sides = sides
    }
    func roll(times: Int = 1) -> [Int]?
    {
        var ret: [Int] = []
        if times > 0 {
            for _ in stride(from: 1, through: times, by: 1)
            {
                ret.append(Int(arc4random_uniform(UInt32(sides)))+1)
            }
            return ret
        } else {
            return nil
        }
    }
}

