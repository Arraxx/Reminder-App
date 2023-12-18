//
//  AddReminderView.swift
//  Reminder_App
//
//  Created by Arrax on 17/12/23.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var currentTime = Date()
    @State var inputContext : String = ""
    @ObservedObject var operations = DoOperations()
    init(operations: DoOperations) {
        self.operations = operations
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.blue)
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack{
                            HStack{
                                Text("New Reminder")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .padding(.top,20)
                            Spacer()
                            VStack(spacing: 20){
                                RoundedRectangle(cornerRadius: 10.0)
                                    .frame(width: UIScreen.main.bounds.width*0.9,
                                           height: UIScreen.main.bounds.height*0.2)
                                    .foregroundColor(.white)
                                    .overlay(
                                        TextField("Enter Description...", text: $inputContext)
                                            .padding(.leading)
                                        
                                    )
                                    .padding()
                                
                                Form{
                                    Section(header:Text("Select Date & Time")
                                        .fontWeight(.bold)
                                    ){
                                        DatePicker("Pick a date",
                                                   selection: $currentTime,
                                                   in: Date()...)
                                    }
                                }.frame(width: UIScreen.main.bounds.width*0.95,
                                        height: UIScreen.main.bounds.height*0.15)
                                .cornerRadius(25)
                                Spacer()
                                Button(action : {
                                    let reminder = Reminder(date: formatDate(currentTime), context: inputContext)
                                    operations.addReminder(reminder : reminder)
                                    operations.printReminder()
                                    presentationMode.wrappedValue.dismiss()
                                }){
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: UIScreen.main.bounds.width*0.4,
                                                height: UIScreen.main.bounds.height*0.06)
                                        .opacity(0.2)
                                        .overlay(
                                            Text("Set")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                            
                                        )
                                }
                                .opacity(inputContext.isEmpty ? 0.5 : 1)
                                .disabled(inputContext.isEmpty)
                            }
                        }
                    )
            }
                
        }
    }
}

//#Preview {
//    AddReminderView()
//}
