//
//  DetailedView.swift
//  Habit-tracking
//
//  Created by Pully on 08/03/21.
//

import SwiftUI

struct DetailedView: View {
    
    @State private var hours:Float = 0
    
    var body: some View {
        NavigationView{
            GeometryReader{  geo in
            VStack(spacing: 20){
    
                Image("aldrin")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width * 0.75)
                    .clipShape(Capsule())
                    .padding(.top, 20)
                    
                Text("Started on : Date")
                
                Stepper("Spend \(hours, specifier: "%.2f") hours", value: $hours, in: 0...50, step: 0.25)
                    .padding()
                
                Text("Description")
            
                ScrollView(.vertical){
                    Text("All about description")
                        .padding()
                }
                Spacer()
                }
                
            }
            .navigationBarTitle(Text("Name of task"), displayMode: .automatic)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
