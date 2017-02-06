//
//  Prompt.swift
//  ProbabilityModelling
//
//  Created by Carlos Noble Curveira on 2017-02-03.
//  Copyright © 2017 Carlos Noble Curveira. All rights reserved.
//

import Foundation

class Prompt
{
    static func getInteger(prompt: String, min: Int, max: Int) -> Int
    {
        
        var output = 0
        var validInput = false
        
        repeat
        {
            print("\(prompt): ", terminator: "")
            
            // Unwrap the optional (readLine always returns an optional String data type)
            if let input = readLine(strippingNewline: true)
            {
                // We have a non-nil value, now to try to get it as an Int
                if let inputAsInteger = Int(input)
                {
                    // Use this input, if its in the right range
                    if (inputAsInteger <= max && inputAsInteger >= min)
                    {
                        validInput = true
                        output = inputAsInteger
                    } else {
                        print("Please enter an integer between \(min) and \(max)")
                    }
                } else {
                    // Tell the user what they need to do
                    print("Please enter an integer between \(min) and \(max)")
                }
            }
        } while validInput == false
        
        return output
    }
    
}
