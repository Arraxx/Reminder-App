//
//  OperationsForReminderApp.swift
//  Reminder_App
//
//  Created by Arrax on 17/12/23.
//

import SwiftUI
import Combine
//
//class 
class DoOperations : ObservableObject{
    @Published var reminders : [Reminder] = []
    
    func fetchReminders() {
        reminders = GetReminders().get()
    }
    func addReminder(reminder : Reminder){
        reminders.append(reminder)
        SetReminders().set(listOfReminders: reminders)
        scheduleNotification(reminder: reminder)
    }
    func printReminder(){
        // just for debugging
        print("\(reminders)")
    }
    func removeReminder(reminder: Reminder){
        reminders.removeAll{ $0.id == reminder.id }
        SetReminders().set(listOfReminders: reminders)
    }
    
    func scheduleNotification(reminder: Reminder) {
        if let date = parseDate(reminder.date) {
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = reminder.context
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully")
                }
            }
        }
    }
    
}

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter.string(from: date)
}

func parseDate(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter.date(from: dateString)
}
