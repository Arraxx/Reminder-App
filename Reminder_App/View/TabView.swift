//
//  TabView.swift
//  Reminder_App
//
//  Created by Arrax on 17/12/23.
//

import SwiftUI

struct TabView: View {
    var reminder : Reminder
    @ObservedObject var operations: DoOperations
    init(reminder: Reminder, operations: DoOperations) {
        self.reminder = reminder
        self.operations = operations
    }
    var body: some View {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width*0.88,
                           height: UIScreen.main.bounds.height*0.1)
                    .foregroundColor(Color(red : 245/255, green: 245/255, blue : 245/255))
                    .overlay(content: {
                        HStack{
                            VStack{
                                Text(reminder.context)
                                Spacer()
                                Text(reminder.date)
                                
                            }.padding([.top,.bottom], 10)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                            Button(action: {
                                operations.removeReminder(reminder : reminder)
                            })
                            {
                                Image(systemName: "wrongwaysign.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding([.leading,.trailing])
                    })
    }
}

//#Preview {
//    TabView(text : "amadrtyfughdghukyj", time: "00-00-00", date: "45/56/8989", isDeleted: false)
//}
