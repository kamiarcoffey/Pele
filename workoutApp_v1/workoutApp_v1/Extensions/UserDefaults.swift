//
//  UserDefaults.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

/*
 
 A workout should be able to:

 1.
 2.
 3.
 
 
use a class var for computed property of reps or something
 
 
 
 */


// TODO: change [String : [Exercise]] to something more typeSafe

import Foundation

struct ConstantKeys {
       static let playList = "playList"
       /// exsericsePool is a list of all exercises - this is needed despite the static playlist dictionary because some exercises can exist outside a set playlist
       /// the alternative is to have a dictionary entry of 'unassigned' but that smells
       /// exercisePool should ideally be a set
       static let exercisePool = "exercisePool"
       
       // Preclude possibility of having this initialized
       private init () {}
   }

extension UserDefaults {
    
    static func setRoutinePlaylists(with currentPlaylist: [Routine]) {
        do {
            try UserDefaults.standard.set(PropertyListEncoder().encode(currentPlaylist), forKey: ConstantKeys.playList)
        } catch {
            print(error)
        }
    }
    
    static func routinePlaylists() -> [Routine] {
        let data = UserDefaults.standard.object(forKey: ConstantKeys.playList)
        do {
            return try PropertyListDecoder().decode([Routine].self, from: data as! Data)
        } catch {
            print(error)
            return [Routine]()
        }
    }
    
    static func __clearAllData(){
        UserDefaults.standard.removeObject(forKey: ConstantKeys.playList)
    }
    
}
