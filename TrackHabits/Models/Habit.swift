//
//  Habit.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

@Observable final class Habit: Identifiable {
    var title: String
    var description: String
    var count: Int
    var tag: Color
    
    init(title: String, description: String, count: Int, tag: Color) {
        self.title = title
        self.description = description
        self.count = count
        self.tag = tag
    }
}
