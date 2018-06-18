//
//  TweetCell.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/14/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    static let identifier = "tweetcell_identifier"
    let tweetLabel = UILabel()
    let tweetSentimentLabel = UILabel()
    let padding: CGFloat = 20
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        tweetLabel.numberOfLines = 0
        tweetLabel.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(tweetLabel)
        contentView.addSubview(tweetSentimentLabel)
        
        tweetLabel.translatesAutoresizingMaskIntoConstraints = false
        tweetLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        tweetLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        tweetLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true
        tweetLabel.rightAnchor.constraint(equalTo: tweetSentimentLabel.leftAnchor, constant: padding).isActive = true
        
        tweetSentimentLabel.translatesAutoresizingMaskIntoConstraints = false
        tweetSentimentLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true
        tweetSentimentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tweetSentimentLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tweetSentimentLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
