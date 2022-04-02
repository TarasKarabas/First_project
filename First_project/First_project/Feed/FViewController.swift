//
//  FViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class FViewController: UIViewController {
    // MARK: - create work view
    private let areaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFeedViewController()
        
    }
    
    func configureFeedViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
          
        //MARK: - add newPostButton to right top
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(presentModality))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    //MARK: - add func with configuration value when comeback to feedView
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Feed"
    }
    //MARK: - transition to next modal view/addNewPost throw initialization UINavigationController!!!
    @objc private func presentModality() {
        let view = NewPostViewController()
        let postView = UINavigationController(rootViewController: view)
        present(postView, animated: true, completion: nil)
    }
}
