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
        List {
        
            Text(workout.name)
        }
        .navigationBarItems(trailing: Button(action: {
            print("deleting workout")
            //
        }, label: {
            Image(systemName: "trash")
        }))
    }
    
}

