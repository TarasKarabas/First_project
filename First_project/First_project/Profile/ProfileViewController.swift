//
//  ProfileViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    var profile = ProfileView()
    
   private let areaView: UIView = {
        let view = UIView()
       view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileViewController()
        
    }
    
    func configureProfileViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        [areaView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            areaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            areaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            areaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            areaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        let shareProfileButton = UIBarButtonItem(image: UIImage(systemName: "text.justify"),  style: .plain, target: self, action: #selector(settingsProfile))
        shareProfileButton.tintColor = .black
        
        let settingsProfileButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),  style: .plain, target: self, action: #selector(shareProfile))
        settingsProfileButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [shareProfileButton, settingsProfileButton]
        
        view.addSubview(profileHeader)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileHeader.frame = CGRect(x: 0, y: 143, width: view.bounds.width, height:  300)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
    @objc func shareProfile() {
        let view = ShareViewController()
//                let shareView = UINavigationController(rootViewController: view)
        present(view, animated: true, completion: nil)
    }
    
    @objc func settingsProfile() {
        let settingsView = ProfileSettingsViewController()
        self.navigationController?.pushViewController(settingsView, animated: true)
    }
}
