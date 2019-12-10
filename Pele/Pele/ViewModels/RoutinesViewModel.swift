//
//  PlaylistsManager.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// TODO: Replace PeleExercise with Activity where appropriate

import Foundation
import Combine

public class RoutinesViewModel : ObservableObject {
        
    @Published var playlists = UserDefaults.routinePlaylists() {
        didSet {
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }
 
    public func deleteItem(at indexSet: IndexSet) {
        self.playlists.remove(atOffsets: indexSet)
        UserDefaults.setRoutinePlaylists(with: self.playlists)

    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.playlists.move(fromOffsets: source, toOffset: destination)
        UserDefaults.setRoutinePlaylists(with: self.playlists)

    }
          
    public func addPlaylist(with name: String, having exercises: [Exercise] = [Exercise]()) {
        let newRoutine = PeleRoutine(with: name, with: exercises)
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func editExercises(to routine: PeleRoutine, _ exercises: [Exercise], _ didAdd: Bool) {
        if didAdd {
            self.addExercises(to: routine, exercises)
        } else {
            self.removeExercise(from: routine, exercises[0])
        }
    }
    
    public func addExercises(to routine: PeleRoutine, _ exercises: [Exercise]) {
        exercises.forEach { exercise in
            if let index = self.playlists.firstIndex(of: routine) {
                self.playlists[index].exerciseList.append(exercise)
            }
        }
        print(self.playlists)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func removeExercise(from routine: PeleRoutine, _ exercise: Exercise) {
        if let routineIndex = self.playlists.firstIndex(of: routine) {
            if let exerciseIndex = self.playlists[routineIndex].exerciseList.firstIndex(of: exercise) {
                self.playlists[routineIndex].exerciseList.remove(at: exerciseIndex)
            }
        }
        UserDefaults.setRoutinePlaylists(with: self.playlists)

    }
}

