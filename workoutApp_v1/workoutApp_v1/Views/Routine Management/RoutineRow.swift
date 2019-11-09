//
//  RoutinePost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI


struct RoutineRow: View {
    @State var routine: PeleRoutine
    @State var isPresentingEditRoutineModal = false
    
    var body: some View {
        NavigationLink(destination:  PagesView(routine: routine)) {
            HStack {
                HStack {
                    VStack {
                        Text("\(routine.name)")
                            .fontWeight(.bold)
                        Text("Count: \(routine.exerciseCount)")
                    }
                    
                }
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "square.and.pencil")
                    Text("Edit")
                    .padding()
                }.onTapGesture {
                    self.isPresentingEditRoutineModal.toggle()
                }
                .overlay(Rectangle().stroke(Color.black, lineWidth:1).scaledToFill())
            }
        }
        .sheet(isPresented: $isPresentingEditRoutineModal, content: {
            EditRoutine(routineBeingEdited: self.routine, isPresenting: self.$isPresentingEditRoutineModal)
        })
    }
}


// Depricated

/*
 List {
    ForEach(routine.getExerciseList, id: \.self) { thisExercise in
        ExerciseRow(exercise: thisExercise)
    }
}
 */
