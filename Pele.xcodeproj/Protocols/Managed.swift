//
//  Managed.swift
//  Pele
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
/* implement Generic request structure */

extension Manged {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
    
    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
}

/* implement entityName for NSMangedObjects conformting to Manged */
extension Manged where Self: NSManagedObject {
    static var entityName: String {
        return entity().name ?? "empty"
    }
}
