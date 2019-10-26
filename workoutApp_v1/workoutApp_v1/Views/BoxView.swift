//
//  BoxView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/26/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct BoxView: View {
    
    var exercise: Exercise
    var isSelected: Bool
    
    var action: () -> Void

    var body: some View {
        
        Button(action: self.action) {
            HStack {
                Text(self.exercise.getName())
                Text(String(self.isSelected))
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
