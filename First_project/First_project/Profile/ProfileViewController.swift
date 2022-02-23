//
//  ProfileViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile = ProfileView()
    
    let areaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileViewController()
        
    }
    
    func configureProfileViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(areaView)
        
        areaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        areaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        areaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        areaView
            .rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        //        let widht:CGFloat = 60
        //
        //        areaView.widthAnchor.constraint(equalToConstant: widht).isActive = true
        //        areaView.heightAnchor.constraint(equalToConstant: widht).isActive = true
        let shareProfileButton = UIBarButtonItem(image: UIImage(systemName: "text.justify"),  style: .plain, target: self, action: #selector(settingsProfile))
        shareProfileButton.tintColor = .black
        
        let settingsProfileButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),  style: .plain, target: self, action: #selector(shareProfile))
        settingsProfileButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [shareProfileButton, settingsProfileButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
    @objc func shareProfile() {
        let view = ShareViewController()
        //        let shareView = UINavigationController(rootViewController: view)
        present(view, animated: true, completion: nil)
    }
    
    @objc func settingsProfile() {
        let settingsView = ProfileSettingsViewController()
        self.navigationController?.pushViewController(settingsView, animated: true)
    }
}
