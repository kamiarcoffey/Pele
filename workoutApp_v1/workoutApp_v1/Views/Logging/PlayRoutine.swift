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
                    .background(Color.orange)
            })
            Divider()
            ScrollView(.horizontal, content: {
                HStack{
                    ForEach(playRoutineViewModel.workoutsInProgress, id: \.id) { exerciseViewModel in
                        LogExercise(setViewModel: exerciseViewModel, completedExercise: { newExercise in
                            self.playRoutineViewModel.addExercise(new: newExercise)
                        })
                    }
                    .padding(.leading, 10)
                }
            })
        }
    }
}

