//
//  SetProtocol.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public protocol SetProtocol: Codable {
    associatedtype typeOfRep: RepProtocol
    var reps: [typeOfRep] { get set }
    mutating func addReps(new reps: [typeOfRep])
    func weightTimesSets() -> Int
    var repCount: Int { get }
}

extension SetProtocol {
    mutating public func addReps(new reps: [typeOfRep]) {
         self.reps += reps
    }
    
    public var repCount: Int {
        return reps.count
    }
    
    public func weightTimesSets() -> Int {
        return reps.reduce(0) { (acc, element) -> Int in
            return acc + element.weight
        }
    }
}
