// ReloadTable.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Загрузка данных из сети
final class ReloadTable: Operation {
    // MARK: - Public Methods

    override func main() {
        guard let getParseData = dependencies.first as? ParseGroupData else { return }
        let parseData = getParseData.groups
        do {
            let realm = try Realm()
            guard let oldData = RealmService.get(Groups.self) else { return }
            try realm.write {
                realm.delete(oldData)
                realm.add(parseData)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
