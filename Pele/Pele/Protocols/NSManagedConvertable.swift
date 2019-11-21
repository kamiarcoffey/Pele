//
//  NSManagedConvertable.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/7/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import CoreData


// adapter pattern?

/// Implemented by local objects that will be coverted to Core Data objects
protocol ConvertableToNSManaged {
    associatedtype T where T: NSManagedObject
    
    // convert yourself to an NSObject T
    func convertToNSObject() -> T
}


/// Implemented by NSManged Objects that will be converted to local PeleObjects
protocol ConvertableToLocal {
    associatedtype T // where T is local
    
    // convert yourself to a localObject T
    func convertToLocal() -> T
}
