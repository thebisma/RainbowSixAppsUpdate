//
//  OperatorViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 6/1/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

class OperatorViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var expandedRows = Set<Int>()
    let operatorImage = ["ash.jpg","iq.jpg","montagne.jpg","bandit.jpg","tatcher.jpg"]
    
    let operatorname = ["ash","iq","montagne","bandit","tatcher"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operatorImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:OPTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! OPTableViewCell
        cell.myText.text = operatorname[indexPath.row]
        cell.myImages.image = UIImage(named: operatorImage[indexPath.row])
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    // TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let cell = tableView.cellForRow(at: indexPath) as? OPTableViewCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        
        cell.isExpanded = !cell.isExpanded
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? OPTableViewCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
    }

}
