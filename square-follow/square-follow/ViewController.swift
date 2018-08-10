//
//  ViewController.swift
//  square-follow
//
//  Created by Dylan Fiedler on 8/9/18.
//  Copyright © 2018 Dylan Fiedler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var square: UIView!
    var selectedLocation: CGPoint!
    var x_cord: CGFloat = 0.0
    var y_cord: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: view.frame.width / 2 - 50, y: view.frame.height / 2 - 50, width: 100, height: 100)
        square = UIView(frame: rect)
        square.backgroundColor = .blue
        let panGesture = createGestureRecognizer()
        square.addGestureRecognizer(panGesture)
        view.addSubview(square)
    }
    
    func createGestureRecognizer() -> UIPanGestureRecognizer {
        return UIPanGestureRecognizer(target: self, action: #selector(followSquare))
    }

    @objc func followSquare(gesture: UIPanGestureRecognizer){
        selectedLocation = gesture.location(in: view)
        if gesture.state == .began {
            x_cord = square.center.x - selectedLocation.x
            y_cord = square.center.y - selectedLocation.y
        }
        square.alpha = 1 - (max(abs(gesture.velocity(in: view).x), abs(gesture.velocity(in: view).y)) / 100000)
        //current location in view
        let smoothLocation = CGPoint(x: selectedLocation.x + x_cord, y: selectedLocation.y + y_cord)
        square.center = smoothLocation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

