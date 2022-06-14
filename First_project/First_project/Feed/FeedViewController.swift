//
//  FViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let areaView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let stackView: UIStackView = {
        let sV = UIStackView()
        sV.layer.cornerRadius = 14
        sV.layer.shadowColor = UIColor.darkGray.cgColor
        sV.layer.shadowOpacity = 0.9
        sV.layer.shadowRadius = 14
        sV.layer.shadowOffset = CGSize(width: 4, height: 4)
        sV.alignment = .fill
        sV.axis = .vertical
        sV.distribution = .fillEqually
        sV.spacing = 0.0
        return sV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFeedViewController()
    }
    
    func configureFeedViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let button1 = createButton("ONE")
        button1.addTarget(self, action: #selector(loginPassword), for: .touchUpInside)
        let button2 = createButton("TWO")
        button2.addTarget(self, action: #selector(loginPassword), for: .touchUpInside)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        [areaView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            areaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            areaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            areaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: AppConstants.leftIndentSize),
            areaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: AppConstants.rightIndentSize),
            
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.centerXAnchor.constraint(equalTo: areaView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: areaView.centerYAnchor, constant: -10)
        ])
        
        //MARK: - add newPostButton to right top
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(presentModality))
        self.navigationItem.rightBarButtonItem?.tintColor = AppConstants.buttonblue
    }
    
    private func createButton(_ setTitle: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = AppConstants.buttonblue
        button.setTitleColor(.white, for: .normal)
        return button
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
    @objc private func loginPassword() {
        let vC = LoginViewController()
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
