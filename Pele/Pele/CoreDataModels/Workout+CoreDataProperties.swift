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

final class Workout: NSManagedObject {
    
}

extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var sets: NSSet?

}

// MARK: Generated accessors for sets
extension Workout {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: ExerciseSet)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: ExerciseSet)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

/* Make Workout conform to Manged */
/* give workouts a default sorting by date */
extension Workout: Manged {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}

/* implement insertion behavior */
extension Workout {
    static func insert(into context: NSManagedObjectContext, loggedWorkout: Session) -> Workout {
        let workout: Workout = context.insertObject()
        workout.name = loggedWorkout.name
        workout.date = Date() // date gets set when the workout is completed - not when started, or anything to do with UI
        workout.id = UUID()
        for exercise in loggedWorkout.exercises {
            for set in exercise.sets {
                let singleSet: ExerciseSet = context.insertObject()
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
}

extension Workout: ConvertableToLocal {
    
    typealias T = PeleWorkout

   // convert yourself to an NSObject T
    func convertToLocal() -> T {
        let peleExercises: [PeleExercise] = self.sets?.compactMap{PeleExercise.init(exerciseSet: $0 as? ExerciseSet ?? ExerciseSet())} ?? [PeleExercise]()
        return T(self.name ?? "DB object has no name", date: self.date ?? Date(), id: self.id ?? UUID(), with: peleExercises)

    }
}


