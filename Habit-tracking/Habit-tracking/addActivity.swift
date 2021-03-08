//
//  addActivity.swift
//  Habit-tracking
//
//  Created by Pully on 06/03/21.
//

import SwiftUI

struct text: View {
    var text: String
    var body: some View{
        Text(text)
            .font(.title3)
            .foregroundColor(.blue)
            .fontWeight(.semibold)
    }
}

struct addActivity: View {
    
    @State private var title = ""
    @State private var description = ""
    @State private var image: Image = Image(systemName: "sun")
    @State private var choose = 1
    
    var images = ["sun", "circle", "square"]
        
    var body: some View {
        NavigationView{
            Form{
            Section{
                VStack{
                    text(text: "Title of new activity")
                    TextField("Enter title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Section{
                VStack{
                    text(text: "Why you want to do this activity?")
                    TextField("What's story behind this activity?", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Section{
                VStack{
                    text(text: "Select title image")
                    Picker("", selection: $choose){
                        ForEach(0..<self.images.count){
                            select in
                            Image(systemName: self.images[select])
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("Add new event"), displayMode: .automatic)
    }
}
 
}

struct addActivity_Previews: PreviewProvider {
    static var previews: some View {
        addActivity()
    }
}
