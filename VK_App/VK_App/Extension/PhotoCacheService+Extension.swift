// PhotoCacheService+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Расширение для PhotoCacheService

extension PhotoCacheService {
    class Table: DataReloadable {
        let table: UITableView
        init(table: UITableView) {
            self.table = table
        }

        func reloadRow(atIndexpath indexPath: IndexPath) {
            table.reloadRows(at: [indexPath], with: .left)
        }
    }
}
