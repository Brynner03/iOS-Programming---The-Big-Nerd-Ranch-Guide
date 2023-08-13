//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Brynner Ventura on 8/12/23.
//

import UIKit

class ConversionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let randomColor = getRandomColor()
        view.backgroundColor = randomColor
    }
    
    func getRandomColor() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }

}

