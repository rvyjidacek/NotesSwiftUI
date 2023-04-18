//
//  DBManager.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 04.04.2023.
//

import CoreData

class DBManager {
    
    static let shared = DBManager()

    let container: NSPersistentContainer
        
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "NotesSwifUI")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func fetchEntities<T: DatabaseInitializable>(_ objectType: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) async throws -> [T] {
        return try await container.performBackgroundTask { context in
            let entityName = String(describing: T.DBObject.self)
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sortDescriptors
            
            let fetchResult = try context.fetch(fetchRequest)
            return (fetchResult as? [T.DBObject] ?? []).map { .init(from: $0) }
        }
    }
    
    func fetchEntity<T: DatabaseInitializable>(_ objectType: T.Type, id: String) async throws -> T {
        guard let entity = try await fetchEntities(objectType, predicate: NSPredicate.fetch(by: id)).first else {
            throw DatabaseError.fetchEntityFailure(entity: String(describing: T.self))
        }
        return entity
    }

    func insert<D: DatabaseEntityConvertible>(_ object: D) async throws {
        try await container.performBackgroundTask { context in
            let object = try object.convertToDBEntity(in: context)
            try context.save()
        }
    }
    
    func delete(_ object: NSManagedObject) {
        mainContext.delete(object)
    }
    
    func saveContext () {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

private extension NSPredicate {
    
    static func fetch(by id: String) -> NSPredicate {
        return NSPredicate(format: "id = %@", argumentArray: [id])
    }
}
