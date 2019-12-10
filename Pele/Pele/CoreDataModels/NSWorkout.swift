//
//  Workout+CoreDataProperties.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
//

import Foundation
import CoreData

final class NSWorkout: NSManagedObject {
}

extension NSWorkout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSWorkout> {
        return NSFetchRequest<NSWorkout>(entityName: "NSWorkout")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var sets: NSSet?

}

// MARK: Generated accessors for sets
extension NSWorkout {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: NSExerciseSet)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: NSExerciseSet)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

/* Make Workout conform to Manged */
/* give workouts a default sorting by date */
extension NSWorkout: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}

/* implement insertion behavior */
extension NSWorkout {
    static func insert(into context: NSManagedObjectContext, loggedWorkout: Session) -> NSWorkout {
        let workout: NSWorkout = context.insertObject()
        workout.name = loggedWorkout.name
        workout.date = Date() // date gets set when the workout is completed - not when started, or anything to do with UI
        workout.id = UUID()
        for exercise in loggedWorkout.exercises {
            for set in exercise.sets {
                let singleSet: NSExerciseSet = context.insertObject()
                singleSet.exerciseName = exercise.name
                singleSet.isWeights = exercise.isWeights
                singleSet.numReps = Int64(set.repCount)
                singleSet.weight = Int64(set.reps.compactMap{ $0.weight }.max() ?? 0)
                singleSet.workout = workout
                workout.addToSets(singleSet)
            }
        }
        print("Saved\n", workout)
        return workout
    }
    
    static func delete(from context: NSManagedObjectContext, deleteWorkout: NSWorkout) -> NSWorkout {
        return deleteWorkout
    }

}

extension NSWorkout: ConvertableToLocal {
    
    typealias T = PeleWorkout

   // convert yourself to an NSObject T
    func convertToLocal() -> T {
        let peleExercises: [Exercise] = self.sets?.compactMap{Exercise.init(exerciseSet: $0 as? NSExerciseSet ?? NSExerciseSet())} ?? [Exercise]()
        return T(self.name ?? "DB object has no name", date: self.date ?? Date(), id: self.id ?? UUID(), with: peleExercises)

    }
}
