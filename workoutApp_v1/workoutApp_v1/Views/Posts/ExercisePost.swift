//
//  ExercisePost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct ExercisePost: View {
    
    @State var exercise: Exercise
    
    var body: some View {
        HStack {
            Text(exercise.getName())
        }
    }
}
