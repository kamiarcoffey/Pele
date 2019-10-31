//
//  EditRoutine.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct EditRoutine: View {
    
    // the routine to which exercises will be added
    @State var routineBeingEdited: Routine
    
    // the binding to indicate if user wishes to create a new exercise and add it to the pool
    @State var isPresentingAddExercise = false

    // the binding to indicate if this view should appear
    @Binding var isPresenting: Bool
    
    // the pool of all exercises
//    @State var exercises: [Exercise] = ExerciseManager().getExercisePool
    @State var exercises = ExerciseManager()

    /* Perhaps this is for the view controller */
    @State var selectedExercises: [Exercise] = []
    
    mutating func addToSelected(new exercise: Exercise) {
        self.selectedExercises.append(exercise)
    }
        
    /* end viewController */
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text(routineBeingEdited.name)
                    Divider()
                    
                    List {
                        ForEach(exercises.getExercisePool.filter({self.routineBeingEdited.containsExercise($0)}), id: \.self) { thisExercise in
                            ExercisePost(exercise: thisExercise)
                        }
//                        .onDelete(perform: exercises.deleteItem)

                    }
                    
                    List{
                        ForEach(self.exercises.getExercisePool, id: \.self) { thisExercise in
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
                }
                .navigationBarTitle(Text("Your Exercises"))
                .navigationBarItems(leading: Button(action: {
                    self.isPresentingAddExercise.toggle()
                }, label: {
                    Text("Create New Exercise")
                        .foregroundColor(.white)
                        .padding(.all, 6)
                        .background(Color.green)
                }),
                                    trailing: Button(action: {
                                        self.routineBeingEdited.addExercises(self.selectedExercises)
                                        self.isPresenting.toggle()
                                    }, label: {
                                        Text("Add Selected Exercises")
                                            .foregroundColor(.white)
                                            .padding(.all, 6)
                                            .background(Color.green)
                                    }))

                    .sheet(isPresented: $isPresentingAddExercise, content: {
                        AddExercise(isPresenting: self.$isPresentingAddExercise, didAddExercise: { exercise in
                            self.exercises.addExercise(exercise)
                        })
                    })
                
                
            }
        }.font(.system(size: 15))
    }
}
