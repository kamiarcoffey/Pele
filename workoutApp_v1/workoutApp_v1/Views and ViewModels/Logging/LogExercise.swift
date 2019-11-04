//
//  LogExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

// the view for each exercise in a routine. This view will have a variable number of subViews

struct LogExercise: View {
    
    var exercise: PeleExercise
    @ObservedObject var playRoutineViewModel: PlayRoutineViewModel
    
    
    init(exercise: PeleExercise) {
        self.exercise = exercise
        self.playRoutineViewModel = PlayRoutineViewModel(with: exercise)
    }
    
    var body: some View {
        
        VStack {
            ForEach(playRoutineViewModel.setsInProgress, id: \.self) { setInProgress in
                SetLogPost(setInProgress: setInProgress, exerciseInProgress: self.exercise) { self.playRoutineViewModel.generateAdditionalSet()
                }
            }
        }
        .border(Color.gray.opacity(0.5), width: 0.5)
    }
}



// UI formatting for shadows and colors like Rushi Sangani?
// https://medium.com/@rushisangani/swiftui-create-horizontal-list-57305b93f988
