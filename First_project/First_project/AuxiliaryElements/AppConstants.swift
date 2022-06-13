//
//  AppConstants.swift
//  First_project
//
//  Created by Taras Kyparenko on 21.03.2022.
//

import UIKit

enum AppConstants{
    static let imageHeigh: CGFloat = 200
    static let imageWidth: CGFloat = 350
    static let avatarSize: CGFloat = 100
    static let heighZero: CGFloat = 0
    static let leftIndentSize: CGFloat = 16
    static let rightIndentSize: CGFloat = -16
    static let buttonblue: UIColor = UIColor.init(named: "Color") ?? .blue
}

struct Post {
    let autor: String
    let description: String
    let image: UIImage?
    let likes: Int
    let views: Int
}

