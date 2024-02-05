//
//  UserListViewController.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import UIKit
import Combine

class UserListViewController: UIViewController {

    private var viewModel = UsersListViewModel(fetchUsersListUseCase: FetchUsersListUseCase(repository: DefaultUsersListRepository(userService: UserService())))
    private var cancellables = Set<AnyCancellable>()
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchUsers()
    }

    private func setupUI() {
        // Initialize the tableView
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Register a UITableViewCell class with the tableView
        self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")


        // Set up tableView constraints to fill the entire view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        // Set the data source for the tableView
        tableView.dataSource = self

        // Additional UI setup like setting background color, separators, etc.
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .singleLine
    }


    private func bindViewModel() {
        viewModel.$users
            .receive(on: RunLoop.main)
            .sink { [weak self] users in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserViewCell
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user.login, avatarUrl: user.avatarURL)
        return cell
    }
    
}

