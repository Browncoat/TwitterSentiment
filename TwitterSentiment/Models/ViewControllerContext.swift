//
//  ViewControllerContext.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/18/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

struct ViewControllerContext<T> {
    let context: T?
    
    init(context: T) {
        self.context = context
    }
}
