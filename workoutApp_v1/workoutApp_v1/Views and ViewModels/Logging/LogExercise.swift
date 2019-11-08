//
//  LogExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: find a better way thhan hardcoding 200 for frame min width

// the view for each exercise in a routine. This view will have a variable number of subViews

struct LogExercise: View {
        
    @ObservedObject var setViewModel: SetViewModel

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(setViewModel.setsInProgress, id: \.id) { setInProgress in
                        SetLogPost(setInProgress: setInProgress, completedSet: { newSet in
                            self.setViewModel.logSet(finishedSet: newSet)
                        })
                    }
                    Button(action: {
                        self.setViewModel.generateAdditionalSet()
                    }, label: {
                        Text("Do Another Set")
                            .padding(.all, 16)
                    })
                }
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        //        .background(Color.gray)
                .border(Color.gray.opacity(0.5), width: 0.5)
            }
        }

    }
}


// for empty callback trigger
/*
 SetLogPost(setInProgress: setInProgress, exerciseInProgress: self.exercise) { self.exercise.generateAdditionalSet()
 }
 */
