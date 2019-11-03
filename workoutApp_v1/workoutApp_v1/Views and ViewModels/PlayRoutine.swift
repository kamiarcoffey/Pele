//
//  PlayRoutine.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

// TODO: Fix the alert button


struct PlayRoutine: View {
    
    @ObservedObject var setReps = NumericalFieldViewModel()
    @ObservedObject var setWeight = NumericalFieldViewModel()

    
    @State private var isShowingQuitAlert = false
    
    @State var routine: PeleRoutine
    @State var exerciseList: [PeleExercise]
    @State private var selectedExercise = 0
    
    @State private var reps: Int = 0
    @State private var weight: Int = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedExercise, label: Text("")) {
                ForEach(0 ..< exerciseList.count) {
                    Text(self.exerciseList[$0].getName())
                }
            }
            
            ScrollView {
                HStack{
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
                        Button(action: {
                            print(self.setReps.text)
                            print(self.setWeight.text)
                        }, label: {
                            Text("Add")
                        })
                    }
                    
                    Divider()

                    
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
                        Button(action: {
                            print(self.setReps.text)
                            print(self.setWeight.text)
                        }, label: {
                            Text("Add")
                        })
                    }
                    
                }
            .padding()
            }
            
        }
        .navigationBarTitle(Text(routine.name), displayMode: .inline).onTapGesture {
            self.isShowingQuitAlert.toggle()
        }
    }
}

//            Text("You selected: \(exerciseList[selectedExercise].getName())")
