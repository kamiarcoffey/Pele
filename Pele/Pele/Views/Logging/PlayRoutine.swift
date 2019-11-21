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
    
    @State private var shape = AnyView(Image(systemName: "play").foregroundColor(.blue).frame(width: 60.0, height: 60.0, alignment: .center))
    
    var body: some View {
        VStack {
            Button(action: {
                self.playRoutineViewModel.saveWorkout()
            }, label: {
                Text("Finish This Workout")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(Color.orange)
            })
            ZStack {
                LogExercise(logExerciseViewModel: pages[currentIndex], completedExercise: { newExercise in
                    self.playRoutineViewModel.addExercise(new: newExercise)
                    self.refreshAnimatingViews()
                })
                    .offset(x: -CGFloat(pow(2, self.progress)))
                LogExercise(logExerciseViewModel: pages[nextIndex], completedExercise: { newExercise in
                    self.playRoutineViewModel.addExercise(new: newExercise)
                    self.refreshAnimatingViews()
                })
                    .offset(x: CGFloat(pow(2, (self.limit - self.progress))))
            }.edgesIgnoringSafeArea(.vertical)
        }
    }
    
    func refreshAnimatingViews() {
        currentIndex = nextIndex
        if nextIndex + 1 < pages.count {
            nextIndex += 1
        } else {
            nextIndex = 0
        }
    }
}



