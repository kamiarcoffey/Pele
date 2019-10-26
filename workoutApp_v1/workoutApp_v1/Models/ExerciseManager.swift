//
//  ExerciseBuilder.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/23/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// TODO: RangeReplaceableCollection
// TODO: code duplucate with WorkoutPlaylist?
// TODO: make this an object pool?
public class ExerciseManager: ObservableObject {
    
    @Published var exercisePool: Set<Exercise>
    
    var getExercisePool: [Exercise] {
        return Array(self.exercisePool)
    }
    
    init() {
        self.exercisePool = UserDefaults.fetchExercisePool()
    }
    
    // MARK: private functions
    private func setPool(_ updatedPool: Set<Exercise>) {
        self.exercisePool = updatedPool
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    private func getAllExerciseNames() -> [String] {
        return exercisePool.map{ $0.getName() }
    }
    
    // MARK: Public API
    // TODO: should the controller be generating new objects, or nah?
    public func addExercise(_ newExercise: Exercise) {
        self.exercisePool.insert(newExercise)
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
//    public func addExerciseRaw(with name: String, is weights: Bool) {
//        let newExercise = Exercise(name, weights: weights)
//        self.exercisePool.insert(newExercise)
//        UserDefaults.setExercisePool(with: self.exercisePool)
//    }
    
    public func removeExercise(_ asObject: Exercise) {
        self.exercisePool.remove(asObject)
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    public func removeExercise(_ named: String) {
        let newPool = self.exercisePool.filter{ $0.getName() != named }
        self.setPool(newPool)
    }

    
    
    
    
    
    
    
}
