//
//  RoutineTab.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct RoutineTab : View {
    
    // var named routines is the observer
    @ObservedObject var routines = PlaylistsManager.shared
    @State var isPresentingAddRoutineModal = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(routines.playlists, id: \.self) { routine in
                        RoutineRow(routine: routine)
                    }
                .onDelete(perform: routines.deleteItem)
                .onMove(perform: routines.move)
            }
            .navigationBarTitle(Text("Your Current Routines"))
            .navigationBarItems(trailing: Button(action: {
                self.isPresentingAddRoutineModal.toggle()
            }, label: {
                Text("Add Routine")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(Color.orange)
            }))
            .popover(isPresented: $isPresentingAddRoutineModal, content: {
                AddRoutine(isPresenting: self.$isPresentingAddRoutineModal, didAddRoutine: { routine in
                        self.routines.addPlaylists(with: routine)
                })
            })
        }
    }
}

//Section(header: Text("Weights Routines")) {}

