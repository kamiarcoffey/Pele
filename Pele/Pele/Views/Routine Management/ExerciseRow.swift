//
//  ExercisePost.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// used by just routine management

import SwiftUI

struct ExerciseRow: View {
    
    @State var exercise: PeleExercise
    
    var body: some View {
        HStack {
            Text(exercise.getName())
        }
    }
}
