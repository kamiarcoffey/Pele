//
//  MuscleGroups.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


// weights based activities have a MuscleGroup
public enum MuscleGroup: String, Codable, CaseIterable {
    
    public typealias RawValue = String
    
    case legs, back, chest, biceps, triceps, shoudlers, booty, unknown
    
    static func get(from: String) -> MuscleGroup {
        switch from {
        case "legs":
            return MuscleGroup.legs
        case "back":
            return MuscleGroup.back
        case "chest":
            return MuscleGroup.chest
        case "biceps":
            return MuscleGroup.biceps
        case "triceps":
            return MuscleGroup.triceps
        case "shoulders":
            return MuscleGroup.shoudlers
        case "booty":
            return MuscleGroup.booty
        default:
            return MuscleGroup.unknown
        }
    }
}

