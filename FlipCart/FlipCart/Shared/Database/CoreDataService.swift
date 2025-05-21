//
//  CoreDataService.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import CoreData
import Combine
import Foundation

// CoreDataService Protocol (Interface for Dependency Injection)
//protocol CoreDataService {
//    func fetchAuthEntity() -> AnyPublisher<[AuthEntity], Error>
//    func saveAuthEntity(id: String, username: String, token: String) -> AnyPublisher<Void, Error>
//    func deleteAllAuthEntities() -> AnyPublisher<Void, Error>
//}
//
//// CoreDataServiceImpl Implementation
//final class CoreDataServiceImpl: CoreDataService {
//    private let persistentContainer: NSPersistentContainer
//
//    init(modelName: String = "YourModelName") {
//        self.persistentContainer = NSPersistentContainer(name: modelName)
//        self.persistentContainer.loadPersistentStores { _, error in
//            if let error = error {
//                fatalError("Core Data failed to load: \(error)")
//            }
//        }
//    }
//
//    // Fetch AuthEntity records
//    func fetchAuthEntity() -> AnyPublisher<[AuthEntity], Error> {
//        let context = persistentContainer.viewContext
//        return Future { promise in
//            context.perform {
//                let fetchRequest: NSFetchRequest<AuthEntity> = AuthEntity.fetchRequest()
//                do {
//                    let entities = try context.fetch(fetchRequest)
//                    promise(.success(entities))
//                } catch {
//                    promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//
//    // Save AuthEntity record
//    func saveAuthEntity(id: String, username: String, token: String) -> AnyPublisher<Void, Error> {
//        let context = persistentContainer.viewContext
//        return Future { promise in
//            context.perform {
//                let authEntity = AuthEntity(context: context)
//                authEntity.id = id
//                authEntity.username = username
//                authEntity.token = token
//                do {
//                    try context.save()
//                    promise(.success(()))
//                } catch {
//                    promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//
//    // Delete all AuthEntity records
//    func deleteAllAuthEntities() -> AnyPublisher<Void, Error> {
//        let context = persistentContainer.viewContext
//        return Future { promise in
//            context.perform {
//                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = AuthEntity.fetchRequest()
//                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//                do {
//                    try context.execute(deleteRequest)
//                    promise(.success(()))
//                } catch {
//                    promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//}
