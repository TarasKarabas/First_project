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
    
    private lazy var postImageView: UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .black
        iV.contentMode = .scaleAspectFit
        return iV
    } ()
    
    private lazy var autorNameLabel = makeLabel(1, 22, .black)
    private lazy var descriptionLabel = makeLabel(10, 14, .darkText)
    private lazy var likesButton = makeCountsButton("hand.thumbsup")
    private lazy var likesLabel = makeLabel(1, 18, .black)
    private lazy var viewsButton = makeCountsButton("eyes")
    private lazy var viewsLabel = makeLabel(1, 18, .black)
    
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
         likesButton,
         likesLabel,
         viewsButton,
         viewsLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            autorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.heighZero),
            autorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.leftIndentSize),
            autorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightIndentSize),
            autorNameLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.leftIndentSize),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightIndentSize),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.leftIndentSize),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppConstants.rightIndentSize),
            postImageView.heightAnchor.constraint(equalToConstant: AppConstants.imageHeigh),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            likesButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            likesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
            
            viewsButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 250),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 294),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.rightIndentSize)
        ])
    }
    
    @objc func makeLabel(_ nOfLines: Int,_ font: Int,_ textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.numberOfLines = nOfLines
        label.font = UIFont.systemFont(ofSize: CGFloat(font))
        label.textColor = textColor
        return label
    }
    
    @objc func makeCountsButton(_ name: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: name), for: .normal)
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.tintColor = .blue
        button.addTarget( self, action: #selector(tapButton), for: .touchUpInside )
        return button
    }
    
    @objc private func tapButton() {
        
    }
}
