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
        
        customView.textField.placeholder = "Type username here"
        
        customView.button.setTitle("Done", for: .normal)
        customView.button.addTarget(self, action: #selector(didPressDoneButton), for: .touchUpInside)
    }
    
    @objc func didPressDoneButton() {
        guard let string = customView.textField.text, string.isEmpty == false else {
            showTexfieldEmptyAlert()
            return
        }
        let vc = TwitterTimelineViewController(context: string)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showTexfieldEmptyAlert() {
        let alert = UIAlertController(title: "Oooops!", message: "Textfield is empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in alert.dismiss(animated: true) }))
        present(alert, animated: true)
    }
}

extension SelectTwitterUserTimelineViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let string = textField.text, string.isEmpty == false else {
            showTexfieldEmptyAlert()
            return false
        }
        let vc = TwitterTimelineViewController(context: string)
        navigationController?.pushViewController(vc, animated: true)
        
        return true
    }
}
