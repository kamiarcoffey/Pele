//
//  PlaylistsViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 12/10/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


//===----------------------------------------------------------------------===//
//
//  This class is a ViewModel
//  It publishes the list of all routines
//
//===----------------------------------------------------------------------===//

class PlaylistListViewModel: ObservableObject {
    
    @Published var routines = [Routine]() //[PlaylistViewModel]()
    
    init() {
        fetchAllRoutines()
    }
    
    func fetchAllRoutines() {
        self.routines = PlaylistsManager.shared.getAllRoutines() //.map(PlaylistViewModel.init)
    }

}



struct PlaylistViewModel {
    var name = ""
    
    init(routine: Routine) {
        self.name = routine.name
    }
}
