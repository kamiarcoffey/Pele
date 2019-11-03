//
//  RoutinesView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/24/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct AddRoutine: View {
    
    @State var isPresentingEditRoutineModel = false
    
    @Binding var isPresenting: Bool
    
    /* replaces UITextField */
    @State private var newRoutineName = ""
    
    var didAddRoutine: (String) -> ()
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Routine Name")
                TextField("Always Add Leg Day", text: $newRoutineName)
            }
            Button(action: {
                /* passing a binding - this will toggle up to parent */
                /* replaces when an MVC would dismiss itself - not dismissed by parent */
                
                self.didAddRoutine(.init(self.newRoutineName))
                
                self.isPresenting.toggle()
            }, label: {
                Text("Done")
                    .padding(.all, 16)
            })
            Spacer()
        }.padding(.all, 16)
    }
}