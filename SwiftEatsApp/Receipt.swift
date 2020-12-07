//
//  Receipt.swift
//  SwiftEatsApp
//
//  Created by Chelsey Bergmann on 12/7/20.
//
import UIKit
import Foundation

class Receipt: UIViewController {
    @IBOutlet weak var entreeLabel: UILabel!
    @IBOutlet weak var sideLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the label text for each IBOutlet.
        // Ex entreeLabel?.text = "hamburger" but whichever was selected.
        
    }
}
