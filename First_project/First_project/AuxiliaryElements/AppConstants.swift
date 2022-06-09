//
//  AppConstants.swift
//  First_project
//
//  Created by Taras Kyparenko on 21.03.2022.
//

import UIKit

enum AppConstants{
    static let imageHigh: CGFloat = 200
    static let imageWith: CGFloat = 120
    static let avatarSize: CGFloat = 100
    static let highZero: CGFloat = 0
    static let leftAnchorSize: CGFloat = 16
    static let rightAnchorSize: CGFloat = -16
    static let buttonblue: UIColor = UIColor.init(named: "Color") ?? .blue
}

struct Post {
    let autor: String
    let description: String
    let image: UIImage?
    let likes: Int
    let views: Int
}
