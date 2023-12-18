//
//  UserHistoryExtensions.swift
//  Reminder_App
//
//  Created by Arrax on 18/12/23.
//

import Foundation

extension UserDefaults {
    
    private struct Keys {
        static let listOfReminders = "list_of_reminders"
    }
    
    var listOfReminders: [[String: String]]? {
        object(forKey: Keys.listOfReminders) as? [[String: String]]
    }
    
    func set(listOfReminders: [[String: String]]) {
        set(listOfReminders, forKey: Keys.listOfReminders)
    }
    
    func clearReminderData() {
        self.removeObject(forKey: Keys.listOfReminders)
    }
}
