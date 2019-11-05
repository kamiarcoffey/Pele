//
//  ExerciseSet+CoreDataProperties.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
//

import Foundation
import CoreData


final class ExerciseSet : NSManagedObject {
    
}

extension ExerciseSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSet> {
        return NSFetchRequest<ExerciseSet>(entityName: "ExerciseSet")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var isWeights: Bool
    @NSManaged public var numReps: Int64
    @NSManaged public var weight: Int64
    @NSManaged public var workout: Workout?

}
