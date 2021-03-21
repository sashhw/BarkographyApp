//
//  Dog.swift
//  BarkBark
//
//  Created by Sasha on 3/18/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Dog: Codable, Identifiable {
  @DocumentID var id: String?
    var name: String
    var food: String
    var allergies: String
    var aroundOtherDogs: Bool
    
}

#if DEBUG
let testDataDogs = [
    Dog(name: "Skye", food: "AM/PM", allergies: "Dust", aroundOtherDogs: false),
    Dog(name: "Alvie", food: "AM/PM", allergies: "N/A", aroundOtherDogs: true)
]

#endif

