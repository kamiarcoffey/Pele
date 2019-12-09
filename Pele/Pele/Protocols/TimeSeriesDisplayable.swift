//
//  TimeSeriesDisplayable.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/24/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

public enum displayType {
   case reps
   case weight
   case calories
   case weightTimesReps
}

public protocol TimeSeriesDisplayable {
//    func displayableTimeSeries(displaying: displayType) throws -> [(Double, Date)]
    func displayableTimeSeries(displaying: displayType) -> [(Double, String)]
}
