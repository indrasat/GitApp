//
//  UserListViewCell.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import UIKit
import Combine

class UserViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    private var imageDownloadUseCase: ImageDownloadUseCase?
    private var cancellables = Set<AnyCancellable>()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let repository = ImageRepository()
        imageDownloadUseCase = ImageDownloadUseCase(repository: repository)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(with name: String, avatarUrl: String?) {
        nameLabel.text = name
        if let avatarUrl = avatarUrl {
            showImage(from: avatarUrl)
        }
    }
    
    func showImage(from urlString: String) {
        imageDownloadUseCase?.execute(url: urlString)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    // Handle errors, such as by setting a placeholder image
                    self?.avatarImageView.image = UIImage(named: "errorPlaceholder")
                    print("Error downloading image: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] image in
                self?.avatarImageView.image = image
            })
            .store(in: &cancellables)
    }
}


