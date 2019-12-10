//
//  NSExercise.swift
//  Pele
//
//  Created by Kamiar Coffey on 12/10/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
//

import Foundation
import CoreData

final class NSExercise: NSManagedObject {}


extension NSExercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSExercise> {
        return NSFetchRequest<NSExercise>(entityName: "NSExercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var muscleGroup: String?
    @NSManaged public var isWeights: Bool
    @NSManaged public var parentRoutine: NSRoutine?

}

extension NSExercise: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath (name), ascending: false)]
    }
}

extension NSExercise {
    static func insert(into context: NSManagedObjectContext, newExercise: Exercise, parent routine: PeleRoutine? = nil) -> NSExercise {
        let exercise: NSExercise = context.insertObject()
        exercise.name = newExercise.name
        exercise.muscleGroup = newExercise.targetMuscle.rawValue
        exercise.isWeights = newExercise.isWeights
        
        if (routine != nil) {
            // fetch the proper NSRoutine entity, and set it
            let routineRequest = NSRoutine.sortedFetchRequest
            routineRequest.fetchBatchSize = 1
            routineRequest.returnsObjectsAsFaults = false
            routineRequest.predicate = NSPredicate(format: "name == %@", routine!.name)
            do {
                
                let fetchedRoutines = try context.fetch(routineRequest)
                if let parentRoutine = fetchedRoutines.first {
                    exercise.parentRoutine = parentRoutine
                }
            }
            catch {
                print ("Could not assign this exercise a parent", error)
            }
        } else { print("exercise saved without a parent")}
        print("saved\n", exercise)
        return exercise
    }
    
    static func delete(from context: NSManagedObjectContext, delete exercise: NSExercise) -> NSExercise {
        return exercise
    }
}
