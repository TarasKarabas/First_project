//
//  ShareViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class ShareViewController: UIViewController {

    private var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 10
        button.backgroundColor = .white
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(sendTo), for: .touchUpInside )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureShareViewController()
    }
    
    func configureShareViewController() {
        view.backgroundColor = .white
        
        self.preferredContentSize = CGSize(width: 100, height: 100)
        
        view.addSubview(button)
        button.frame = CGRect(x: 90, y: 230, width: 200, height: 52)
        
    }
    
    @objc private func sendTo() {
        
    }
    
    override func updateViewConstraints() {
        self.view.frame.size.height = UIScreen.main.bounds.height - 150
        self.view.frame.origin.y =  450
        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
        super.updateViewConstraints()
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


//задать размер всплывающей вьюшки/модальной и экстэншен для скругления краев
//override func updateViewConstraints() {
//        self.view.frame.size.height = UIScreen.main.bounds.height - 150
//        self.view.frame.origin.y =  150
//        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
//        super.updateViewConstraints()
// }
//
// extension UIView {
//   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
// }

