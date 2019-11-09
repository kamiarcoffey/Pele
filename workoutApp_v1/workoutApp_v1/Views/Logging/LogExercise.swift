//
//  LogExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: find a better way thhan hardcoding 200 for frame min width

// the view for each exercise in a routine. This view will have a variable number of subViews

struct LogExercise: View {
    
    @ObservedObject var logExerciseViewModel: LogExerciseViewModel
    var completedExercise: (PeleExercise) -> ()
    
    var body: some View {
        VStack {
            Text(logExerciseViewModel.displayName())
            ScrollView {
                VStack {
                    ForEach(logExerciseViewModel.setsInProgress, id: \.id) { setInProgress in
                        LogSet(setInProgress: setInProgress, completedSet: { newSet in
                            self.logExerciseViewModel.logSet(finishedSet: newSet)
                        })
                    }
                    Button(action: {
                        self.logExerciseViewModel.generateAdditionalSet()
                    }, label: {
                        Text("Do Another Set")
                            .padding(.all, 16)
                    })
                    Button(action: {
                        let (name, id, targetMuscle) = self.logExerciseViewModel.getExerciseDetails()
                        let sets = self.logExerciseViewModel.completedSets
                        // TODO: should ID be regenerated for a logged exercise vs an exercise from the Routine world? -> decide based on how you want to view history
                        self.completedExercise(PeleExercise(name, id: id, target: targetMuscle, sets: sets))
                    }, label: {
                        HStack {
                            Image(systemName: "forward")
                            Text("Next Exercise")
                                .padding(.all, 16)
                        }
                    })
                }
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    //        .background(Color.gray)
                    .border(Color.gray.opacity(0.5), width: 0.5)
            }
        }
        
    }
}


// for empty callback trigger
/*
 SetLogPost(setInProgress: setInProgress, exerciseInProgress: self.exercise) { self.exercise.generateAdditionalSet()
 }
 */
               
