//
//  BoxView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct BoxView: View {
    
    var exercise: PeleExercise
    var isSelected: Bool
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: self.action) {
            VStack {
                HStack {
                    Spacer()
                    Text(self.exercise.getName())
                    if self.isSelected {
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Spacer()
                        Image(systemName: "checkmark.circle")
                    }
                    Spacer()
                    }.padding()
                .overlay(Rectangle().stroke(Color.gray, lineWidth:2))
            }
        .padding()
        }
    }
}