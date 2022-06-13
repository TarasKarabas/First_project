//
//  LoginViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 03.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = true
        return view
    }()
    
    private lazy var areaView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var logo: UIImageView = {
        let image = UIImage(named: "LogoVK")
        var logoPicture = UIImageView(image: image)
        return logoPicture
    }()
    
    lazy var profileLogin = makeTextField("Email or phone number", isSecurityText: false)
    lazy var profilePassword = makeTextField("Password", isSecurityText: true)
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoginViewController()
        
        // MARK Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureLoginViewController() {
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(areaView)
        
        [logo, profileLogin, profilePassword, loginButton].forEach {
            areaView.addSubview($0)
        }
        
        [logo, profileLogin, profilePassword, loginButton, areaView, scrollView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            areaView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            areaView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            areaView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            areaView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            areaView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.centerXAnchor.constraint(equalTo: areaView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: areaView.topAnchor,constant: 120),
            
            profileLogin.heightAnchor.constraint(equalToConstant: 50),
            profileLogin.leadingAnchor.constraint(equalTo: areaView.leadingAnchor,constant: AppConstants.leftIndentSize),
            profileLogin.trailingAnchor.constraint(equalTo: areaView.trailingAnchor,constant: AppConstants.rightIndentSize),
            profileLogin.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 120),
            
            profilePassword.heightAnchor.constraint(equalToConstant: 50),
            profilePassword.leadingAnchor.constraint(equalTo: areaView.leadingAnchor,constant: AppConstants.leftIndentSize),
            profilePassword.trailingAnchor.constraint(equalTo: areaView.trailingAnchor,constant: AppConstants.rightIndentSize),
            profilePassword.topAnchor.constraint(equalTo: profileLogin.bottomAnchor),
            
            loginButton.topAnchor.constraint(equalTo: profilePassword.bottomAnchor, constant: AppConstants.leftIndentSize),
            loginButton.leadingAnchor.constraint(equalTo: areaView.leadingAnchor, constant: AppConstants.leftIndentSize),
            loginButton.trailingAnchor.constraint(equalTo: areaView.trailingAnchor, constant: AppConstants.rightIndentSize),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        profileLogin.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        profilePassword.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    // MARK Keyboard observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func buttonPressed(_ select: UIButton) {
        
        let profileC = ProfileViewController()
        self.navigationController?.pushViewController(profileC, animated: true)
        
        select.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            select.alpha = 1.0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        print(scrollView.contentOffset.y)
    }
    
    @objc func makeTextField(_ placeHolder: String, isSecurityText: Bool) -> UITextField {
        let textField = UITextField()
        textField.setLeftPaddingPoints()
        textField.setRightPaddingPoints()
        textField.returnKeyType = .done
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.autocorrectionType = .yes
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = isSecurityText
        textField.rightViewMode = .unlessEditing
        textField.placeholder = placeHolder
        return textField
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.profileLogin {
            self.profilePassword.becomeFirstResponder()
        }
        if textField == self.profilePassword {
            textField.resignFirstResponder()
        }
        return true
    }
}

