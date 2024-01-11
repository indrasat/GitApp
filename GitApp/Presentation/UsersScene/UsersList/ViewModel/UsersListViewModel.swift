//
//  UsersListViewModel.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation
import Combine

final class UsersListViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private let fetchUsersListUseCase: FetchUsersListUseCase
    
    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    init(fetchUsersListUseCase: FetchUsersListUseCase) {
        self.fetchUsersListUseCase = fetchUsersListUseCase
    }
    
    func fetchUsers() {
        isLoading = true
        fetchUsersListUseCase.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { users in
                self.users = users
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
}
