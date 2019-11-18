//
//  WorkoutDetailView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct WorkoutDetailView: View {
    
    @State var workout: WorkoutViewModel
    
    var body: some View {
        VStack {
            Text(workout.name)
            List {
                ForEach(workout.exercises, id: \.self) { thisExercise in
                    ExerciseRow(exercise: thisExercise)
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            print("deleting workout")
            // TODO: let the VC do the hard work
        }, label: {
            Image(systemName: "trash")
        }))
    }
}
