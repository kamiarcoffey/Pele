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
    @ObservedObject var routinesViewModel = RoutinesViewModel()
    @State var routineBeingEdited: PeleRoutine
    @State var exercises = ExercisePoolManager()
    @State var isPresentingAddExercise = false
    @Binding var isPresenting: Bool
  
    @State var selectedExercises: [PeleExercise] = []
    
    var didEditExercises: ([PeleExercise], Bool) -> ()
    
    mutating func addToSelected(new exercise: PeleExercise) {
        self.selectedExercises.append(exercise)
    }
    
    // TODO: Delete 
    func delete(at offsets: IndexSet) {
        if let idx = routinesViewModel.playlists.firstIndex(of: routineBeingEdited) {
            routinesViewModel.playlists[idx].exerciseList.remove(atOffsets: offsets)
            print(routinesViewModel.playlists[idx].exerciseList)
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    List {
                        ForEach(exercises.getExercisePool.filter({self.routineBeingEdited.containsExercise($0)}), id: \.self) { thisExercise in
                            ExerciseRow(exercise: thisExercise)
                        }
                        .onDelete(perform: delete)
                    }
                    ScrollView {
                        VStack {
                            ForEach(self.exercises.getExercisePool.filter({!self.routineBeingEdited.containsExercise($0)})) { thisExercise in
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
                            self.didEditExercises(self.selectedExercises, true)
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
