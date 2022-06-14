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
        let cell = (tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell)
        cell?.post = Storage.posts[indexPath.section][indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}

extension StorageTableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = ProfileHeaderView()
        return headerView
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
