//
//  ContentView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct RoutineRow: View {
    let routine: Routine

    var body: some View {
        HStack {
            Text(routine.name)
                .fontWeight(.bold)
            Text(routine.exerciseCount)
        }
    }
}


// MARK: PUT THIS INTO A FILE
// Observer Pattern
class RoutinesViewModel: ObservableObject {
        
    @Published var routines: [Routine] = [
        .init(name: "Leg Day", exerciseList: [Exercise(with: "Squats", isWeights: true)])
    ]
}

struct ContentView: View {

    // var named model is the observer
    @ObservedObject var model = RoutinesViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                VStack{
                    List {
                        ForEach(model.routines, id: \.self) { routine in
//                            Text(user.name)
                            RoutineRow(routine: routine)
//                            UserRow(user: user)
                        }
                    }.navigationBarTitle(Text("Your Current Routines")) // navTitle is for List
                    
                    Divider()
                    
                    List {
                        Text("Exercises Here")
                    }
                }
            }
                .tabItem {
//                    Image(systemName: "1.home")
                    Text("Build A Routine")
                }.tag(0)
            Text("Second View")
                .tabItem {
//                    Image(systemName: "2.square")
                    Text("Start A Workout")
                }.tag(1)
        }
    }
}



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
