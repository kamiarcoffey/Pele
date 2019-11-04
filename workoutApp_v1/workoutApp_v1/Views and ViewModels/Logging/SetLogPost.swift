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
        ScrollView {
            HStack {
                VStack {
                    Text("Set 1")
                    VStack {
                        VStack {
                            VStack {
                                Text("Reps")
                                TextField("reps", text: $setReps.text)
                            }
                            VStack {
                                Text("Weight")
                                TextField("weight", text: $setWeight.text)
                            }
                        }
                    }
                }
                Button(action: {
                    print("added!")
                }, label: {
                    Text("Add")
                })
            }
            Button(action: self.generateNewSet) {Text("hold")}
        }
    }
}





