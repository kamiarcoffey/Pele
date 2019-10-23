//
//  playListModel.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

struct Routine: Codable {
    var name: String
    var exerciseList: [Exercise]
    
    var getExerciseList: [Exercise] {
        return exerciseList
    }
    
    var getName: String {
        return name
    }
}

// maybe WorkoutplayLists implement Collection
// not a dictionary because I want to preserver ordering
// alternative is to add some additional component to sort the dictionary according to the way users arrange it - yuck

class WorkoutplayList {
    
    private var playLists: [Routine]
    
    init(with startingPlayLists: [Routine]) {
        self.playLists = startingPlayLists
    }
        
    
    private func getAllExercises() -> [Exercise] {
        return playLists.flatMap{ $0.getExerciseList }
    }

    private func getAllExerciseNames() -> [String] {
        return playLists.map{ $0.getName }
    }

    private func populateWilcard() {
        let newRoutine = Routine(name: "All Exercises", exerciseList: getAllExercises())
        self.playLists.append(newRoutine)
    }
    
    // allows for passing in just the name
    func addplayLists(with name: String, having exercises: [Exercise] = [Exercise]()) {
        let newRoutine = Routine(name: name, exerciseList: exercises)
        playLists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playLists)
    }
    
    func getplayLists() -> [Routine] {
        populateWilcard()
        return self.playLists
    }
    
    func getplayListsNames() -> [String] {
        populateWilcard()
        return playLists.map{ $0.getName }
    }
    
}
