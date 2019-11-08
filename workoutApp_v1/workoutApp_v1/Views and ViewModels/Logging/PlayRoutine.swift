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
//        .navigationBarTitle(Text(routine.name), displayMode: .inline).onTapGesture {
//            self.isShowingQuitAlert.toggle()
//        }


struct PlayRoutine: View {
    
    var routine: PeleRoutine
    @State private var isShowingQuitAlert = false
    @ObservedObject var playRoutineViewModel: PlayRoutineViewModel
    
    init(routine: PeleRoutine) {
        self.routine = routine
        self.playRoutineViewModel = PlayRoutineViewModel(with: routine)
    }
    
    
    var body: some View {
        VStack {
            Button(action: {
                print("Logging")
                // playRoutineModel.save
            }, label: {
                Text("Finish This Workout")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(Color(red: 167, green:6, blue:0 ))
            })
            Divider()
            ScrollView(.horizontal, content: {
                HStack{
                    ForEach(playRoutineViewModel.workoutsInProgress, id: \.id) { exerciseViewModel in
                        LogExercise(exerciseViewModel: exerciseViewModel)
                    }
                    .padding(.leading, 10)
                }
            })
        }
    }
}

//            Text("You selected: \(exerciseList[selectedExercise].getName())")

//        VStack {
//            Picker(selection: $selectedExercise, label: Text("")) {
//                ForEach(0 ..< exerciseList.count) {
//                    Text(self.exerciseList[$0].getName())
//                }
//            }
//
//
//            // make the scroll view depend on which Picker item is selected
//
//            ScrollView(.horizontal, content: {
//                HStack(spacing: 10) {
//                    ForEach(playRoutineListViewModel.routineInProgress, id: \.self) { loggedSet in
//                        SetLogPost(setInProgress: loggedSet, generatedSet: { newSet in
//                            self.playRoutineViewModel.logSet(finishedSet: newSet)
//                        })
//                    }
//                }
//                .padding(.leading, 10)
//            })
//                .frame(height: 190)
//        }
//
//    }


//@State var exerciseList: [PeleExercise]
//@State private var selectedExercise = 0
