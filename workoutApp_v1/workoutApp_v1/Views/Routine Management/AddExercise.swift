//
//  AddExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct AddExercise: View {
    
    @Binding var isPresenting: Bool
    
    @State private var newExerciseName = ""
    @State private var isWeights = true
    @State private var pickerSelection = 0
    let muscleGroups: [String] = MuscleGroup.allCases.map{ $0.rawValue }

    
    var didAddExercise: (PeleExercise) -> () // (Activity)
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Exercise Name")
                .padding(.all, 16)
                TextField("ex: squats", text: $newExerciseName)
                .padding(.all, 16)
            }
            Toggle(isOn: $isWeights) {
                Text("This Excercise is weights-based?")
                .padding(.all, 16)
            }
            
            Picker(selection: $pickerSelection, label: Text("Muscle Group"))
            {
                Text("Legs").tag(0)
                Text("Back").tag(1)
                // actually gonna require some thought for this https://stackoverflow.com/questions/56645647/how-to-have-a-dynamic-list-of-views-using-swiftui
//                for (idx, muscle) in muscleGroups.enumerated() {
//                    Text(muscle).tag(idx)
//                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 10)
            
            Button(action: {
                self.didAddExercise(PeleExercise(self.newExerciseName))
                self.isPresenting.toggle()
            }, label: {
                Text("Done")
                    .padding(.all, 16)
            })
        }
//        .padding(.all, 16)
    }
}
