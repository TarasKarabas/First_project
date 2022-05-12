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
        view.delegate = self
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
    
    lazy var profileLogin: UITextField = {
        let login = UITextField()
        login.setLeftPaddingPoints()
        login.setRightPaddingPoints()
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.delegate = self
        login.layer.cornerRadius = 10
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.autocorrectionType = .yes
        login.textColor = .black
        login.autocapitalizationType = .none
        login.backgroundColor = .systemGray6
        login.placeholder = "Email or phone nomber"
        return login
    }()
    
    lazy var profilePassword
    : UITextField = {
        let password = UITextField()
        password.setLeftPaddingPoints()
        password.setRightPaddingPoints()
        password.returnKeyType = .done
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        password.delegate = self
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.autocorrectionType = .yes
        password.textColor = .black
        password.autocapitalizationType = .none
        password.backgroundColor = .systemGray6
        password.isSecureTextEntry = true
        password.rightViewMode = .unlessEditing
        password.placeholder = "Password"
        return password
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = AppConstants.buttonblue
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside )
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside )
        return button
    }()
    
    var iconicClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileViewController()
        
        // MARK Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureProfileViewController() {
        
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
            profileLogin.leadingAnchor.constraint(equalTo: areaView.leadingAnchor,constant: AppConstants.leftAnchorSize),
            profileLogin.trailingAnchor.constraint(equalTo: areaView.trailingAnchor,constant: AppConstants.rightAnchorSize),
            profileLogin.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 120),
            
            profilePassword.heightAnchor.constraint(equalToConstant: 50),
            profilePassword.leadingAnchor.constraint(equalTo: areaView.leadingAnchor,constant: AppConstants.leftAnchorSize),
            profilePassword.trailingAnchor.constraint(equalTo: areaView.trailingAnchor,constant: AppConstants.rightAnchorSize),
            profilePassword.topAnchor.constraint(equalTo: profileLogin.bottomAnchor),
            
            loginButton.topAnchor.constraint(equalTo: profilePassword.bottomAnchor, constant: AppConstants.leftAnchorSize),
            loginButton.leadingAnchor.constraint(equalTo: areaView.leadingAnchor, constant: AppConstants.leftAnchorSize),
            loginButton.trailingAnchor.constraint(equalTo: areaView.trailingAnchor, constant: AppConstants.rightAnchorSize),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        profileLogin.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        profilePassword.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    // MARK Keyboard observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc private func buttonPressed() {
        let profileC = ProfileViewController()
        self.navigationController?.pushViewController(profileC, animated: true)
    }
    
    @objc private func buttonChanged(_ select: UIButton) {
        select.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            select.alpha = 1.0
        }
    }
    
    @IBAction func iconAction(sender: AnyObject) {
        if(iconicClick == true) {
            profilePassword.isSecureTextEntry = false
        } else {
            profilePassword.isSecureTextEntry = true
        }
        iconicClick = !iconicClick
    }
    
    @objc func keybordWillChange(notification: Notification) {
        print("0")
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

extension LoginViewController: UIScrollViewDelegate {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        print(scrollView.contentOffset.y)
    }
}

