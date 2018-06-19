//
//  SelectTwitterUserTimelineView.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/18/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class SelectTwitterUserTimelineView: UIView {
    let stackView = UIStackView()
    let padding: CGFloat = 20
    let textField = UITextField()
    let button = UIButton(type: .custom)
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .white
        
        button.setTitleColor(.green, for: .normal)
        button.backgroundColor = .red
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = padding
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor).isActive = true
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
    }
}
