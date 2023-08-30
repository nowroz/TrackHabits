//
//  TrackHabitsApp.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

@main
struct TrackHabitsApp: App {
    var habitList: HabitList = HabitList()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.habitList, habitList)
        }
    }
}
