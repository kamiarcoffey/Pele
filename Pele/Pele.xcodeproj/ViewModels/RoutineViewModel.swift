//
//  RoutineViewModel.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/6/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// Still askss its manager to make changes to the model
// gets stuff from the model and then formats it for the view
// will this still work with observable playlist? I don't have to write a bunch of get/set/ask code..

class RoutineListViewModel: ObservableObject {
    
    @Published var routines: [RoutineViewModel]
    
    var playlists: [PeleRoutine]
    
    init() {
        self.playlists = UserDefaults.routinePlaylists()
        self.routines = []
    }
    
    private func setPlaylists() {
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    
    // MARK: API
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
    
    // MARK: For The View
    func deleteItem(at indexSet: IndexSet) {
        self.playlists.remove(atOffsets: indexSet)
        self.setPlaylists()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.playlists.move(fromOffsets: source, toOffset: destination)
        self.setPlaylists()
    }
    
    // MARK: Private
    public func getAllExercises() -> [PeleExercise] {
        return playlists.flatMap{ $0.getExerciseList }
    }

    // MARK: private functions
    private func getAllExerciseNames() -> [String] {
        return self.getAllExercises().map{ $0.getName() }
    }
}

class RoutineViewModel: Hashable {
    
    public let id: UUID
    var name: String
    var exerciseList: [PeleExercise] // [Activity]
    
    let formatter = DateFormatter()
    
    // MARK: if you change workoutReqest.returnsObjectsAsFaults = false, make sure you convert the NSObject before piping it to the View
    init(routine: PeleRoutine) {
        self.id = routine.id
        self.name = routine.name
        self.exerciseList = routine.exerciseList
    }
    
}

extension RoutineViewModel {
    
    static func == (lhs: RoutineViewModel, rhs: RoutineViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
