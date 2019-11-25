//
//  CoreDataManager.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

class WorkoutHistoryManager {
    
    static let shared = WorkoutHistoryManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllPeleWorkouts() -> [Session] {
        getAllWorkouts().map{ $0.convertToLocal() }
    }
    
    func getAllWorkouts() -> [Workout] { // Workout is an NSManagedObject type
        var workouts = [Workout]()
        
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
    
    func deleteWorkoutdeleteWorkout(with id: UUID) {
        
        var workouts = [Workout]()

        let workoutReqest = Workout.sortedFetchRequest
        workoutReqest.fetchBatchSize = 1
        workoutReqest.returnsObjectsAsFaults = false
        workoutReqest.predicate = NSPredicate(format: "%K == %@", "projectId", id as CVarArg)
        
        do {
            workouts = try self.moc.fetch(workoutReqest)
            
        } catch let error as NSError {
            print(error)
        }
        
        self.moc.performChanges {
            _ = Workout.delete(from: self.moc, deleteWorkout: workouts[0])
        }
    }
    
    func saveWorkout(workout: Session) { // Workout is an NSManagedObject type
        self.moc.performChanges {
            // the workout has all sets filled in already
            _ = Workout.insert(into: self.moc, loggedWorkout: workout) // where loggedWorkout is Activity protocol
        }
    }
}

