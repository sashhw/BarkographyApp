//
//  DogListViewModel.swift
//  BarkBark
//
//  Created by Sasha on 3/18/21.
//

import Foundation
import Combine

class DogListViewModel: ObservableObject {
  @Published var dogRepository = DogRepository()
    @Published var dogCellViewModels = [DogCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        dogRepository.$dogs
            .map { dogs in
                dogs.map { dog in
                    DogCellViewModel(dog: dog)
                }

        }
            .assign(to: \.dogCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func addDog(dog: Dog) {
        dogRepository.addDog(dog)
//        let dogVM = DogCellViewModel(dog: dog)
//        self.dogCellViewModels.append(dogVM)
    }
}
