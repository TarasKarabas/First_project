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
        profilePicture.layer.cornerRadius = 100 / 2
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
        button.backgroundColor = .blue
        button.setTitle("Add new avatar", for: .normal)
        button.titleColor(for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside )
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
        [profilePicture, nickName, status, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            
            nickName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nickName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            nickName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            status.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34),
            status.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 66)
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
    
    @objc private func didTapDone() {
        status.resignFirstResponder()
    }
}
