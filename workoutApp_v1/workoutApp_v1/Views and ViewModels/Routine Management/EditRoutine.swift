//
//  EditRoutine.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//


// #a70600

import SwiftUI

struct EditRoutine: View {
    
    // the routine to which exercises will be added
    @State var routineBeingEdited: PeleRoutine
    
    // the binding to indicate if user wishes to create a new exercise and add it to the pool
    @State var isPresentingAddExercise = false
    
    // the binding to indicate if this view should appear
    @Binding var isPresenting: Bool
    
    // the pool of all exercises
    //    @State var exercises: [Exercise] = ExerciseManager().getExercisePool
    @State var exercises = ExerciseManager()
    
    /* Perhaps this is for the view controller */
    @State var selectedExercises: [PeleExercise] = []
    
    mutating func addToSelected(new exercise: PeleExercise) {
        self.selectedExercises.append(exercise)
    }
    
    struct Row: Identifiable {
        let id = UUID()
        let cells: [PeleExercise]
    }
    
    
    // some gross code to make a 2 column grid list quickly
    func formatTwoColumMatrix(flatList: [PeleExercise]) -> [Row] {
        var retList = [Row]()
        for i in 0..<flatList.count where i % 2 == 0 { // even numbers only
            retList.append(Row(cells: [flatList[i], flatList[i+1]]))
        }
        return retList
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
//                    .padding(EdgeInsets.init(top: +10, leading: +10, bottom: +10, trailing: +10))

                }
                .navigationBarTitle(Text("Your Exercises"))
                .navigationBarItems(leading: Button(action: {
                    self.isPresentingAddExercise.toggle()
                }, label: {
                    Text("Create New Exercise")
                        .foregroundColor(.white)
                        .padding(.all, 6)
                        .background(Color(red: 0.67, green: 0.6, blue:0.0 ))
                }),
                                    trailing: Button(action: {
                                        self.routineBeingEdited.addExercises(self.selectedExercises)
                                        self.isPresenting.toggle()
                                    }, label: {
                                        Text("Add Selected Exercises")
                                            .foregroundColor(.white)
                                            .padding(.all, 6)
                                            .background(Color(red: 1.67, green: 0.6, blue:0.0, opacity: 1.0 ))
                                    }))
                    
                    .sheet(isPresented: $isPresentingAddExercise, content: {
                        AddExercise(isPresenting: self.$isPresentingAddExercise, didAddExercise: { exercise in
                            self.exercises.addExercise(exercise: exercise)
                        })
                    })
                
                
            }
        }.font(.system(size: 15))
    }
}

// Two Columns
/*
 List{
     ForEach(self.formatTwoColumMatrix(flatList: self.exercises.getExercisePool)) { row in
         HStack {
             ForEach(row.cells, id: \.self) { thisExercise in
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
 }
 .padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
 */
