//
//  PostTableViewCell.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
 
    var post: Post? {
        didSet {
            guard let post = post else {
                return
            }
            postImageView.image = post.image
            autorNameLabel.text = post.autor
            likesLabel.text = String(post.likes)
            descriptionLabel.text = post.description
            viewsLabel.text = String(post.views)
        }
    }
    
    private lazy var autorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkText
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var postImageView: UIImageView = {
        let iV = UIImageView()
        iV.contentMode = .scaleAspectFit
        iV.translatesAutoresizingMaskIntoConstraints = false
        return iV
    } ()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

private extension PostTableViewCell {
    
    func setupLayout() {
        [autorNameLabel,
         descriptionLabel,
         postImageView,
         likesLabel,
         viewsLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            autorNameLabel.topAnchor.constraint(equalTo: postImageView.topAnchor, constant: AppConstants.highZero),
            autorNameLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            autorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            descriptionLabel.topAnchor.constraint(equalTo: autorNameLabel.bottomAnchor, constant: AppConstants.leftAnchorSize),
            descriptionLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.leftAnchorSize),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: AppConstants.rightAnchorSize),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.leftAnchorSize),
            postImageView.widthAnchor.constraint(equalToConstant: AppConstants.imageWith),
            postImageView.heightAnchor.constraint(equalToConstant: AppConstants.imageHigh),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            likesLabel.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: AppConstants.rightAnchorSize),
            likesLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            viewsLabel.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: AppConstants.rightAnchorSize),
            viewsLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightAnchorSize)
        ])
    }
}
