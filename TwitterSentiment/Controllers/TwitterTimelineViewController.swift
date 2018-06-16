//
//  TwitterTimelineViewController.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/11/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class TwitterTimelineViewController: UIViewController {
    let customView = TwitterTimelineView()
    
    var service: TwitterApplicationOnlyService!
    var tweets: [Tweet]?
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
        customView.tableView.delegate = self
        customView.tableView.dataSource = self

        service = TwitterApplicationOnlyService { [weak self] client in
            if client != nil {
                client?.getTweetsForUser("twitterapi") { tweets in
                    self?.tweets = tweets
                    DispatchQueue.main.async {
                        self?.customView.tableView.reloadData()
                    }
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
        (cell as? TweetCell)?.tweetTextLabel.text = tweets?[indexPath.row].text
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as! TweetCell
 
        return cell
    }
}

