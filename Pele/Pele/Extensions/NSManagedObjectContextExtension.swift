//
//  NSManagedObjectContextExtension.swift
//  Pele
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import UIKit
import CoreData


// Singleton pattern gets the same current context from the AppDelegate
extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}


// Extension to encapsulte object insertion
// generic over A where A is a subtype of NSMangedObject and conforms to Managed
// Capturing Values (for A)
extension NSManagedObjectContext {
    func insertObject<A: NSManagedObject> () -> A where A:Manged {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A
            else {fatalError("Object insertion error (find me in NSManagedObjectContextExtension.swift")}
        return obj
    }
}

// Extension for Saving
// save() and rollback() are owned by NSManaged[*]
extension NSManagedObjectContext {
    public func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }
    
    // helper that you should call  ----> call mOC.performChanges and give it static Object.insert(into: self.mOc, .....)
    // for me re: ~Swifty Synax~ block is the function supplied as an argument
    // call block and then save
    public func performChanges(block: @escaping() -> ()) {
        perform {
            block()
            _ = self.saveOrRollback()
        }
    }
}
