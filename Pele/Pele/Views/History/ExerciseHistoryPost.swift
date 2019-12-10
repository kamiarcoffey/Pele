//
//  ExerciseHistoryPost.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// used by just history viewing

import SwiftUI

struct ExerciseHistoryPost: View {
    
    @State var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: ExerciseDetailGraphView(exercise: exercise)) {
            VStack {
                Text(exercise.getName()).fontWeight(.semibold)
                Text("\tTarget Muscle Group: \(exercise.targetMuscle.rawValue)")
                ForEach (exercise.sets, id: \.self) { set in
                    HStack {
                        Text("Reps: \(String(set.reps.count))\t")
                        Text("Weight: \(String(set.repWeight))")
                    }
                }
            }
        }
    }
}
