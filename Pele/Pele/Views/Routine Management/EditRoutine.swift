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
    @State var exercises = ExercisePoolManager()
    @ObservedObject var playlistManager = PlaylistsManager.shared
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
                    
                    List {
                        ForEach(exercises.getExercisePool.filter({self.routineBeingEdited.containsExercise($0)}), id: \.self) { thisExercise in
                            ExerciseRow(exercise: thisExercise)
                        }
                        .onDelete(perform: exercises.deleteItem)
                        .onMove(perform: exercises.move)
                    }
                    
                    VStack {
                        ForEach(self.exercises.getExercisePool) { thisExercise in
                            BoxView(exercise: thisExercise, isSelected: self.selectedExercises.contains(thisExercise)) {
                                if self.selectedExercises.contains(thisExercise) {
                                    self.selectedExercises.removeAll(where: { $0 == thisExercise })
                                }
                                else {
                                    self.selectedExercises.append(thisExercise)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets.init(top: +10, leading: +10, bottom: +10, trailing: +10))
                    
                }
                .navigationBarTitle(Text(routineBeingEdited.getName))
            
                .navigationBarItems(leading: Button(action: {
                    self.isPresentingAddExercise.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(.all, 6)
                        .background(Color(.darkGray))
                }),
                    trailing:
                    HStack {
                        Button(action: {
                            self.selectedExercises.forEach { (localExerciseVar) in
                                self.playlistManager.addExercise(to: self.routineBeingEdited, localExerciseVar)
                            }
                            self.routineBeingEdited.addExercises(self.selectedExercises)
                            self.isPresenting.toggle()
                        }, label: {
                            Text("Add Selected Exercises")
                                .foregroundColor(.white)
                                .padding(.all, 6)
                                .background(Color(.orange))
                        })
                        Button(action: {
                            self.selectedExercises.forEach { (localExerciseVar) in
                                ExercisePoolManager.shared.deleteExercise(exercise: localExerciseVar)
                                self.isPresenting.toggle()
                            }
                        }, label: {
                            Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.all, 6)
                        })
                })
                .sheet(isPresented: $isPresentingAddExercise, content: {
                    AddExercise(isPresenting: self.$isPresentingAddExercise, didCreateExercise: { exercise in
                        self.exercises.addExercise(exercise: exercise)
                    })
                })
                
            }
        }.font(.system(size: 15))
    }
}




// swipe to remove from that exercise
// trash button to delete from list entirely
