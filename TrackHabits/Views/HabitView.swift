//
//  HabitView.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

struct HabitView: View {
    @Bindable var habit: Habit
    
    var body: some View {
        List {
            LabeledContent("Tag") {
                Circle()
                    .fill(habit.tag)
                    .frame(width: 10, height: 10)
            }
            
            Stepper("Completed: \(habit.count)", value: $habit.count, in: 0...Int.max)
            
            Section("Description") {
                Text(habit.description)
            }
        }
        .navigationTitle(habit.title)
    }
    
    init(_ habit: Habit) {
        self.habit = habit
    }
}

#Preview {
    NavigationStack {
        HabitView(Habit(title: "Reading Books", description: "", count: 3, tag: .green))
    }
}
