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
    var orderRank: Int
    var name: String
    var exerciseList: [Exercise] // [Activity]
    
    init(with name: String, with exericses: [Exercise]) {
        self.name = name
        self.exerciseList = exericses
        self.id = UUID()
        self.orderRank = 1
    }
    
    public func deleteItem(at indexSet: IndexSet) {
        self.exerciseList.remove(atOffsets: indexSet)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.exerciseList.move(fromOffsets: source, toOffset: destination)
    }
    
    var getExerciseList: [Exercise]  { // [Activity]
        return exerciseList
    }
    
    var exerciseCount: String {
        return String(exerciseList.count)
    }
    
    var getName: String {
        return name
    }
    
    func containsExercise(_ checkExercise: Exercise) -> Bool {
        return self.exerciseList.contains(checkExercise)
        // guard let concreteType = checkExercise as? PeleExercise else { return false }
        // return self.exerciseList.map{}.contains(concreteType)
    }
    
    func addExercises(_ newExercises: [Exercise]) {
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

struct Routine: Identifiable, Codable, Hashable {
    
    public let id = UUID()
    var orderRank: Int
    var name: String
    var exerciseList: [Exercise]
    
    init(from NSRoutine: NSRoutine) {
        self.orderRank = Int(NSRoutine.orderRank)
        self.name = NSRoutine.name!
        self.exerciseList = NSRoutine.exercises?.map{Exercise($0 as! NSExercise)} ?? [Exercise]()
    }
    
    func containsExercise(_ checkExercise: Exercise) -> Bool {
        return self.exerciseList.contains(checkExercise)
        // guard let concreteType = checkExercise as? PeleExercise else { return false }
        // return self.exerciseList.map{}.contains(concreteType)
    }
}
