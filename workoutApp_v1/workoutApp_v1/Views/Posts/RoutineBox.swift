//
//  RoutineBox.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct RoutineBox: View {
    @State var routine: Routine
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    print("Pressed")
                }, label: {
                    Text("edit")
                })
                Image(systemName: "play")
                HStack {
                    Text(routine.name)
                        .fontWeight(.bold)
                        .padding()
                    Text(routine.exerciseCount)
                        .padding()
                       .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.red)
                }
            }
        }
    }
}
