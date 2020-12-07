import UIKit

class CellClass: UITableViewCell {
    
}

class ViewController: UIViewController {
    @IBOutlet weak var btnSelectDrink: UIButton!
    @IBOutlet weak var btnSelectEntree: UIButton!
    @IBOutlet weak var btnSelectSide: UIButton!
//    @IBOutlet weak var checkout: UIButton!
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    var selectedButton = UIButton()
    
    var dataSource = [String]()
    var selectedResterant = ""
    
    var nextUVC = Receipt()
    var selectedEntree = ""
    var selectedSide = ""
    var selectedDrink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }

    @IBAction func onClickSelectFruit(_ sender: Any) {
        if(selectedResterant == "McDonald's"){
            dataSource = ["Hamburger", "McChicken", "McNuggets"]
        }
        if(selectedResterant == "Chipotle"){
            dataSource = ["Bowl", "Tacos", "Plate"]
        }
        if(selectedResterant == "Taco Bell"){
            dataSource = ["Quesadilla", "Crunchwrap", "Taco Pack"]
        }
        selectedButton = btnSelectEntree
        addTransparentView(frames: btnSelectEntree.frame)
    }
    
    @IBAction func onClickSelectGender(_ sender: Any) {
        if(selectedResterant == "McDonald's"){
            dataSource = ["Fries", "Apple", "Yogurt"]
        }
        if(selectedResterant == "Chipotle"){
            dataSource = ["Chips", "Rice", "Beans"]
        }
        if(selectedResterant == "Taco Bell"){
            dataSource = ["Chips", "Rice", "Extra Sauce"]
        }
        selectedButton = btnSelectSide
        addTransparentView(frames: btnSelectSide.frame)
    }
    
    @IBAction func onClickSelectDrink(_ sender: Any) {
        if(selectedResterant == "McDonald's"){
            dataSource = ["Coke", "Diet Coke", "Sprite"]
        }
        if(selectedResterant == "Chipotle"){
            dataSource = ["Coke", "Diet Coca", "Water"]
        }
        if(selectedResterant == "Taco Bell"){
            dataSource = ["Coke", "7up Slushie", "Freezie"]
        }
        selectedButton = btnSelectDrink
        addTransparentView(frames: btnSelectSide.frame)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        nextUVC = segue.destination as! Receipt
//    }
}
