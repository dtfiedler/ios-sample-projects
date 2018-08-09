//
//  ViewController.swift
//  Delegate-Protocols
//
//  Created by Dylan Fiedler on 8/9/18.
//  Copyright © 2018 Dylan Fiedler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
    }
    
    @IBAction func chooseSelected(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
}

extension ViewController: SelectionDelegate{
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        imageview.image = image
        nameLabel.text = name
        view.backgroundColor = color
    }
}
