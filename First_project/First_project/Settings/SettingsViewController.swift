//
//  SettingsViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    let areaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettingsViewController()
    }
    
    func configureSettingsViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.tintColor = AppConstants.buttonblue
        
        [areaView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            areaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            areaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            areaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: AppConstants.leftAnchorSize),
            areaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: AppConstants.rightAnchorSize)
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.badge.plus"), style: .plain, target: self, action: #selector(addNewProfile))
        self.navigationItem.rightBarButtonItem?.tintColor = AppConstants.buttonblue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addNewProfile() {
        let addNewProfileVC = AddNewProfileViewController()
        self.navigationController?.pushViewController(addNewProfileVC, animated: true)
    }
}
