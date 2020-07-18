//
//  CoreDataService.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/18.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import CoreData
import UIKit

class CoreDataService {
    private static var persistentContainer: NSPersistentContainer! = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

    private static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private init() {
    }

    static func insert(_ object: NSManagedObject) {
        context.insert(object)
    }

    static func delete(_ object: NSManagedObject) {
        context.delete(object)
    }

    static func save() {
        try? context.save()
    }

    static func rollback() {
        context.rollback()
    }

    static func fetch<T>(_ request: NSFetchRequest<T>) -> [T]? {
        return try? context.fetch(request)
    }
}
