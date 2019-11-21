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
    case legs, back, chest, biceps, triceps, shoudlers, booty
    // TODO: pull exercises will be back and bi
}

