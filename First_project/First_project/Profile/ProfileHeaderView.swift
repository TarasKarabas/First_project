//
//  ProfileHeaderView.swift
//  First_project
//
//  Created by Taras Kyparenko on 21.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var profileImageView: UIImageView = {
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
    
    private var statusTextField: UITextField = {
        let sText = UITextField()
        sText.setLeftPaddingPoints()
        sText.setRightPaddingPoints()
        sText.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        sText.layer.cornerRadius = 14
        sText.layer.borderWidth = 1.0
        sText.layer.borderColor = UIColor.darkGray.cgColor
        sText.autocorrectionType = .yes
        sText.backgroundColor = .white
        sText.placeholder = "Add your status..."
        return sText
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget( self, action: #selector(setStatusButtonPressed), for: .touchUpInside )
        return button
    }()
    
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 26 / 2
        button.clipsToBounds = true
        button.tintColor = .systemYellow
        button.addTarget( self, action: #selector(buttonPush), for: .touchUpInside )
        return button
    }()
    
    private var curentStatus: UILabel = {
        var iW = UILabel()
        iW.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        iW.layer.cornerRadius = 14
        iW.text = "...waiting for new status..."
        iW.textColor = .lightGray
        return iW
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
        
        backgroundColor = .systemGray4
        
        [profileImageView, nickName, statusTextField, setStatusButton, addPhotoButton, curentStatus].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.leftAnchorSize),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.leftAnchorSize),
            profileImageView.widthAnchor.constraint(equalToConstant: AppConstants.avatarSize),
            profileImageView.heightAnchor.constraint(equalToConstant: AppConstants.avatarSize),
            
            nickName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nickName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            nickName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            
            setStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 57),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.leftAnchorSize),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: AppConstants.rightAnchorSize),
            
            addPhotoButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -5),
            addPhotoButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -5),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 26),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 26),
            
            curentStatus.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -5),
            curentStatus.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: AppConstants.leftAnchorSize),
            curentStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.rightAnchorSize)
        ])
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width:self.frame.size.width , height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButtom = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpace, doneButtom]
        toolBar.sizeToFit()
        statusTextField.inputAccessoryView = toolBar
    }
    
    @objc private func setStatusButtonPressed() {
        curentStatus.textColor = .black
        curentStatus.text = statusTextField.text
        statusTextField.text = nil
    }

    @objc private func buttonPush() {
        
    }
    
    @objc private func didTapDone() {
        statusTextField.resignFirstResponder()
    }
}
