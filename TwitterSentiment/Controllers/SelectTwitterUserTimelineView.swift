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
    let button = UIButton(type: .roundedRect)
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .white
        
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        
        button.setTitleColor(.green, for: .normal)
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = padding
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor).isActive = true
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
    }
}
