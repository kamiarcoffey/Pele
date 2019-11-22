//
//  PageView.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/9/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PlayRoutine : View {
    let limit: Double = 15
    let step: Double = 0.3
    
    var routine: PeleRoutine
    @ObservedObject var playRoutineViewModel: PlayRoutineViewModel
    @State private var isShowingQuitAlert = false
    var pages: [LogExerciseViewModel]
    
    init(routine: PeleRoutine) {
        self.routine = routine
        self.playRoutineViewModel = PlayRoutineViewModel(with: routine)
        self.pages = routine.exerciseList.map { LogExerciseViewModel(exercise: $0) }
    }
    
    
    @State var currentIndex = 0
    @State var nextIndex = 1
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.playRoutineViewModel.saveWorkout()
            }, label: {
                Text("Finish This Workout")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(Color.orange)
                    .font(.system(size: 20))
                .scaledToFill()
                 .shadow(radius: 5)

            })
            ZStack {
                if (pages.count > 0) {
                    LogExercise(logExerciseViewModel: pages[currentIndex], completedExercise: { newExercise in
                        self.playRoutineViewModel.addExercise(new: newExercise)
                        self.refreshAnimatingViews()
                    })
                        .offset(x: -CGFloat(pow(2, self.progress)))
                    
                    if (pages.count > 1) {
                        LogExercise(logExerciseViewModel: pages[nextIndex], completedExercise: { newExercise in
                            self.playRoutineViewModel.addExercise(new: newExercise)
                            self.refreshAnimatingViews()
                        })
                            .offset(x: CGFloat(pow(2, (self.limit - self.progress))))
                    }
                }
            }
        }

    }
    
    func refreshAnimatingViews() {
        if (pages.count > 1) {
            currentIndex = nextIndex
            if nextIndex + 1 < pages.count {
                nextIndex += 1
            } else {
                nextIndex = 0
            }
        }
    }
}



