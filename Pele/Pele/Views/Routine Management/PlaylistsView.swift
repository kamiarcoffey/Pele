//
//  RoutineTab.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct PlaylistsView : View {
    
    // var named routines is the observer
    @ObservedObject var routineListViewModel: PlaylistListViewModel
    @State var isPresentingAddRoutineModal = false
    
    init() {
        self.routineListViewModel = PlaylistListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(routineListViewModel.routines) { routine in
                    RoutineRow(routine: routine)
                    }
//                .onDelete(perform: routinesViewModel.deleteItem)
//                .onMove(perform: routinesViewModel.move)
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
//            .popover(isPresented: $isPresentingAddRoutineModal, content: {
//                AddRoutine(isPresenting: self.$isPresentingAddRoutineModal, didAddRoutine: { routine in
//                         self.routineListViewModel.addPlaylist(with: routine)
//                })
//            })
        }
    }
}



//struct RoutineTab : View {
//
//    // var named routines is the observer
//    @ObservedObject var routinesViewModel = RoutinesViewModel()
//    @State var isPresentingAddRoutineModal = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(routinesViewModel.playlists, id: \.self) { routine in
//                    RoutineRow(routine: routine, routinesViewModel: self.routinesViewModel)
//                    }
//                .onDelete(perform: routinesViewModel.deleteItem)
//                .onMove(perform: routinesViewModel.move)
//            }
//            .navigationBarTitle(Text("Your Current Routines"))
//            .navigationBarItems(trailing: Button(action: {
//                self.isPresentingAddRoutineModal.toggle()
//            }, label: {
//                Text("Add Routine")
//                    .foregroundColor(.white)
//                    .padding(.all, 6)
//                    .background(Color.orange)
//            }))
//            .popover(isPresented: $isPresentingAddRoutineModal, content: {
//                AddRoutine(isPresenting: self.$isPresentingAddRoutineModal, didAddRoutine: { routine in
//                        self.routinesViewModel.addPlaylist(with: routine)
//                })
//            })
//        }
//    }
//}
