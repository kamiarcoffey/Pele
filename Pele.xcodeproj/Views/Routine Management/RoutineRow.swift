//
//  RoutinePost.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI


struct RoutineRow: View {
    @State var routine: PeleRoutine
    @ObservedObject var routines = PlaylistsManager.shared
    @State var isPresentingEditRoutineModal = false
    
    var body: some View {
        NavigationLink(destination: PlayRoutine(routine: routine)) {
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
                .overlay(Circle().stroke(Color.orange, lineWidth:1).scaledToFill())
                //.foregroundColor(.orange, opacity(0.2))
            }
        }
        .sheet(isPresented: $isPresentingEditRoutineModal, content: {
            EditRoutine(routineBeingEdited: self.routine, isPresenting: self.$isPresentingEditRoutineModal)
        })
    }
}


