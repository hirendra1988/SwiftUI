//
//  APIClient.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 15/08/24.
//

import Foundation
import Combine

class NetworkManager {
    private var cancellables = Set<AnyCancellable>()

    func fetchDogList() -> AnyPublisher<DogListModel, Error> {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: DogListModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DogViewModel: ObservableObject {
    @Published var dogList: DogListModel?
    @Published var error: String?

    private var networkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchDogList()
    }

    func fetchDogList() {
        networkManager.fetchDogList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { dogList in
                self.dogList = dogList
                print(self.dogList?.message.keys)
            })
            .store(in: &cancellables)
    }
}
