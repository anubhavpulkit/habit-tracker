//
//  DetailedView.swift
//  Habit-tracking
//
//  Created by Pully on 08/03/21.
//

import SwiftUI

struct DetailedView: View {
    
    @State private var hours = 0
    
    var body: some View {
        NavigationView{
            GeometryReader{  geo in
            VStack(spacing: 20){
    
                Image("aldrin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.75)
                    .clipShape(Capsule())
                    .padding(.top, 20)
                    
                Text("Started on : Date")
                
                Stepper("\(hours) of hours", value: $hours, in: 0...50)
                    .padding()
                
                Text("Description")
            
                ScrollView(.vertical){
                    Text("All about description")
                }
                .padding()
                }
            }
            .navigationBarTitle(Text("Name of task"), displayMode: .inline)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
