//
//  DogRepository.swift
//  BarkBark
//
//  Created by Sasha on 3/21/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DogRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var dogs = [Dog]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("dogs").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.dogs = querySnapshot.documents.compactMap { document in
                    do {
                   let x = try document.data(as: Dog.self)
                        return x
                }
                    catch {
                        print(error)
                    }
                    return nil
            }
            
        }
    }
}
    func addDog(_ dog: Dog) {
        do {
    let _ = try db.collection("dogs").addDocument(from: dog)
    }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    
    
    
}
}
