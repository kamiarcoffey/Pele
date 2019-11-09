//
//  CoreDataManager.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

class WorkoutManager {
    
    static let shared = WorkoutManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift

    var moc: NSManagedObjectContext

    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllPeleWorkouts() -> [Session] {
        getAllWorkouts().map{ $0.convertToLocal() }
    }

    func getAllWorkouts() -> [Workout] { // Workout is an NSManagedObject type
        var workouts = [Workout]()
        
        Workout.insert(into: self.moc, loggedWorkout: PeleWorkout(name: "test"))
        
        //implements let workoutReqest: NSFetchRequest<Workout> = Workout.fetchRequest() using defined protocols
        let workoutReqest = Workout.sortedFetchRequest
        workoutReqest.fetchBatchSize = 20
        workoutReqest.returnsObjectsAsFaults = false // dont want to deal with faulting just now - do later.
        

        do {
            workouts = try self.moc.fetch(workoutReqest)
        } catch let error as NSError {
            print(error)
        }

        return workouts
    }

    func saveWorkout(workout: Session) { // Workout is an NSManagedObject type
        self.moc.performChanges {
            _ = Workout.insert(into: self.moc, loggedWorkout: workout) // where loggedWorkout is Activity protocol
        }
    }
    
    
    
    

        

    
}

