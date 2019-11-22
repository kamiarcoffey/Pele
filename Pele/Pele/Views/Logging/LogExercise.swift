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
    var completedExercise: (PeleExercise) -> ()
    @State private var showingAlert = false

    var body: some View {
        
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
                        .scaledToFill()

                    })
                    Button(action: {
                        self.showingAlert.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "forward")
                            Text("Next Exercise")
                                .padding(.all, 16)
                                .font(.system(size: 20))
                            .scaledToFill()

                        }
                    })
                }
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .border(Color.orange, width: 0.5)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Move On?"), message: Text("Make sure you lock-in your sets, otherwise you'll move on without saving"),
                  primaryButton: .cancel({
                    self.showingAlert.toggle()
                  }),
                  secondaryButton: .default(Text("Yes").foregroundColor(.green), action: {
                    let (name, id, targetMuscle) = self.logExerciseViewModel.getExerciseDetails()
                    let sets = self.logExerciseViewModel.completedSets
                    // TODO: should ID be regenerated for a logged exercise vs an exercise from the Routine world? -> decide based on how you want to view history
                    self.completedExercise(PeleExercise(name, id: id, target: targetMuscle, sets: sets))
                    self.showingAlert.toggle()
                  })
            )
        }
    }
}


