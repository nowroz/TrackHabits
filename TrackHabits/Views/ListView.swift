//
//  ContentView.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.habitList) var habitList
    
    @State private var showingAddHabitSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habitList.habits) { habit in
                    NavigationLink {
                        HabitView(habit)
                    } label: {
                        HStack {
                            Circle()
                                .fill(habit.tag)
                                .frame(width: 10, height: 10)
                            
                            Divider()
                                .padding(.horizontal, 3)
                            
                            VStack(alignment: .leading) {
                                Text(habit.title)
                                    .font(.headline)
                                
                                Text("Completed: \(habit.count)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("TrackHabits")
            .toolbar {
                Button {
                    showingAddHabitSheet = true
                } label: {
                    Label("Add Habit", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabitSheet) {
                AddHabitView()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        habitList.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    ListView()
}
