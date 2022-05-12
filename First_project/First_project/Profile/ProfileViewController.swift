//
//  ProfileViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileViewController()
        
    }
    
    func configureProfileViewController() {
     
        view.backgroundColor = .systemGroupedBackground

        [profileHeader].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            profileHeader.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        let shareProfileButton = UIBarButtonItem(image: UIImage(systemName: "text.justify"),  style: .plain, target: self, action: #selector(settingsProfile))
        shareProfileButton.tintColor = AppConstants.buttonblue
        
        let settingsProfileButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),  style: .plain, target: self, action: #selector(shareProfile))
        settingsProfileButton.tintColor = AppConstants.buttonblue
        
        navigationItem.rightBarButtonItems = [shareProfileButton, settingsProfileButton]
        
        view.addSubview(profileHeader)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Profile"
    }
    
    @objc func shareProfile() {
        let vc = ShareViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func settingsProfile() {
        let settingsView = ProfileSettingsViewController()
        self.navigationController?.pushViewController(settingsView, animated: true)
    }
}
