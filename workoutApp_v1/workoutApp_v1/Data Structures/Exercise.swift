//
//  Exercise.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


public class Exercise : Identifiable, Codable, Hashable, Activity {
    
    public let id = UUID()
    public var name: String
    public var weights: Bool
    
    init(_ name: String, _ isWeights: Bool) {
        self.name = name
        self.weights = isWeights
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
        hasher.combine(id)
   }
}

/*
class TransformableContainer: NSManagedObject {
    @NSManaged var transformableAttribute: ExerciseContainer
}


 class ExerciseContainer: NSObject, NSCoding {
    
    var exercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.exercise = aDecoder.decodeObject(self.exercise)
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(exercise, forKey: "exercise")
    }
}
*/
