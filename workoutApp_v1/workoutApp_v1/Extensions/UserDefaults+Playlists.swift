//
//  UserDefaults+Playlists.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/23/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


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
            return try PropertyListDecoder().decode([Routine].self, from: data as? Data ?? Data())
        } catch {
            print(error)
            return [Routine]()
        }
    }
    
    static func __clearAllPlaylistData(){
        UserDefaults.standard.removeObject(forKey: ConstantKeys.playList)
    }
}