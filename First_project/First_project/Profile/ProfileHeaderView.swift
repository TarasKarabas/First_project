//
//  ProfileHeaderView.swift
//  First_project
//
//  Created by Taras Kyparenko on 21.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var profilePicture: UIImageView = {
        var image = UIImage(named: "avatar")
        var profilePicture = UIImageView(image: image)
        profilePicture.layer.cornerRadius = AppConstants.avatarSize / 2
        profilePicture.clipsToBounds = true
        profilePicture.layer.borderWidth = 3.0
        profilePicture.layer.borderColor = UIColor.white.cgColor
        return profilePicture
    }()
    
    private var nickName: UILabel = {
        let nickName = UILabel()
        nickName.text = "Taras Karabas"
        nickName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return nickName
    }()
    
    private var status: UITextField = {
        let curentStatus = UITextField()
        curentStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        curentStatus.autocorrectionType = .yes
        curentStatus.placeholder = "Add your status..."
        return curentStatus
    }()
    
    private var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("Add new avatar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside )
        return button
    }()
    
    private var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 26 / 2
        button.clipsToBounds = true
        button.tintColor = .systemYellow
        button.addTarget(self, action: #selector(buttonPush), for: .touchUpInside )
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        backgroundColor = .lightGray
        
        [profilePicture, nickName, status, button, addPhotoButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.leftAnchorSize),
            profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.leftAnchorSize),
            profilePicture.widthAnchor.constraint(equalToConstant: AppConstants.avatarSize),
            profilePicture.heightAnchor.constraint(equalToConstant: AppConstants.avatarSize),
            
            nickName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nickName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: AppConstants.leftAnchorSize),
            nickName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            status.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34),
            status.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: AppConstants.leftAnchorSize),
            status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            button.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: AppConstants.leftAnchorSize),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.leftAnchorSize),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: AppConstants.rightAnchorSize),
            
            addPhotoButton.bottomAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: -5),
            addPhotoButton.trailingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: -5),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 26),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 26)
        ])
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width:self.frame.size.width , height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButtom = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpace, doneButtom]
        toolBar.sizeToFit()
        status.inputAccessoryView = toolBar
    }
    
    @objc private func buttonPressed() {
        
    }
    
    @objc private func buttonPush() {
        
    }
    
    @objc private func didTapDone() {
        status.resignFirstResponder()
    }
}
