//
//  Start.swift
//  Swift Eats
//
//  Created by Chelsey Bergmann on 12/5/20.
//

import Foundation
import UIKit

class Start: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
    }
    override func viewDidAppear(_ animated: Bool) {
        print("hi")
        var options = TableView()
        options.addCell(cellText: "McDonalds")
    }
    
}
