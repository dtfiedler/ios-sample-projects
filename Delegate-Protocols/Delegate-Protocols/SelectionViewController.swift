//
//  SelectionViewController.swift
//  Delegate-Protocols
//
//  Created by Dylan Fiedler on 8/9/18.
//  Copyright © 2018 Dylan Fiedler. All rights reserved.
//

import UIKit

//protocol for when side is tapped
protocol SelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SelectionViewController: UIViewController {

    var selectionDelegate: SelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialTapped(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelTapped(_ sender: Any) {
          selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: .brown)
        dismiss(animated: true, completion: nil)
    }
}
