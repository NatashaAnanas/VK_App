// DataReloadable.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Метод для обновления ячеек
protocol DataReloadable {
    func reloadRow(atIndexpath indexPath: IndexPath)
}
