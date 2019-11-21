//
//  PeleRoutine.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/24/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//
import Foundation

public class PeleRoutine: Identifiable, Codable, Hashable {
    
    public let id: UUID
    var name: String
    var exerciseList: [PeleExercise] // [Activity]
    
    init(with name: String, with exericses: [PeleExercise]) {
        self.name = name
        self.exerciseList = exericses
        self.id = UUID()
    }
    
    public func deleteItem(at indexSet: IndexSet) {
        self.exerciseList.remove(atOffsets: indexSet)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.exerciseList.move(fromOffsets: source, toOffset: destination)
    }
    
    var getExerciseList: [PeleExercise]  { // [Activity]
        return exerciseList
    }
    
    var exerciseCount: String {
        return String(exerciseList.count)
    }
    
    var getName: String {
        return name
    }
    
    func containsExercise(_ checkExercise: PeleExercise) -> Bool {
        return self.exerciseList.contains(checkExercise)
        // guard let concreteType = checkExercise as? PeleExercise else { return false }
        // return self.exerciseList.map{}.contains(concreteType)
    }
    
    func addExercises(_ newExercises: [PeleExercise]) {
        self.exerciseList += newExercises
    }
}

extension PeleRoutine {
    public static func == (lhs: PeleRoutine, rhs: PeleRoutine) -> Bool {
        return (lhs.getName == rhs.getName)
     }
      
     // name is enough to uniquley identify an Exercise
     public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
    }
}
