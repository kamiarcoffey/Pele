//
//  RoutinePost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI


struct RoutineRow: View {
    @State var routine: Routine
    @State var isPresentingEditRoutineModal = false
    
    var body: some View {
        NavigationLink(destination:  PlayRoutine(routine: routine, exerciseList: routine.getExerciseList)) {
            HStack {
                HStack {
                    VStack {
                        Text("\(routine.name)")
                            .fontWeight(.bold)
                        Text("Count: \(routine.exerciseCount)")
                    }
                    
                    List {
                        ForEach(routine.getExerciseList, id: \.self) { thisExercise in
                            ExercisePost(exercise: thisExercise)
                        }
                    }
                }
                .padding()
                VStack {
                    Text("Edit Routine")
                    Image(systemName: "square.and.pencil")
                    .padding()
                }.onTapGesture {
                    self.isPresentingEditRoutineModal.toggle()
                }
                .overlay(Rectangle().stroke(Color.gray, lineWidth:2))
            }
        }
        .sheet(isPresented: $isPresentingEditRoutineModal, content: {
            EditRoutine(routineBeingEdited: self.routine, isPresenting: self.$isPresentingEditRoutineModal)
        })
    }
}



