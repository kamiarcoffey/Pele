//
//  PlayRoutineViewModel.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PlayRoutineViewModel: ObservableObject {
    @Published var workoutsInProgress: [SetViewModel]
    private var routine: PeleRoutine
    
    // this will be pre-generated depending on the exercises in the workout selected to play
    
    init(with routine: PeleRoutine) {
        self.routine = routine
        workoutsInProgress = []
        for exercise in routine.exerciseList {
            workoutsInProgress.append(SetViewModel())
        }
    }
}
