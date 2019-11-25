//
//  ExerciseDetailGraphView.swift
//  Pele
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
    var displayBarValues : [[(data: CGFloat, label: String)]]
    private let exerciseHistoryViewModel: ExerciseHistoryViewModel
    @State var historySize = 3
    
    init(exercise: PeleExercise) {
        self.exercise = exercise
        self.exerciseHistoryViewModel = ExerciseHistoryViewModel(activity: self.exercise)
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        
//        self.displayBarValues = self.exerciseHistoryViewModel.barChartFormattedValues
        self.displayBarValues = [
                                [(data: CGFloat(10), label: "yes"), (data: CGFloat(10), label: "yes")],
                                [(data: CGFloat(10), label: "yes"), (data: CGFloat(10), label: "yes")]
                                ]
        
    }
    
    var body: some View {
        VStack {
                VStack {
                    Text(self.exercise.name)
                        .font(.largeTitle)

                    Picker(selection: $pickerSelection, label: Text("View Reps or View Weight"))
                    {
                        Text("Reps").tag(0)
                        Text("Weight").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
//                        .padding(.horizontal, 10)
                    
                    HStack(alignment: .center, spacing: 10) {
//                      BarChartView(data: self.displayBarValues[pickerSelection].map{Double($0.data)}, title:"test")
                        BarGraphView(data: self.displayBarValues[pickerSelection], pickerSelection: self.pickerSelection)
                    }.padding(.top, 24).animation(.default)
                }
        }
    }
}

struct BarGraphView: View {
    
    var data: [(CGFloat, String)]
    var pickerSelection: Int
    
    var body: some View {
        HStack {
            ForEach(data, id:\.1 ) { datum in
                BarView(value: datum.0, label: "hi", cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
            }
        }
    }
}


struct BarView: View{

    var value: CGFloat
    var label: String
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: value).foregroundColor(.green)

            }.padding(.bottom, 8)
            Text(String(label))
        }
        
    }
}

