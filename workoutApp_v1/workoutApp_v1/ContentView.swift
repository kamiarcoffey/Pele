//
//  ContentView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct RoutinePost: View {
    @State var routine: Routine

    var body: some View {
        HStack {
            Text(routine.name)
                .fontWeight(.bold)
            Text(routine.exerciseCount)
            

        }
    }
}



// MARK: @Observed Object is the model so what do you need VM for?

//class RoutinesViewModelController: ObservableObject {
//
////    can make this a BindableObject?
////    var didChange = PassthroughSubject<Void, Never>()
//
//    func deleteItem(at indexSet: IndexSet) {
//        self.routines.remove(atOffsets: indexSet)
//    }
//
//    @Published var routines: [Routine] = [
//        .init(name: "Leg Day", exerciseList: [Exercise(with: "Squats", isWeights: true)])
//    ]
//
//}

struct AddRoutine: View {
    
    
    // does this replace viewDidLoad?
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
//            Button(action: {
//                //
//                }, label: {
//                    Text("Done")
//                        .padding(.all, 16)
//            })
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


struct ContentView: View {

    // var named model is the observer
    @ObservedObject var routines = WorkoutPlaylist()
    
    @State var isPresentingAddRoutineModal = false
    
    var body: some View {
        TabView {
            NavigationView {
                VStack(spacing: 16){
                    List {
                        ForEach(routines.playlists, id: \.self) { routine in
//                            Text(user.name)
                            RoutinePost(routine: routine)
//                            UserRow(user: user)
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
                                self.routines.addPlaylists(with: routine)
                            })
                        })
                    
                    Divider()
                    
                    List {
                        Text("Exercises Here")
                    }
                }
            }.padding(.all, 6)
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
