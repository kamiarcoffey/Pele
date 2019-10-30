//
//  RoutineTabView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct RoutineTabView : View {
    
    // var named routines is the observer
    @ObservedObject var routines = WorkoutPlaylist()
    
    @State var isPresentingAddRoutineModal = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16){
                List {
                    ForEach(routines.playlists, id: \.self) { routine in
                        RoutinePost(routine: routine)
                    }
                    .onDelete(perform: routines.deleteItem)
                    .onMove(perform: routines.move)
                }.navigationBarTitle(Text("Your Current Routines"))
                    .navigationBarItems(trailing: Button(action: {
                        self.isPresentingAddRoutineModal.toggle()
                    }, label: {
                        Text("Add Routine")
                            .foregroundColor(.white)
                            .padding(.all, 6)
                            .background(Color.green)
                    }))
                    .sheet(isPresented: $isPresentingAddRoutineModal, content: {
                        AddRoutine(isPresenting: self.$isPresentingAddRoutineModal, didAddRoutine: {
                            routine in
                            //                                self.routines.addRoutine(routine)
                            /* piping string vs routine? */
                            /* manipulate model here since this is where the model is vs letting the subview do it? */
                            self.routines.addPlaylists(with: routine)
                        })
                    })
            }
        }.padding(.all, 6)
    }
}
