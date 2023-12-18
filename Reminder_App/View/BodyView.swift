//
//  BodyView.swift
//  Reminder_App
//
//  Created by Arrax on 17/12/23.
//

import SwiftUI

struct BodyView: View {
    @ObservedObject var operations = DoOperations()
    init(operations: DoOperations) {
        self.operations = operations
    }
    var body: some View {
        NavigationStack{
            List{
                ForEach(operations.reminders) { reminder in
                    TabView(reminder: reminder, operations: operations)
                }
            }
        }
    }
}
//
//#Preview {
//    BodyView()
//}
