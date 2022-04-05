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
        view.backgroundColor = .white
        return view
    }()
    
    private let stackView: UIStackView = {
        let sW = UIStackView()
        sW.backgroundColor = AppConstants.buttonblue
        sW.layer.borderWidth = 1.0
        sW.layer.borderColor = UIColor.black.cgColor
        sW.layer.cornerRadius = 14
        sW.layer.shadowColor = UIColor.darkGray.cgColor
        sW.layer.shadowOpacity = 0.9
        sW.layer.shadowRadius = 14
        sW.layer.shadowOffset = CGSize(width: 4, height: 4)
        return sW
    }()
    
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        //        let shadow = EdgeShadowLayer(forView: button, edge: .Top)
        //        button.layer.addSublayer(shadow)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("ONE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(presentModality), for: .touchUpInside )
        return button
    } ()
    
    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("TWO", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(presentModality), for: .touchUpInside )
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFeedViewController()
        
    }
    
    func configureFeedViewController() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        [areaView, stackView, button1, button2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            areaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            areaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            areaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: AppConstants.leftAnchorSize),
            areaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: AppConstants.rightAnchorSize),
            
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.centerXAnchor.constraint(equalTo: areaView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: areaView.centerYAnchor, constant: -10),
            
            button1.heightAnchor.constraint(equalToConstant: 70),
            button1.widthAnchor.constraint(equalToConstant: 50),
            button1.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            button1.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            
            button2.heightAnchor.constraint(equalToConstant: 70),
            button2.widthAnchor.constraint(equalToConstant: 50),
            button2.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            button2.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20)
            
        ])
        
        //MARK: - add newPostButton to right top
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(presentModality))
//        self.navigationItem.rightBarButtonItem?.tintColor = .black
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
