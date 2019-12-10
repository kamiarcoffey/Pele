//
//  Session.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// weightsWorkouts and CardioWorkouts both implement Session
public protocol Session : Codable {
    
//    associatedtype T: PeleExercise
    var name: String { get set }
    var date: Date { get set }
    var exercises: [Exercise] { get set } // [PeleExercise]
    func getName() -> String
}

extension Session {
    func getName() -> String {
        return name
    }
}

//extension Session {
//
//    public static func == (lhs: Session, rhs: Session) -> Bool {
//       return (lhs.name == rhs.name)
//    }
//
//    // id is enough to uniquley identify an Exercise
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//   }
//}
