//
//  HabitList.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

@Observable final class HabitList {
    var habits: [Habit] = []
    
    init(habits: [Habit] = []) {
        self.habits = habits
    }
}

fileprivate struct HabitListKey: EnvironmentKey {
    static var defaultValue: HabitList = HabitList()
}

extension EnvironmentValues {
    var habitList: HabitList {
        get { self[HabitListKey.self] }
        set {
            self[HabitListKey.self] = newValue
        }
    }
}
