//
//  PeleExerciseManager.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public class ExercisePoolManager: ObservableObject {
    
    @Published var exercisePool: [Exercise]
    
    static let shared = ExercisePoolManager()
    
   public func deleteItem(at indexSet: IndexSet) {
       self.exercisePool.remove(atOffsets: indexSet)
       self.setExercisePool()
   }
   
   func move(from source: IndexSet, to destination: Int) {
       self.exercisePool.move(fromOffsets: source, toOffset: destination)
       self.setExercisePool()
   }
        
    init() {
        self.exercisePool = UserDefaults.fetchExercisePool()
    }
    
    // MARK: private functions
    private func setExercisePool() {
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    private func setPool(_ updatedPool: [Exercise]) {
        self.exercisePool = updatedPool
        UserDefaults.setExercisePool(with: self.exercisePool)
    }
    
    private func getAllExerciseNames() -> [String] {
        return exercisePool.map{ $0.getName() }
    }
    
    
    // MARK: public functions
    public func addExercise(exercise: Exercise) {
        self.exercisePool.append(exercise)
        UserDefaults.setExercisePool(with: self.exercisePool)

    }
    
    func deleteExercise(exercise: Exercise) {
        if let index = exercisePool.firstIndex(of: exercise) {
            exercisePool.remove(at: index)
            self.setExercisePool()
        }
    }
 
    func deleteExercises(exercises: [Exercise]) {
        exercises.forEach { (exercise) in
            if let index = self.exercisePool.firstIndex(of: exercise) {
                self.exercisePool.remove(at: index)
            }
        }
        self.setExercisePool()
    }
    
    var getExercisePool: [Exercise] {
        return Array(self.exercisePool)
    }
    
}
