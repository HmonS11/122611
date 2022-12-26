//
//  ViewController.swift
//  Qatar2022_CustomCell
//
//  Created by wizard on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return nations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = nations.keys.sorted() //["A", "B"...."H"]
        let key = keys[section]
        if let group = nations[key] {
            return group.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NationCell", for: indexPath)
        let keys = nations.keys.sorted() //["A", "B"...."H"]
        let key = keys[indexPath.section]
        guard let group = nations[key] else { fatalError() }
        let nation = group[indexPath.row]
        
        let imageflag = cell.viewWithTag(11) as? UIImageView
        imageflag?.image = UIImage(named: nation.flag)
        
        imageflag?.backgroundColor = .blue
        
        let lblName = cell.viewWithTag(12) as? UILabel
        lblName?.text = nation.name
        let lblGroup = cell.viewWithTag(13) as? UILabel
        lblGroup?.text = "Group \(nation.group)"
        return cell
    }
}

