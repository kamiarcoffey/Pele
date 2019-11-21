//
//  ExerciseManager.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

// adapted support code for formatting dates from NSDate https://stackoverflow.com/questions/35688952/how-fetch-objects-with-nsdate-of-today-using-nspredicate

class DateHelper{
    internal class func startOfDay(day: Date) -> Date {
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let unitFlags: NSCalendar.Unit = [.minute, .hour, .day, .month, .year]
        var todayComponents = gregorian!.components(unitFlags, from: day as Date)
        todayComponents.hour = 0
        todayComponents.minute = 0
        return (gregorian?.date(from: todayComponents))! as Date
    }

    internal class func endOfDay(day: Date) -> Date {
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let unitFlags: NSCalendar.Unit = [.minute, .hour, .day, .month, .year]
        var todayComponents = gregorian!.components(unitFlags, from: day as Date)
        todayComponents.hour = 23
        todayComponents.minute = 59
        return (gregorian?.date(from: todayComponents))! as Date
    }
}

class ExerciseHistoryManager {
    
    static let shared = ExerciseHistoryManager(moc: NSManagedObjectContext.current) // calls to Extensions/NSManagedObjectContextExtension.swift

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

//    func getDateSpecificPeleExercises(activity: Activity, date: Date) -> [PeleExercise] {
//        var exercises = [ExerciseSet]()
//
//        let exerciseRequest = ExerciseSet.sortedFetchRequest
//        exerciseRequest.fetchBatchSize = 20
//        exerciseRequest.returnsObjectsAsFaults = false // dont want to deal with faulting just now - do later.
//
//        exerciseRequest.predicate = NSPredicate(format: "exerciseName == %@", activity.getName())
//
//        exerciseRequest.predicate = NSPredicate(format: "(dateStart => %@) AND (dateStart <= %@)", DateHelper.startOfDay(day: date), DateHelper.endOfDay(day: date))
//
//        do {
//            exercises = try self.moc.fetch(exerciseRequest)
//        } catch let error as NSError {
//            print(error)
//        }
//
//        return exercises.map{ PeleExercise(exerciseSet: $0) }
//    }
    
    // TODO: Make it a parameter
    
//    func getDateSpecificPeleExercises(activity: Activity, sortMethod: .date/.max) -> [PeleExercise] {
//        var exercises = [ExerciseSet]()
//
//        let exerciseRequest = ExerciseSet.sortedFetchRequest
//        exerciseRequest.fetchBatchSize = 20
//        exerciseRequest.returnsObjectsAsFaults = false // dont want to deal with faulting just now - do later.
//
//        exerciseRequest.predicate = NSPredicate(format: "exerciseName == %@", activity.getName())
//
//        exerciseRequest.predicate = NSPredicate(format: "(dateStart => %@) AND (dateStart <= %@)", DateHelper.startOfDay(date), DateHelper.endOfDay(date))
//
//        do {
//            exercises = try self.moc.fetch(exerciseRequest)
//        } catch let error as NSError {
//            print(error)
//        }
//
//        return exercises.map{ PeleExercise(exerciseSet: $0) }
//
//
//    }
//
}


