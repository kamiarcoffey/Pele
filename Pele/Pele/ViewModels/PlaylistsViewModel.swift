//
//  PlaylistsManager.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// TODO: Replace PeleExercise with Activity where appropriate

import Foundation
import Combine

// THE VIEW MODEL
public class PlaylistsViewModel : ObservableObject {
    
    @Published var playlists = UserDefaults.routinePlaylists() {
        didSet {
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }


    
    public func deleteItem(at indexSet: IndexSet) {
        self.playlists.remove(atOffsets: indexSet)
        // UserDefaults.setRoutinePlaylists(with: self.playlists) // playlists has a didSet
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.playlists.move(fromOffsets: source, toOffset: destination)
        // UserDefaults.setRoutinePlaylists(with: self.playlists) // playlists has a didSet
    }
          
    
        // UserDefaults is thread safe so we dont actually need this...
    //    static let shared = PlaylistsManager()
//    private var notificationSubscription: AnyCancellable?
//    init() {
//        notificationSubscription = NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification).sink { _ in
//            self.objectWillChange.send()
//        }
//    }
    
    
        
    // MARK: For the ViewModel
    public func getAllExercises() -> [PeleExercise] {
        return playlists.flatMap{ $0.getExerciseList }
    }

    // MARK: private functions
    private func getAllExerciseNames() -> [String] {
        return self.getAllExercises().map{ $0.getName() }
    }
    
    // MARK: public API
    // addPlaylists allows for passing in just the name
    public func addPlaylists(with name: String, having exercises: [PeleExercise] = [PeleExercise]()) {
        let newRoutine = PeleRoutine(with: name, with: exercises)
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func addRoutine(_ newRoutine: PeleRoutine) {
        playlists.append(newRoutine)
        UserDefaults.setRoutinePlaylists(with: self.playlists)
    }
    
    public func addExercise(to routine: PeleRoutine, _ exercise: PeleExercise) {
        if let index = self.getAllExerciseNames().firstIndex(of: routine.getName) {
            self.playlists[index].exerciseList.append(exercise)
            UserDefaults.setRoutinePlaylists(with: self.playlists)
        }
    }
    
//    public func removeRoutine(with routineName: String) {
//        let updatedPlaylists = self.playlists.filter { $0.getName != routineName }
//        self.setPlaylists(updatedPlaylists)
//    }
    
 

    
    // MARK: For workout - all exercices - keep for now else delete
    func getPlaylists() -> [PeleRoutine] {
        let newRoutine = PeleRoutine(with: "All Exercises", with: self.getAllExercises())
        return self.playlists + [newRoutine]

    }
    
    func getDisplayView() -> [PeleRoutine] {
        return self.playlists
        /* Array(self.playlists.map{ RoutineView(name: $0.name, num_exercises: String($0.num_exercises)) }) */
    }
    
    func getPlayListsNames() -> [String] {
        return playlists.map{ $0.getName }
    }
    
}


// To delete
//private func setPlaylists() {
//    UserDefaults.setRoutinePlaylists(with: self.playlists)
//}
//

// replaced by delete item at row index
//public func removeExercise(from routine: PeleRoutine, having exercise: PeleExercise) {
//    if let index = self.playlists.firstIndex(of: routine) {
//        let updateRoutine = self.playlists.remove(at: index)
//        let updatedExercises = updateRoutine.exerciseList.filter{ $0 != exercise }
//        updateRoutine.exerciseList = updatedExercises
//        self.playlists.insert(updateRoutine, at: index)
//        UserDefaults.setRoutinePlaylists(with: self.playlists)
//    }
//}

