//
//  Builder.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

protocol Builder {

    func setName(name: String)
    func setDate(date: NSDate)
}

enum Parts {
    case exercise(name: String, date: NSDate)
}

class ExerciseProduct {

    private var name = ""
    private var date = NSDate()

    func addName(name: String) {
        self.name = name
    }
    
    func addDate(date: NSDate) {
        self.date = date
    }

//    func getProdcut() -> Parts {
//        let product = Parts.exercise(name: self.name, date: self.date)
//        return product
//    }
}

class ExerciseBuilder: Builder {

    
    private var exercise = ExerciseProduct()

    func reset() {
        exercise = ExerciseProduct()
    }

    func setName(name: String) {
        exercise.addName(name: name)
    }
    
    
    func setDate(date: NSDate) {
        exercise.addDate(date: date)

    }

    func retrieveProduct() -> ExerciseProduct {
        let result = self.exercise
        reset()
        return result
    }
}

