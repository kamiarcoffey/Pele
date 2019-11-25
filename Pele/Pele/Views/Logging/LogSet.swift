//
//  SetLogPost.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

struct LogSet: View {
    
    @State var setInProgress: SetViewModel
    @ObservedObject var setReps = NumericalFieldViewModel()
    @ObservedObject var setWeight = NumericalFieldViewModel()
    @State private var didLog = false
    @State private var showingAlert = false
    var completedSet: (PeleExerciseSet) -> ()
    

    var body: some View {
        VStack {
            Text("Log Set")
                .padding(10)
            HStack {
                VStack {
                    Text("Reps").font(.system(size: 20))
//                    
//                    if (!self.didLog) {
                        TextField(String(setInProgress.previousReps), text: $setReps.text)
//                    } else {
//                        TextField(String(setInProgress.previousReps), text: self.setInProgress.previousReps)
//                    }
                    
                   
                    .keyboardType(.numberPad)
                    .background(Color.white).opacity(0.5)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .scaledToFill()
                }
                .border(Color.black.opacity(0.5), width: 1.5)
                    
                .padding(10)
                VStack {
                    Text("Weight")                        .font(.system(size: 20))
                    
                    TextField(String(setInProgress.previousWeight), text: $setWeight.text){
                        UIApplication.shared.endEditing()
                    }
                    .keyboardType(.numberPad)
                    .background(Color(.white).opacity(0.5))
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .scaledToFill()
                    
                }
                .border(Color.black.opacity(0.5), width: 1.5)
                .padding(10)
                Button(action: {
                    if !self.didLog {
                        let reps = [Rep](repeating: Rep(weightLifted: Int(self.setWeight.text) ?? 0), count: Int(self.setReps.text) ?? 0)
                        self.didLog = true
                        self.completedSet(PeleExerciseSet(reps: reps))
                    } else {
                        self.showingAlert.toggle()
                    }
                }, label: {
                    if didLog {
                        Image(systemName: "lock.fill")
                            .padding(.all, 16)
                            .foregroundColor(Color.orange)
                    } else {
                        Image(systemName: "lock.open.fill")
                            .padding(.all, 16)
                            .foregroundColor(Color.gray)
                        
                    }
                })
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Set is already logged"), message: Text("Don't worry, we're tracking all your hard work. If you want to do another set, add a new set"), dismissButton: .default(Text("OK").foregroundColor(Color.green)))
        }
    }
}




//
//    init() {
//        self.setReps =  NumericalFieldViewModel()
//        self.setWeight = NumericalFieldViewModel()
//    }

//    @State private var setReps = ""
//    @State private var setWeight = ""
