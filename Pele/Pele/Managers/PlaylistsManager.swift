//
//  PlaylistsViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 12/10/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This class is a Manager
//  It interacts with CoreData and functions as a source for the ViewModel
//
//===----------------------------------------------------------------------===//

import Foundation
import CoreData

class PlaylistsManager {
    
    static let shared = PlaylistsManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift
    
    var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllRoutines() -> [Routine] { // Workout is an NSManagedObject type
        var routines = [NSRoutine]()
        let routinesRequest = NSRoutine.sortedFetchRequest
        routinesRequest.returnsObjectsAsFaults = false
        
        do {
            routines = try self.moc.fetch(routinesRequest)
        } catch let error as NSError {
            print(error)
        }
        return routines.map{ Routine(from: $0) }
    }
}



//===----------------------------------------------------------------------===//
//
//
//
//===----------------------------------------------------------------------===//

class RoutineManager: ObservableObject {
    static let shared = RoutineManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift
    
    var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllExercises() -> [Exercise] { // Workout is an NSManagedObject type
        var exercises = [NSExercise]()
        let exercisesRequest = NSExercise.sortedFetchRequest
        exercisesRequest.returnsObjectsAsFaults = false
        
        do {
            exercises = try self.moc.fetch(exercisesRequest)
        } catch let error as NSError {
            print(error)
        }
        return exercises.map{ Exercise(from: $0) }
    }
}

protocol Manager {
    associatedtype T
    
    func getAll() -> T
}


