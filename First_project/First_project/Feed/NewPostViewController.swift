//
//  NewPostViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class NewPostViewController: UIViewController {
    private var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNPViewController()
        
    }
    
    func configureNPViewController() {
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.frame = CGRect(x: 90, y: 680, width: 200, height: 52)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 10
        button.backgroundColor = .white
        button.setTitle("Create New Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelSelf))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "photo.artframe"), style: .done, target: self, action: #selector(addPictureSelf))
        
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    // +allert
    @objc private func didTapButton() {
        let alert = UIAlertController(title: "Error", message: "You can't create an empty post", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func cancelSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func addPictureSelf() {
        let alert = UIAlertController(title: "Error", message: "Sory, but your gallery is still empty", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cansel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
