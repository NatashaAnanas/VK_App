// DataReloadable.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Методы для перезагрузки UITableView
protocol DataReloadable {
    func reloadRow(atIndexpath indexPath: IndexPath)
}
