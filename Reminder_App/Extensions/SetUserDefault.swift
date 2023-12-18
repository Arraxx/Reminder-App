//
//  SetUserDefault.swift
//  Reminder_App
//
//  Created by Arrax on 18/12/23.
//

import Foundation

public struct SetReminders {
    public init() { }
    
    public func set(listOfReminders: [Reminder]) {
        var listOfRemindersJSON = [[String: String]]()
        for reminder in listOfReminders {
            listOfRemindersJSON.append(reminder.toDictionary())
        }
        UserDefaults.standard.set(listOfReminders: listOfRemindersJSON)
    }
}
