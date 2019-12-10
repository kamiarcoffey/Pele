//
//  PeleWorkout.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public struct PeleWorkout: Session, Codable {
    
//    public typealias T = PeleExercise

    public var name: String
    public var date: Date
    public var id: UUID
    public var exercises: [Exercise] //[PeleExercise]
    
    public func getName() -> String {
        return name
    }
    
    init(_ name: String, with exercises: [Exercise]) {  //[PeleExercise]
        self.name = name
        self.date = Date()
        self.id = UUID()
        self.exercises = exercises
    }
    
    init(_ name: String, date: Date, id: UUID,  with exercises: [Exercise]) {  //[PeleExercise]
        self.name = name
        self.date = date
        self.id = id
        self.exercises = exercises
    }
    
    // convinience init with empty PeleExercise list
    init(name: String) {
        self.init(name, with: [Exercise]()) // [PeleExercise]
    }

    
    init() {
        self.init(name: "")
    }
    
    // TODO: make this variadic
    mutating public func add(new exercise: Exercise) {
        self.exercises.append(exercise)
    }
    
    mutating func setName(name: String){
        self.name = name
    }
    
}

