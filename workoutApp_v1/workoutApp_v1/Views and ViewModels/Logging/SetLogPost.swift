//
//  SetLogPost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

struct SetLogPost: View {
    
    @State var setInProgress: LogSetViewModel
    @State var exerciseInProgress: PeleExercise
    @ObservedObject var setReps = NumericalFieldViewModel()
    @ObservedObject var setWeight = NumericalFieldViewModel()
    var generateNewSet: () -> Void
    
    
    //    init() {
    //        self.setReps =  NumericalFieldViewModel()
    //        self.setWeight = NumericalFieldViewModel()
    //    }
    
    var body: some View {
        VStack {
            Text("Log Set")
                .padding(10)
            HStack {
                VStack {
                    Text("Reps")
                    TextField("reps", text: $setReps.text)
                }
                VStack {
                    Text("Weight")
                    TextField("weight", text: $setWeight.text)
                }
                .padding(10)
            }
            Button(action: self.generateNewSet) {Text("Do Another Set")}
        }
    }
}





