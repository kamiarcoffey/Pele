//
//  Managed.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/3/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData

/* A protocol to enable re-use of custom sorting for fetching NSManged objects */

protocol Manged: class, NSFetchRequestResult {
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}


/* give a default implementation if empty*/

extension Manged {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
}
