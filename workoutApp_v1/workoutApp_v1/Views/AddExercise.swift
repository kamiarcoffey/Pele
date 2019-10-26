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
    
    var didAddExercise: (Exercise) -> ()
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Exercise Name")
                TextField("ex: squats", text: $newExerciseName)
            }
            Spacer()
            Toggle(isOn: $isWeights) {
                Text("This Excercise is weights-based?")
            }
            Spacer()
            Button(action: {
                self.didAddExercise(.init(self.newExerciseName, self.isWeights))
                self.isPresenting.toggle()
            }, label: {
                Text("Done")
                    .padding(.all, 16)
            })
            Spacer()
        }
//        .padding(.all, 16)
    }
}
