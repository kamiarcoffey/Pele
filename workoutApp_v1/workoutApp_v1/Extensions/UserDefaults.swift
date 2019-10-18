//
//  UserDefaults.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class UserDefaultsSingleton {


}

/*
struct Defaults {
    
    static let fullPlaylistDictionaryKey = "userDefaults.workoutPlaylists"
    static let exercisePool = "userDefaults.exercisesList"
    
    func add(new WorkoutRoutine: String) {
        if var workoutPlaylist = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as? [String: [String]] {
            //workoutPlaylist.update(routine: WorkoutRoutine, with: [])
            workoutPlaylist[WorkoutRoutine] = []
            UserDefaults.standard.set(workoutPlaylist, forKey: Defaults.fullPlaylistDictionaryKey)
        } else {
            var workoutPlaylist = [String: [String]]()
            workoutPlaylist[WorkoutRoutine] = []
            UserDefaults.standard.set(workoutPlaylist, forKey: Defaults.fullPlaylistDictionaryKey)
        }
    }
    
    func add(_ newExerciseList: [String], to routineName: String){
        // User Defaults not mutable, create local var for mutableCopy()
        var workoutPlaylist = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as! [String: [String]]
        var excerciseList = workoutPlaylist[routineName]
        excerciseList! += newExerciseList
        workoutPlaylist[routineName] = excerciseList
        UserDefaults.standard.set(workoutPlaylist, forKey: Defaults.fullPlaylistDictionaryKey)
        excerciseList?.forEach { self.add(exercise: $0)}
    }
    
    func deleteRoutine(routineName:String) {
        var workoutPlaylist = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as! [String: [String]]
        workoutPlaylist.removeValue(forKey: routineName)
        UserDefaults.standard.set(workoutPlaylist, forKey: Defaults.fullPlaylistDictionaryKey)
    }
        
    func remove(fromWorkout parentWorkout: String, this exercise: String) {
        var workoutPlaylist = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as! [String: [String]]
        var exerciseList = workoutPlaylist[parentWorkout]
        exerciseList = exerciseList!.filter{ $0 != exercise }
        workoutPlaylist[parentWorkout] = exerciseList
        UserDefaults.standard.set(workoutPlaylist, forKey: Defaults.fullPlaylistDictionaryKey)
    }
    
    func getWorkoutPlaylists() -> [String:[String]] {
        return UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as? [String: [String]] ?? [:]
    }
    
    
    func getExercises(for playlist: String) -> [String] {
        let playlists = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as? [String: [String]] ?? [:]
        return playlists[playlist] ?? ["No Exercises Listed Under This Playlist"]
    }
    
    func getAllUniqueExercises() -> [String] {
        let playlists = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as? [String: [String]] ?? [:]
        let excerciseList = UserDefaults.standard.value(forKey: Defaults.exercisePool) as? [String] ?? ["Always Add Squats"]
        return Array(Set(playlists.values.flatMap{$0}).union(Set(excerciseList))) // make sure nothing is left out
    }
    
    // MARK: - exercise Pool
    func add(exercise name: String) {
        var excerciseList = UserDefaults.standard.value(forKey: Defaults.exercisePool) as? [String] ?? []
        excerciseList.append(name)
        UserDefaults.standard.set(excerciseList, forKey: Defaults.exercisePool)
    }
    
    func deleteExercise(exerciseName:String) {
        var exercises = UserDefaults.standard.value(forKey: Defaults.exercisePool) as? [String] ?? []
        exercises = exercises.filter { $0 != exerciseName }
        UserDefaults.standard.set(exercises, forKey: Defaults.exercisePool)
        // also delete from any playlists it is found in!
        let workoutPlaylist = UserDefaults.standard.dictionary(forKey: Defaults.fullPlaylistDictionaryKey) as! [String: [String]]
        workoutPlaylist.keys.forEach{self.remove(fromWorkout: $0, this: exerciseName)}
    }

    func __clearAllData(){
        UserDefaults.standard.removeObject(forKey: Defaults.fullPlaylistDictionaryKey)
    }
    
    
}
 
 */
