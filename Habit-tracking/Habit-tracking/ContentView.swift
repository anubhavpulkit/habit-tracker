//
//  ContentView.swift
//  Habit-tracking
//
//  Created by Pully on 06/03/21.
//

import SwiftUI

class NewActivity: ObservableObject {
    @Published var items: [activityItem] {
        didSet{
            let encoded = JSONEncoder()
            if let encode = try? encoded.encode(items) {
                UserDefaults.standard.setValue(encode, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items"){ //attempts to read whatever is in “Items” as a Data objec
                    let decoder = JSONDecoder()
                    if let decoded = try? decoder.decode([activityItem].self, from: items){ //does the actual job of unarchiving the Data object into an array of ExpenseItem objects.
                        self.items = decoded
                        return
                    }
                }
                self.items = []
            }
    }

struct ContentView: View {
    
    @State private var newActivity = true
    @ObservedObject var activity = NewActivity()
    
    var body: some View {
        NavigationView{
        List{
            ForEach(activity.items){ act in
                NavigationLink(destination: DetailedView()){
                HStack{
                    Image("aldrin")
                        .resizable()
                        .frame(width: 50, height: 40)
                        .clipShape(Capsule())
                        .padding(.leading, 2)
                    Text("\(act.title)")
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                    Text("~x hrs")
                        .font(.title2)
                }
                .sheet(isPresented: $newActivity){
                    addActivity(activity: self.activity)
                }
            }
            }.onDelete(perform: removeItem)
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
    func removeItem(at offsets: IndexSet) {
          activity.items.remove(atOffsets: offsets)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
