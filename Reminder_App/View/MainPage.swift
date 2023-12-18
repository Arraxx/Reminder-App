//
//  SwiftUIView.swift
//  Reminder_App
//
//  Created by Arrax on 17/12/23.
//

import SwiftUI

struct MainPage: View {
    @ObservedObject var operations = DoOperations()
    @State var cool:Bool = false
    var body: some View {
        NavigationStack{
            HStack{
                Text("Reminder")
                    .font(.title)
                    .bold()
                    .padding([.top, .leading],20)
                Spacer()
                NavigationLink(destination: AddReminderView(operations: operations), isActive: $cool) {
                    EmptyView()
                }
                Button(action : {
                    cool.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding([.top, .trailing],20)
                }
            }
            
            BodyView(operations: operations)
            
            
        }
        .onAppear{
            operations.fetchReminders()
        }
    }
}

#Preview {
    MainPage()
}
