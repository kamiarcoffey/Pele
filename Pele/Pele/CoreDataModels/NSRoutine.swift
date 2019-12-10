//
//  NSRoutine.swift
//  Pele
//
//  Created by Kamiar Coffey on 12/10/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
//

import Foundation
import CoreData

final class NSRoutine: NSManagedObject {}

extension NSRoutine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSRoutine> {
        return NSFetchRequest<NSRoutine>(entityName: "NSRoutine")
    }

    @NSManaged public var name: String?
    @NSManaged public var orderRank: Int64
    @NSManaged public var exercises: NSOrderedSet?

}

// MARK: accessors for exercises
extension NSRoutine {

    @objc(insertObject:inExercisesAtIndex:)
    @NSManaged public func insertIntoExercises(_ value: NSExercise, at idx: Int)

    @objc(removeObjectFromExercisesAtIndex:)
    @NSManaged public func removeFromExercises(at idx: Int)

    @objc(insertExercises:atIndexes:)
    @NSManaged public func insertIntoExercises(_ values: [NSExercise], at indexes: NSIndexSet)

    @objc(removeExercisesAtIndexes:)
    @NSManaged public func removeFromExercises(at indexes: NSIndexSet)

    @objc(replaceObjectInExercisesAtIndex:withObject:)
    @NSManaged public func replaceExercises(at idx: Int, with value: NSExercise)

    @objc(replaceExercisesAtIndexes:withExercises:)
    @NSManaged public func replaceExercises(at indexes: NSIndexSet, with values: [NSExercise])

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: NSExercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: NSExercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSOrderedSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSOrderedSet)

}

extension NSRoutine: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(orderRank), ascending: true)]
    }
}

extension NSRoutine {
    static func insert(into context: NSManagedObjectContext, new routine: PeleRoutine) -> NSRoutine {
        let newRoutine: NSRoutine = context.insertObject()
        newRoutine.name = routine.name
        newRoutine.orderRank = Int64(routine.orderRank)
        
        return newRoutine
    }
    
    static func delete(from context: NSManagedObjectContext, delete routine: NSRoutine) -> NSRoutine {
        return routine
    }
}
