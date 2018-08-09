//
//  ViewController.swift
//  Delegate-Protocols
//
//  Created by Dylan Fiedler on 8/9/18.
//  Copyright © 2018 Dylan Fiedler. All rights reserved.
//

import UIKit


let lightNotificationKey = "com.xor.lightSide"
let darkNotificationKey = "com.xor.darkSide"

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
        
        //create observers
        createObservers()
    }
    
    deinit {
        //want to remove them to prevent confusion if screen is deallocated (downside to observers, extra housekeeping)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func chooseSelected(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        present(selectionVC, animated: true, completion: nil)
    }
    
    func createObservers(){
        //light observers
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: light, object: nil)

        //dark observers
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: dark, object: nil)
    }
    
    @objc func updateImage(notification: Notification){
        let imageName = (notification.name == light) ? "luke" : "vader"
        imageview.image = UIImage(named: imageName)!
    }
    
    @objc func updateLabel(notification: Notification){
        let name = (notification.name == light) ? "Luke Skywalker" : "Darth Vader"
        nameLabel.text = name
    }
    
    @objc func updateBackground(notification: Notification){
        let color = (notification.name == light) ? UIColor.brown : UIColor.red
        view.backgroundColor = color
    }
}
