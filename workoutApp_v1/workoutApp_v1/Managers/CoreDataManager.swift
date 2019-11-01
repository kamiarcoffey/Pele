//
//  CoreDataManager.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllWorkouts() -> [Workout] { // Workout is an NSManagedObject type
        var workouts = [Workout]()
        let workoutReqest: NSFetchRequest<Workout> = Workout.fetchRequest()
        
        do {
            workouts = try self.moc.fetch(workoutReqest)
        } catch let error as NSError {
            print(error)
        }
        
        return workouts
    }
    
    func saveExercise(exercise: Exercise) { // Workout is an NSManagedObject type. Exercise is local
        
        let workoutEntity = NSEntityDescription.entity(forEntityName: "Workout", in: self.moc)!
        let workout = NSManagedObject(entity: workoutEntity, insertInto: self.moc)
        
        workout.setValue(exercise.getName(), forKey: "name")
        workout.setValue(NSDate(), forKey: "date")

        do {
            try self.moc.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return
        }
    }
    
    
    func saveExerciseAsTransformable() {
       
    }
    
    func fetchExercuseFromTransformable() {
        
    }
        

    
}

