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
    
    @State var setInProgress: PeleExerciseSet
//    @ObservedObject var setReps = NumericalFieldViewModel()
//    @ObservedObject var setWeight = NumericalFieldViewModel()
    @State private var setReps = ""
    @State private var setWeight = ""
    var completedSet: (PeleExerciseSet) -> ()
    
    // var generateSet: () -> //
    // pipe it all the way back up or save it here?
    // pipe it

    
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
                    TextField("", text: $setReps)
                        .background(Color.gray).opacity(0.5)
                     .foregroundColor(.white)

//                    TextField("reps", text: $setReps.text)
                }
                    .border(Color.gray.opacity(0.5), width: 0.5)

                .padding(10)
                VStack {
                    Text("Weight")
                    TextField("", text: $setWeight)
                        .background(Color(.gray).opacity(0.5))
                    .foregroundColor(.white)


//                    TextField("weight", text: $setWeight.text)
                }
                    .border(Color.gray.opacity(0.5), width: 0.5)

                .padding(10)
            }
            Button(action: {
                let reps = [Rep](repeating: Rep(weightLifted: Int(self.setWeight) ?? 0), count: Int(self.setReps) ?? 0)
                self.completedSet(PeleExerciseSet(reps: reps))
            }, label: {
                Text("Log This Set")
                    .padding(.all, 16)
            })
        }
    }
}





