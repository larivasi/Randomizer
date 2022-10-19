//
//  RandomNumberModel.swift
//  Randomizer
//
//  Created by Vasyl Larin on 17.10.2022.
//

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
