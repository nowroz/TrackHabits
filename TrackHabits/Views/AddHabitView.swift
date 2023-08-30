//
//  AddHabitView.swift
//  TrackHabits
//
//  Created by Nowroz Islam on 28/8/23.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.habitList) var habitList
    
    @State private var title: String = ""
    @State private var count: Int = 0
    @State private var tag: Color = .clear
    @State private var description: String = ""
    
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $title)
                
                ColorPicker("Select Tag", selection: $tag, supportsOpacity: false)
                
                Stepper("Completed: \(count)", value: $count, in: 0...Int.max)
                
                Section("DESCRIPTION") {
                    TextField("Write description", text: $description, axis: .vertical)
                        
                }
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let trimmedName = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        guard trimmedName.isEmpty == false else {
                            displayAlert(title: "Empty Name", message: "The habit must have a name.")
                            return
                        }
                        
                        let newHabit = Habit(title: trimmedName, description: description, count: count, tag: tag)
                        
                        habitList.habits.insert(newHabit, at: 0)
                        
                        dismiss()
                    }
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showingAlert = true
    }
}

#Preview {
    AddHabitView()
}
