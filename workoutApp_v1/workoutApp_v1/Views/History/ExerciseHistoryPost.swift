//
//  ExerciseHistoryPost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// used by just history viewing

import SwiftUI

struct ExerciseHistoryPost: View {
    
    @State var exercise: PeleExercise
    
    var body: some View {
        NavigationLink(destination: ExerciseDetailGraphView(exercise: exercise)) {
            VStack {
                Text(exercise.getName())
                Text(exercise.targetMuscle.rawValue)
                Text("\(exercise.sets.count) Sets")
            }
        }
    }
}
