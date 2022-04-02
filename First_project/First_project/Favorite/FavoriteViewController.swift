//
//  FavoriteViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    let areaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFavoriteViewController()
    }
    
    func configureFavoriteViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Favorite"
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
