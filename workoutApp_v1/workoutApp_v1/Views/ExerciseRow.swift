//
//  ExercisePost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// used by both routine management and history viewing

import SwiftUI

struct ExerciseRow: View {
    
    @State var exercise: PeleExercise
    
    var body: some View {
        NavigationLink(destination: ExerciseDetailGraphView(exercise: exercise)) {
            HStack {
                Text(exercise.getName())
            }
        }
    }
}
