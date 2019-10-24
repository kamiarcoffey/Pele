//
//  Exercise.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


public class Exercise : Codable, Hashable, Activity {
    
    public var name: String
    public var weights: Bool
    
    init(with name: String, isWeights weights: Bool) {
        self.name = name
        self.weights = weights
    }
    
    public func getName() -> String {
        return self.name
    }
}


// MARK: conform to Hashable
extension Exercise {
    
    public static func == (lhs: Exercise, rhs: Exercise) -> Bool {
       return (lhs.getName() == rhs.getName())
    }
     
    // name is enough to uniquley identify an Exercise
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
   }
}
