//
//  PeleWorkout.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public struct PeleWorkout: Session, Codable {    
    public var name: String
    public var date: Date
    public var id: UUID
    public var exercises: [PeleExercise] //[Activity]
    
    public func getName() -> String {
        return name
    }
    
    init(_ name: String, with exercises: [PeleExercise]) {  //[Activity]
        self.name = name
        self.date = Date()
        self.id = UUID()
        self.exercises = exercises
    }
    
    // convinience init with empty activity list
    init(name: String) {
        self.init(name, with: [PeleExercise]()) // [Activity]
    }
    
}

