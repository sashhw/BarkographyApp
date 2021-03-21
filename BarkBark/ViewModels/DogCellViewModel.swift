//
//  DogCellViewModel.swift
//  BarkBark
//
//  Created by Sasha on 3/18/21.
//

import Foundation
import Combine

class DogCellViewModel: ObservableObject, Identifiable {
    @Published var dog: Dog
    
    var id = ""
    @Published var aroundOtherDogsIcon = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(dog: Dog) {
        self.dog = dog
        $dog
            .map { dog in
    
                dog.aroundOtherDogs ? "face.smiling" : "exclamationmark.shield"
            }
            .assign(to: \.aroundOtherDogsIcon, on: self)
            .store(in: &cancellables)
        
        $dog
            .compactMap { dog in
                dog.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
