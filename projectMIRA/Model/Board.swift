//
//  Board.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 28.07.2022.
//

import Foundation

class Board: Codable {
    var title: String
    var items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}
