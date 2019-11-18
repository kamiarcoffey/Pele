//
//  ExerciseDetailGraphView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// Previous version have used Charts via CocoaPods. SwiftUI allows a native implementation used here

import Foundation
import SwiftUI

struct ExerciseDetailGraphView: View {
    
    var exercise: PeleExercise
    @State var pickerSelection = 0
    var displayBarValues : [[CGFloat]]
    
    init(exercise: PeleExercise) {
        self.exercise = exercise
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        
        self.displayBarValues = [exercise.sets.compactMap{ CGFloat($0.reps.count) }, exercise.sets.flatMap{ $0.reps.map{ CGFloat($0.weight)}}]
    }
    
    var body: some View {
        VStack {
            ZStack{
                VStack{
                    Text(self.exercise.name)
                        .font(.largeTitle)
                    
                    Picker(selection: $pickerSelection, label: Text("View Reps or View Weight"))
                    {
                        Text("Reps").tag(0)
                        Text("Weight").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)
                    
                    HStack(alignment: .center, spacing: 10)
                    {
                        ForEach(displayBarValues[pickerSelection], id: \.self){ data in
                            BarView(value: data, label: "hi", cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                        }
                    }.padding(.top, 24).animation(.default)
                }
            }
        }
    }
}


struct BarView: View{

    var value: CGFloat
    let label: String
//    let legend: Legend
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(.white)
                    .accessibility(label: Text(label))
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: value).foregroundColor(.green)
                    .accessibility(label: Text(label))
                
            }.padding(.bottom, 8)
        }
        
    }
}

struct Legend: Hashable {
    let color: Color
    let label: String
}
