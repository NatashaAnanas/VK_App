//
//  Group.swift
//  VK_App
//
//  Created by Анастасия Козлова on 02.11.2022.
//

import Foundation

/// Хранилище с информацией о группах
struct Group {
    var names = ["The Swift Developers", "ItAnanas", "Оха Аса", "Подслушано", "TRILL"]
    var images = ["дом1", "дом2", "дом3", "дом4", "дом5"]
    var statuses = ["Задушим констреинтами, присоединяйтесь!",
                    "Наука, 12 987 followers",
                    "Астрология, 42 546 followers",
                    "Блог, 172 876 followers",
                    "Юмор, 5 567 987 followers"]
}

/// Хранилище с информацией о новых группах
struct NewGroup {
    let names = ["ВПШ", "IT", "Обои для iPhone", "Vogue", "Фильмы"]
    let images = ["дом5", "дом2", "дом1", "дом3", "дом4"]
    let statuses = ["Блог, 4 172 876 followers",
                    "Наука, 452 987 followers",
                    "Творчество, 2 546 followers",
                    "Мода, 1 456 286 followers",
                    "Фильмы, 5 567 987 followers"]
}
