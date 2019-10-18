//
//  Activity.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

protocol Activity {
    
    var name: String { get set }
    var weights: Bool { get set }
    
    func getName() -> String
}




