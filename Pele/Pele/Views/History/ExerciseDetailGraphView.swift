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
    
    var exercise: Exercise
    @State var pickerSelection = 0
    var displayBarValues: [[(data: Double, label: String)]]
    @State var historySize = 3
    
    init(exercise: Exercise) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        self.exercise = exercise
        self.displayBarValues = ExerciseHistoryViewModel(activity: exercise).barChartFormattedValues
    }
    
    mutating private func setData() {
        let exerciseHistoryViewModel = ExerciseHistoryViewModel(activity: self.exercise)
        self.displayBarValues = exerciseHistoryViewModel.barChartFormattedValues
    }
    
    var body: some View {
        VStack {
            VStack {                
                Picker(selection: $pickerSelection, label: Text("View Reps or View Weight")) {
                    Text("Reps").tag(0)
                    Text("Weight").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 10)
                
                if (self.displayBarValues[0].count > 0) {
                    BarChartView(series: self.displayBarValues[self.pickerSelection], title: self.exercise.name)
                }
            }
        }
    }
}





// Dummy Testing
//        self.displayBarValues = [
//            [(data: Double(10), label: "yes"), (data: Double(5), label: "yes")],
//            [(data: Double(5), label: "yes"), (data: Double(10), label: "yes")]
//        ]
