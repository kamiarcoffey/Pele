//
//  WorkoutRow.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct WorkoutRow: View {
    
    @State var workout: WorkoutViewModel
    
    var body: some View {
        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
            VStack {
                Text(workout.name)
                Text(workout.date)
            }
        }
    }
    
}
