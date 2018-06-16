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
    let tweetTextLabel = UILabel()
    let tweetSentimentImageView = UIImageView()
    let padding: CGFloat = 20
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tweetTextLabel.numberOfLines = 0
        
        contentView.addSubview(tweetTextLabel)
        contentView.addSubview(tweetSentimentImageView)
        
        tweetTextLabel.translatesAutoresizingMaskIntoConstraints = false
        tweetTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tweetTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tweetTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding).isActive = true
        tweetTextLabel.rightAnchor.constraint(equalTo: tweetSentimentImageView.leftAnchor, constant: padding).isActive = true
        
        tweetSentimentImageView.translatesAutoresizingMaskIntoConstraints = false
        tweetSentimentImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: padding).isActive = true
        tweetSentimentImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tweetSentimentImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tweetSentimentImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
