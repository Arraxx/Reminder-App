//
//  ClearUserDefault.swift
//  Reminder_App
//
//  Created by Arrax on 18/12/23.
//

import Foundation

public struct ClearRemindersData {
    public init() { }
    
    public func clear() {
        UserDefaults.standard.clearReminderData()
    }
}
