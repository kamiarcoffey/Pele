//
//  Activity.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// Activity is a thing you do - squats, jumping jacks etc..
public protocol Activity : Codable {
    var name: String { get set }
    var isWeights: Bool { get }
    func getName() -> String
    func calculateCalories() -> Double
}

extension Activity {
    func getName() -> String { return name }
}





// TODO: implement switch
/*
return 10

let groupValue = switch MuscleGroup {

case .legs:
    return 10
}
case. booty:
case .back:
case .chest:
case .biceps:
case .triceps:
case .shoudlers:
default:
    return 0

return groupValue*weightTimesSets
 */


