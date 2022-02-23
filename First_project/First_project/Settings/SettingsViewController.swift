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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.badge.plus"), style: .plain, target: self, action: #selector(addNewProfile))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
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
