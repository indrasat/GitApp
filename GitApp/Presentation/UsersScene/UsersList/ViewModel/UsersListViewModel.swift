//
//  UsersListViewModel.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation
import Combine

final class UsersListViewModel: ObservableObject {
    
    @Published private(set) var users: [String] = []
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoading = false
    
    init (users: [String], isLoading: Bool = false) {
        self.users = users
        self.isLoading = isLoading
    }
    
    func fetchUsers() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            if self.users.isEmpty {
                self.errorMessage = "Failed to fetch users"
            }
        }
    }
}
