//
//  RepProtocol.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


// Currently overkill to have this as a protocol, but I have implemented it this way so that cardio exercises can still have intervals as reps
public protocol RepProtocol: Codable {
    var weight: Int { get }
}
