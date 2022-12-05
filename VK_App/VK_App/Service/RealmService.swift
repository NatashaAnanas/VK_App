// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Раалм сервис
final class RealmService {
    // MARK: - Private Constants

    private enum Constants {
        static let errorText = "Error"
    }

    // MARK: - Public Methods

    func saveToRealm<T: Object>(object: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)

            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            print(error)
        }
    }
}
