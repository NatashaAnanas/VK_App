//
//  RealmService.swift
//  VK_App
//
//  Created by Анастасия Козлова on 28.11.2022.
//

import Foundation
import RealmSwift

/// Работа с методами БД
final class RealmService {
    
    // MARK: - Public Methods
    func saveToRealm<T: Object>(object: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)

            try realm.write({
                realm.add(object, update: .modified)
            })
        } catch {
            print(error)
        }
    }
}
