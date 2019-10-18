//
//  PlayListModel.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class WorkoutPlaylist {
    
    private var playList: [String: [Exercise]]
    
    init(with startingPlaylist: [String: [Exercise]]) {
        self.playList = startingPlaylist
    }
    
    private func getAllExercices() -> [Exercise] {
        return playList.values.flatMap{ $0.map{$0}}
    }
    
    private func getAllExerciceNames() -> [String] {
        return playList.values.flatMap{ $0.map{$0.getName()}}
    }

    private func populateWilcard() {
        let name = "All Exercises"
        let routines = getAllExercices()
        self.playList[name] = routines
    }
    
    // allows for passing in just the name
    func addPlaylist(with name: String, having routine: [Exercise] = [Exercise]()) {
        self.playList[name] = routine
    }
    
    
    func getPlaylist() -> [String: [Exercise]] {
        populateWilcard()
        return self.playList
    }
    
    func getPlaylistNames() -> [String] {
        populateWilcard()
        return playList.keys.sorted(by: <)
    }
    
}
