//
//  TwitterTimelineView.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/14/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class TwitterTimelineView: UIView {
    let tableView = UITableView()
    
    convenience init() {
        self.init(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
