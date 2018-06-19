//
//  TwitterTimelineViewController.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/11/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

final class TwitterTimelineViewController: UIViewController, Injectable {
    let customView = TwitterTimelineView()
    let classificationService = ClassificationService()
    var username: String?
    
    var service: TwitterApplicationOnlyService!
    var tweets: [Tweet]?
    
    override func loadView() {
        view = customView
    }
    
    convenience init<Element>(context: Element) {
        self.init(nibName: nil, bundle: nil)
        
        username = context as? String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.rowHeight = UITableViewAutomaticDimension
        customView.tableView.estimatedRowHeight = 100
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        service = TwitterApplicationOnlyService { [weak self] client in
            guard let client = client, let username = self?.username else {
                print("No client")
                return
            }
            
            client.getTweetsForUser(username) { tweets in
                self?.tweets = tweets
                DispatchQueue.main.async {
                    self?.customView.tableView.reloadData()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UITableView Delegate and Datasource
extension TwitterTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let tweet = tweets?[indexPath.row], let cell = cell as? TweetCell {
            let sentiment = classificationService.predictSentiment(from: tweet.text)
            cell.tweetSentimentLabel.text = sentiment.emoji
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as! TweetCell
        if let tweet = tweets?[indexPath.row] {
            cell.tweetLabel.text = tweet.text
        }
        return cell
    }
}

