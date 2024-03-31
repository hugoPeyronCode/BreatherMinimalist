//
//  Item.swift
//  DuolingoForWellness
//
//  Created by Hugo Peyron on 31/03/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
