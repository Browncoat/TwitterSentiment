//
//  Injectable.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/19/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

protocol Injectable {
    init<Element>(context: Element)
}
