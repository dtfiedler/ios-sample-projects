//
//  SelectionViewController.swift
//  Delegate-Protocols
//
//  Created by Dylan Fiedler on 8/9/18.
//  Copyright © 2018 Dylan Fiedler. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
