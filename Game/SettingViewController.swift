
import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!

    let myTitle = ["Light", "Medium", "Hight"]
    var delegate: MyFirstProtocol?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            menuTableView.delegate = self
            menuTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.labelText?.text = myTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableRow = indexPath.row
        if tableRow == 0 {
            delegate?.lightLevel()
        } else if tableRow == 1 {
            delegate?.mediumLevel()
        } else if tableRow == 2 {
            delegate?.hightLevel()
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Choose level of play!"
            label.font = .systemFont(ofSize: 25)
            label.textColor = .red
            headerView.addSubview(label)
            return headerView
    }
}
