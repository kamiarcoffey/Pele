//
//  WorkoutDetailView.swift
//  Pele
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
                ForEach(workout.exercises.filterUniques(), id: \.self) { thisExercise in
                    ExerciseHistoryPost(exercise: thisExercise)
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            ///
        }, label: {
            Image(systemName: "trash")
        }))
    }
}
