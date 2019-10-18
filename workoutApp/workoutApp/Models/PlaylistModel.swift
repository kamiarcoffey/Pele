//
//  PlayListModel.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class WorkoutPlaylist {
    
    public var playList = [String: [String]]()

    
    
}

struct WorkoutPlaylist {

public var playList = [String: [String]]()



public var routinesArray = [Routines]()

init() {
    self.playList = [:]
    self.routinesArray = []
}

lazy mutating func getAllExercices() -> [String] {
    return routinesArray.reduce( [] ){ $0 + $1.exerciseList }
}

mutating func populateWilcard() {
    let name = "All Exercises"
    let newRoutine = getAllExercices()
    self.routinesArray.append(Routines(routineName: name, exerciseList: newRoutine))
    self.playList[name] = newRoutine
}

init(dictionary:[String:[String]]) {
    self.playList = dictionary
    
    for (key, value) in dictionary {
        self.routinesArray.append(Routines(routineName: key, exerciseList: value))
    }
    
}
