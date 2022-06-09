//
//  StorageTableViewAdapter.swift
//  First_project
//
//  Created by Taras Kyparenko on 25.05.2022.
//

import UIKit

final class StorageTableViewAdapter: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.posts[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.identifier), for: indexPath) as? PostTableViewCell {
            cell.post = Storage.posts[indexPath.section][indexPath.row]
        }
        
        return PostTableViewCell()
    }
}

extension StorageTableViewAdapter: UITableViewDelegate {
    
//   MARK make custom size for section thet you chouse
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 && indexPath.row == 2 {
//            return 600
//        }
        return UITableView.automaticDimension
    }
//    MARK can implement some methods st adress selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("indexPath \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
