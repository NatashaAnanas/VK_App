// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Рeaлм сервис
final class RealmService {
    // MARK: - Private Constants

    private enum Constants {
        static let errorText = "Error"
    }

    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

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

    static func get<T: Object>(
        _ type: T.Type,
        config: Realm.Configuration = Realm.Configuration.defaultConfiguration
    ) -> Results<T>? {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            return realm.objects(type)
        } catch {
            print(error)
        }
        return nil
    }
}
