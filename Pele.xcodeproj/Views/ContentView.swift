//
//  ContentView.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//


// TODO: ALL UI ITEMS
// TODO: make exercises deletable
// TODO: make better view for selecting excercises
// TODO: make it possible to remove an exercise from a routine
// TODO: re-organize the order of exercises in a routine

import SwiftUI
import Foundation


struct ContentView: View {

    var body: some View {
        TabView {
            RoutineTab()
                .padding(.top)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Routines")
            }.tag(0)
            
            HistoryTab()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
            }.tag(1)
//            PagesView()
//                .tabItem {
//                    Image(systemName: "clock")
//                    Text("History")
//            }.tag(2)
        }
    }
}


// Depricated 
/*
StartWorkoutTab()
    .tabItem {
        Image(systemName: "play")
        Text("Start Workout")
}.tag(1)
 */



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
