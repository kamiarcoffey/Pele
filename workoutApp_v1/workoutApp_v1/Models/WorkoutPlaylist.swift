//
//  WorkoutPlaylist.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation



// maybe WorkoutplayLists implement Collection
// not a dictionary because I want to preserver ordering
// alternative is to add some additional component to sort the dictionary according to the way users arrange it - yuck

public class WorkoutPlaylist {
    
    private var playlists: [Routine]
    
    init() {
        self.playlists = UserDefaults.routinePlaylists()
    }

    private func setPlaylists(_ updatedList: [Routine]) {
        self.playlists = updatedList
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
        

    // MARK: private functions
    private func getAllExercises() -> [Exercise] {
        return playlists.flatMap{ $0.getExerciseList }
    }

    private func getAllExerciseNames() -> [String] {
        return playlists.map{ $0.getName }
    }
    
    // MARK: public API
    // addPlaylists allows for passing in just the name
    public func addPlaylists(with name: String, having exercises: [Exercise] = [Exercise]()) {
        let newRoutine = Routine(name: name, exerciseList: exercises)
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func addExercise(from routineNamed: String, having exercise: Exercise) {
        if let index = self.getAllExerciseNames().firstIndex(of: routineNamed) {
            self.playlists[index].exerciseList.append(exercise)
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }
    
    public func removeRoutine(with routineName: String) {
        let updatedPlaylists = self.playlists.filter { $0.getName != routineName }
        self.setPlaylists(updatedPlaylists)
    }
    
    public func removeExercise(from routineNamed: String, having exerciseName: String) {
        if let index = self.getAllExerciseNames().firstIndex(of: routineNamed) {
            var updateRoutine = self.playlists.remove(at: index)
            let updatedExercises = updateRoutine.exerciseList.filter{ $0.name != exerciseName}
            updateRoutine.exerciseList = updatedExercises
            
            self.playlists.insert(updateRoutine, at: index)
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }
    
    
    // MARK: for the view/controller
    func getPlaylists() -> [Routine] {
        let newRoutine = Routine(name: "All Exercises", exerciseList: self.getAllExercises())
        return self.playlists + [newRoutine]

    }
    
    func getDisplayView() -> [Routine] {
        return self.playlists
        /* Array(self.playlists.map{ RoutineView(name: $0.name, num_exercises: String($0.num_exercises)) }) */
    }
    
    func getPlayListsNames() -> [String] {
        return playlists.map{ $0.getName }
    }
    
}
