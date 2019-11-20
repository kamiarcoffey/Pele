//
//  ExerciseManager.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

class ExerciseManager {
    
    static let shared = ExerciseManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift

    var moc: NSManagedObjectContext

    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllPeleExercises(activity: Activity) -> [PeleExercise] {
        getAllExercises(activity: activity).map{ PeleExercise(exerciseSet: $0) }
    }

    func getAllExercises(activity: Activity) -> [ExerciseSet] { // Workout is an NSManagedObject type
        var exercises = [ExerciseSet]()
                
        //implements let workoutReqest: NSFetchRequest<Workout> = Workout.fetchRequest() using defined protocols
        let exerciseRequest = ExerciseSet.sortedFetchRequest
        exerciseRequest.fetchBatchSize = 20
        exerciseRequest.returnsObjectsAsFaults = false // dont want to deal with faulting just now - do later.
        
        let name = activity.getName()
        exerciseRequest.predicate = NSPredicate(format: "exerciseName == %@", name)


        do {
            exercises = try self.moc.fetch(exerciseRequest)
        } catch let error as NSError {
            print(error)
        }

        return exercises
    }

    
}


