//
//  PeleExerciseManager.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public class ExerciseManager: ObservableObject {
    
    @Published var exercisePool: [PeleExercise]
    
    init() {
        self.exercisePool = UserDefaults.fetchExercisePool()
    }
    
    // MARK: private functions
    private func setExercisePool() {
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    private func setPool(_ updatedPool: [PeleExercise]) {
        self.exercisePool = updatedPool
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    private func getAllExerciseNames() -> [String] {
        return exercisePool.map{ $0.getName() }
    }
    
    
    // MARK: public functions
    public func addExercise(exercise: PeleExercise) {
        self.exercisePool.append(exercise)
        self.setExercisePool()
    }
    
    
    public func deleteItem(at indexSet: IndexSet) {
        self.exercisePool.remove(atOffsets: indexSet)
        self.setExercisePool()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.exercisePool.move(fromOffsets: source, toOffset: destination)
        self.setExercisePool()
    }
    
    var getExercisePool: [PeleExercise] {
        return Array(self.exercisePool)
    }
    
}
