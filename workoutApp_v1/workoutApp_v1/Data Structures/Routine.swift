//
//  Routine.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/24/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


struct Routine: Identifiable, Codable, Hashable {
    
    let id = UUID()
    var name: String
    var exerciseList: [Exercise]
    
    var getExerciseList: [Exercise] {
        return exerciseList
    }
    
    var exerciseCount: String {
        return String(exerciseList.count)
    }
    
    var getName: String {
        return name
    }
}

extension Routine {
    public static func == (lhs: Routine, rhs: Routine) -> Bool {
        return (lhs.getName == rhs.getName)
     }
      
     // name is enough to uniquley identify an Exercise
     public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
    }
}
