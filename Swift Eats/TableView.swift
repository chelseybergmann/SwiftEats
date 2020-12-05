//
//  Start.swift
//  Swift Eats
//
//  Created by Chelsey Bergmann on 12/5/20.
//

import Foundation
import UIKit

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var tableData = ["McDonalds", "Chipotle", "Taco Bell"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        self.tableView.isEditing = true
        configureRefreshControl()
        tableView.reloadData()
        
       
    }
    
    /*
     Refresh table data when there are changes.
     */
    func configureRefreshControl() {
       // Add the refresh control to your UIScrollView object.
       tableView.refreshControl = UIRefreshControl()
       tableView.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
       // Update your content…

       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.tableView.refreshControl?.endRefreshing()
       }
    }
    /*
     Add a new cell option.
     */
    func addCell(cellText: String) {
        Singleton.sharedInstance.firstArray.append(cellText)
        configureRefreshControl()
       
    }
    
    class Singleton: NSObject {
        static let sharedInstance = Singleton()
        var firstArray = [String]()
    }
    
    /*
     Construct the header.
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))

            let label = UILabel()
       
        label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width-5, height: headerView.frame.height)
            label.text = "Swift Eats"
            
        label.textColor = UIColor.black
        label.textAlignment = .center

            headerView.addSubview(label)
        label.center.x = self.view.center.x
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
            return headerView
        }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
      
    /*
     Construct each table cell.
     */
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = tableData[indexPath.row]
       
        // Color alternate
        if (indexPath.row % 2 == 1) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
      }
      
    /*
     Get number of cells.
     */
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tableData.count
      }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0;//Choose your custom row height
    }


    
}
