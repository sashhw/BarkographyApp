//
//  ContentView.swift
//  BarkBark
//
//  Created by Sasha on 3/18/21.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var dogListVM = DogListViewModel()
    
    let dogs = testDataDogs
    @State var presentAddNewItem = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(dogListVM.dogCellViewModels) { dogCellVM in
                    DogCell(dogCellVM: dogCellVM)
                }
                    if presentAddNewItem {
                        DogCell(dogCellVM: DogCellViewModel(dog: Dog(name: "", food: "", allergies: "", aroundOtherDogs: false))) { dog in
                            self.dogListVM.addDog(dog: dog)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle() }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add new Barkography")
                }
            }
                .padding()
            }
            .navigationBarTitle("Barkography")
}
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DogCell: View {
    
    @ObservedObject var dogCellVM: DogCellViewModel
    var onCommit: (Dog) -> (Void) = { _ in }
   
    
    var body: some View {
        HStack {
            Spacer()
            TextField("Add new Barkography", text: $dogCellVM.dog.name, onCommit: {
                self.onCommit(self.dogCellVM.dog)
            })
        Spacer()
            
            Image(systemName: dogCellVM.dog.aroundOtherDogs ? "face.smiling" : "exclamationmark.shield")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.dogCellVM.dog.aroundOtherDogs.toggle()
                }
            Spacer()
        }
    }
}
