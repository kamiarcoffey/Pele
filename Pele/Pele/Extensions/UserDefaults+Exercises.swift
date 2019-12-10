//
//  UserDefaults+Exercises.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/23/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public static func setExercisePool(with currentExercises: [Exercise]) {
        do {
            try UserDefaults.standard.set(PropertyListEncoder().encode(currentExercises), forKey: ConstantKeys.exercisePool)
        } catch {
            print(error)
        }
    }
    
    public static func fetchExercisePool() -> [Exercise] {
        let data = UserDefaults.standard.object(forKey: ConstantKeys.exercisePool)
        do {
            return try PropertyListDecoder().decode([Exercise].self, from: data as? Data ?? Data())
        } catch {
            print(error)
            return [Exercise]()
        }
    }
    
    public static func __clearAllExercisePoolData(){
        UserDefaults.standard.removeObject(forKey: ConstantKeys.exercisePool)
    }
    
    
    
    
    
    
    
    
}
