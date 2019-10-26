//
//  RoutinePost.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI


struct RoutinePost: View {
    @State var routine: Routine
    
    @State var isPresentingEditRoutineModal = false
    
    
    var body: some View {
        HStack {
            Button(action: {
                //
            }, label: {
                Image(systemName: "play")
            })
            Divider()
            Text(routine.name)
                .fontWeight(.bold)
            Text(routine.exerciseCount)
            Spacer()
            
            Button(action: {
                self.isPresentingEditRoutineModal.toggle()
            }, label: {
                Text("Edit")
                    .foregroundColor(.blue)
            })
        }.sheet(isPresented: $isPresentingEditRoutineModal, content: {
            EditRoutine(routineBeingEdited: self.routine, isPresenting: self.$isPresentingEditRoutineModal)
        })
    }
}
