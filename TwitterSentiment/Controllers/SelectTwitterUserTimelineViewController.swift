//
//  SelectTwitterUserTimelineViewController.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/18/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import UIKit

class SelectTwitterUserTimelineViewController: UIViewController {
    let customView = SelectTwitterUserTimelineView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        customView.textField.delegate = self
        
        customView.textField.placeholder = "Helllloooo"
        customView.button.setTitle("Hi", for: .normal)
    }
}

extension SelectTwitterUserTimelineViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let string = textField.text else {
            print("No text")
            return false
        }
        let vc = TwitterTimelineViewController(context: string)
        navigationController?.pushViewController(vc, animated: true)
        
        return true
    }
}
