//
//  ExerciseSet+CoreDataProperties.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
//

import Foundation
import CoreData


final class NSExerciseSet : NSManagedObject {}

extension NSExerciseSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSExerciseSet> {
        return NSFetchRequest<NSExerciseSet>(entityName: "NSExerciseSet")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var isWeights: Bool
    @NSManaged public var numReps: Int64
    @NSManaged public var weight: Int64
    @NSManaged public var workout: NSWorkout?

}

extension NSExerciseSet: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(exerciseName), ascending: false)]
    }
}
