//
//  EditRoutine.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//


// #a70600

import SwiftUI

struct EditRoutine: View {
    @State var routineBeingEdited: PeleRoutine
    @State var isPresentingAddExercise = false
    @Binding var isPresenting: Bool
    @State var exerciseManager = ExercisePoolManager()
    @ObservedObject var playlists = PlaylistsManager.shared
    @State var selectedExercises: [PeleExercise] = []
    
    mutating func addToSelected(new exercise: PeleExercise) {
        self.selectedExercises.append(exercise)
    }

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text(routineBeingEdited.name)
                    Divider()
                    
                    VStack {
                        ForEach(self.exerciseManager.getExercisePool) { thisExercise in
                            BoxView(exercise: thisExercise, isSelected: self.selectedExercises.contains(thisExercise)) {
                                if self.selectedExercises.contains(thisExercise) {
                                    self.selectedExercises.removeAll(where: { $0 == thisExercise })
                                    self.playlists.removeExercise(from: self.routineBeingEdited.getName, having: thisExercise.getName())
                                }
                                else {
                                    self.selectedExercises.append(thisExercise)
                                    self.playlists.addExercise(from: self.routineBeingEdited.getName, having: thisExercise)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets.init(top: +10, leading: +10, bottom: +10, trailing: +10))
                    
                }
                .navigationBarTitle(Text(routineBeingEdited.name))
                .navigationBarItems(leading: Button(action: {
                    self.isPresentingAddExercise.toggle()
                }, label: {
                    Text("Create New Exercise")
                        .foregroundColor(.orange)
                    }),
                        trailing: Button(action: {
                            self.exerciseManager.deleteExercises(exercises: self.selectedExercises)
                            self.isPresenting.toggle()
                        }, label: {
                            Image(systemName: "trash")
                        }))
                    .sheet(isPresented: $isPresentingAddExercise, content: {
                        AddExercise(isPresenting: self.$isPresentingAddExercise, didCreateExercise: { exercise in
                            self.exerciseManager.addExercise(exercise: exercise)
                        })
                    })
                
            }
        }.font(.system(size: 15))
    }
}
