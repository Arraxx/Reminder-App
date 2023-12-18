//
//  GetUserDefault.swift
//  Reminder_App
//
//  Created by Arrax on 18/12/23.
//

import Foundation

public struct GetReminders {
    public init() { }

    public func get() -> [Reminder] {
        var listOfReminders = [Reminder]()
        let reminders = UserDefaults.standard.listOfReminders ?? []
        for reminder in reminders {
            listOfReminders.append(Reminder(dictionary: reminder))
        }
        return listOfReminders
    }
}
