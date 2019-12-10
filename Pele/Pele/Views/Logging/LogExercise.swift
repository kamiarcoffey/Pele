//
//  LogExercise.swift
//  Pele
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
    var completedExercise: (Exercise) -> ()
    @State private var showingAlert = false
    
    var body: some View {
        
        ZStack {
            
//        Color(#colorLiteral(red: 0.388677597, green: 0.136687398, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 15) {
                Text(logExerciseViewModel.displayName())
                    .fontWeight(.bold)
                    .font(.system(size: 20))
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
                                .font(.system(size: 20))
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(#colorLiteral(red: 0.388677597, green: 0.136687398, blue: 0, alpha: 1)), lineWidth: 0.5))
                            
                        })
                        Button(action: {
                            let (name, id, targetMuscle) = self.logExerciseViewModel.getExerciseDetails()
                            let sets = self.logExerciseViewModel.completedSets
                            // TODO: should ID be regenerated for a logged exercise vs an exercise from the Routine world? -> decide based on how you want to view history
                            self.completedExercise(Exercise(name, id: id, target: targetMuscle, sets: sets))
                        }, label: {
                            HStack {
                                Image(systemName: "forward")
                                Text("Save \(logExerciseViewModel.displayName())")
                                    .font(.system(size: 20))
                            }                                    .padding(.all, 16)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(#colorLiteral(red: 0.388677597, green: 0.136687398, blue: 0, alpha: 1)), lineWidth: 0.5))
                        })
                    }
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(#colorLiteral(red: 0.388677597, green: 0.136687398, blue: 0, alpha: 1)), lineWidth: 1).shadow(radius: 2))
            
            
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Move On?"), message: Text("Make sure you lock-in your sets, otherwise you'll move on without saving"),
                  primaryButton: .cancel({
                    self.showingAlert = false
                  }),
                  secondaryButton: .default(Text("Yes").foregroundColor(.green), action: {
                    let (name, id, targetMuscle) = self.logExerciseViewModel.getExerciseDetails()
                    let sets = self.logExerciseViewModel.completedSets
                    // TODO: should ID be regenerated for a logged exercise vs an exercise from the Routine world? -> decide based on how you want to view history
                    self.completedExercise(Exercise(name, id: id, target: targetMuscle, sets: sets))
                    self.showingAlert = false
                  })
            )
        }
    }
}


