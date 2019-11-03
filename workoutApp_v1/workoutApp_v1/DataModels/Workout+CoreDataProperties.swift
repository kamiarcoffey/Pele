//
//  Workout+CoreDataProperties.swift
//  workoutApp_v1
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
    static func insert(into context: NSManagedObjectContext, loggedWorkout: Activity) -> Workout {
        let workout: Workout = context.insertObject()
        workout.name = loggedWorkout.name
        workout.date = Date() // date gets set when the workout is completed - not when started, or anything to do with UI
        return workout
    }
}


