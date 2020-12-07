//
//  RestaurantsTableViewCell.swift
//  DropDownSelection
//
//  Created by Chelsey Bergmann on 12/6/20.
//

import UIKit
//protocol {
//    void setDataSource(String[] a)
//}
struct Restaurant {
    var isoCode: String
    var name: String
}

class RestaurantTableViewCell:  UITableViewCell {
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
}

class RestaurantsTableViewController: UITableViewController {

    let restaurants = [
        Restaurant(isoCode: "mcdonalds", name: "McDonald's"),
        Restaurant(isoCode: "chipotle", name: "Chipotle"),
        Restaurant(isoCode: "tacobell", name: "Taco Bell"),
    ]
    
    var nextVC = ViewController()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! RestaurantTableViewCell

        let restaurant = restaurants[indexPath.row]
        cell.restaurantLabel?.text = restaurant.name
        cell.restaurantImage?.image = UIImage(named: restaurant.isoCode)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextVC.selectedResterant = restaurants[indexPath.row].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller.
        nextVC = segue.destination as! ViewController
    }
}
