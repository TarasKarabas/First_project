//
//  ProfileViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let dataSourseAdapter = StorageTableViewAdapter()
    
    private lazy var profileTableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.identifier))
        tableView.dataSource = dataSourseAdapter
        tableView.delegate = dataSourseAdapter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileViewController()
    }
    
    func configureProfileViewController() {
        title = "Posts"
        view.backgroundColor = .white
        
        [profileTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
