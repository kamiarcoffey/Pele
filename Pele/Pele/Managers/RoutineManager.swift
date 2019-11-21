//
//  RoutineManager.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// TODO: Replace PeleExercise with Activity where appropriate

import Foundation

public class RoutineManager : ObservableObject {
    
    @Published var playlists: [PeleRoutine]
    
    public func deleteItem(at indexSet: IndexSet) {
        self.playlists.remove(atOffsets: indexSet)
        self.setPlaylists()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.playlists.move(fromOffsets: source, toOffset: destination)
        self.setPlaylists()
    }
        
    init() {
        self.playlists = UserDefaults.routinePlaylists()
    }

    private func setPlaylists() {
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
        
    // MARK: For the ViewModel
    public func getAllExercises() -> [PeleExercise] {
        return playlists.flatMap{ $0.getExerciseList }
    }

    // MARK: private functions
    private func getAllExerciseNames() -> [String] {
        return self.getAllExercises().map{ $0.getName() }
    }
    
    // MARK: public API
    // addPlaylists allows for passing in just the name
    public func addPlaylists(with name: String, having exercises: [PeleExercise] = [PeleExercise]()) {
        let newRoutine = PeleRoutine(with: name, with: exercises)
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func addRoutine(_ newRoutine: PeleRoutine) {
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func addExercise(from routineNamed: String, having exercise: PeleExercise) {
        if let index = self.getAllExerciseNames().firstIndex(of: routineNamed) {
            self.playlists[index].exerciseList.append(exercise)
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }
    
    /*
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
    */
    
    
    // MARK: for the view/controller -- NOT needed with Observable?
    func getPlaylists() -> [PeleRoutine] {
        let newRoutine = PeleRoutine(with: "All Exercises", with: self.getAllExercises())
        return self.playlists + [newRoutine]

    }
    
    func getDisplayView() -> [PeleRoutine] {
        return self.playlists
        /* Array(self.playlists.map{ RoutineView(name: $0.name, num_exercises: String($0.num_exercises)) }) */
    }
    
    func getPlayListsNames() -> [String] {
        return playlists.map{ $0.getName }
    }
    
}
