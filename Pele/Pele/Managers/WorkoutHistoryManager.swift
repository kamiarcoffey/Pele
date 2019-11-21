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

//    func matchWorkout(workout: PeleWorkout) {
//        var workouts = [Workout]()
//
//       //implements let workoutReqest: NSFetchRequest<Workout> = Workout.fetchRequest() using defined protocols
//       let workoutReqest = Workout.sortedFetchRequest
//       workoutReqest.fetchBatchSize = 20
//       workoutReqest.returnsObjectsAsFaults = false // dont want to deal with faulting just now - do later.
//        workoutReqest.predicate = NSPredicate(format: "id == %@", workout.id)
//
//       do {
//           workouts = try self.moc.fetch(workoutReqest)
//       } catch let error as NSError {
//           print(error)
//       }
//
//       return workouts
//    }
    
    func saveWorkout(workout: Session) { // Workout is an NSManagedObject type
        self.moc.performChanges {
            // the workout has all sets filled in already
            _ = Workout.insert(into: self.moc, loggedWorkout: workout) // where loggedWorkout is Activity protocol
        }
    }
}

