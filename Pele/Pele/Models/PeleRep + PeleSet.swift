//
//  PeleRep + PeleSet.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/24/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public struct Rep: RepProtocol, Codable {
    var weightLifted: Int
    public var weight: Int { return weightLifted }
}

public struct PeleExerciseSet: SetProtocol, Hashable {
    public typealias typeOfRep = Rep
    public var reps: [Rep]
    public var id = UUID()
    
    init() {
        self.reps = []
    }
    
    init(reps: [Rep]) {
        self.reps = reps
    }
    
    var repWeight: Int {
        return self.reps.compactMap{ $0.weight }.max() ?? 0
    }
}

extension PeleExerciseSet {
    
    public static func == (lhs: PeleExerciseSet, rhs: PeleExerciseSet) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    // id is enough to uniquley identify an Exercise
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
