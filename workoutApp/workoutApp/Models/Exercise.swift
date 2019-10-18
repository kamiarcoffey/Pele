//
//  Exercise.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


class Exercise : Activity {
    
    var name: String
    var weights: Bool
    
    init(with name: String, isWeights weights: Bool) {
        self.name = name
        self.weights = weights
    }
    
    func getName() -> String {
        return self.name
    }
}
