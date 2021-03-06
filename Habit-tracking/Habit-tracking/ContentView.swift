//
//  ContentView.swift
//  Habit-tracking
//
//  Created by Pully on 06/03/21.
//

import SwiftUI

class Addition: ObservableObject{
    @Published var newActivity = [activity].self
}

struct ContentView: View {
    
    @State private var newActivity = false
    
    var body: some View {
        NavigationView{
        List{
            ForEach(0..<5){ act in
                Text("\(act)")
            }
            
        }
        .navigationBarTitle(Text("Habit-tracking"), displayMode: .automatic)
        .navigationBarItems(trailing: Button(action: {
            self.newActivity.toggle()
            print("Hello WOrld")
        }){
          Image(systemName: "plus")
        })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
