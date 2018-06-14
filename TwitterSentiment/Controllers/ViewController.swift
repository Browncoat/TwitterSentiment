//
//  ViewController.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/11/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var service: TwitterApplicationOnlyService!

    override func viewDidLoad() {
        super.viewDidLoad()

        service = TwitterApplicationOnlyService { client in
            if client != nil {
                client?.getTweetsForUser("twitterapi") { tweets in
                    print(tweets)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

