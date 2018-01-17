//
//  ReminderViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 6/9/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import FirebaseDatabase
var reminder    = ["Main jam 10 malam","Main hari minggu ranked match"]

class ReminderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //var reminder = [String]()
    @IBOutlet weak var reminderTableView: UITableView!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderTableView.delegate = self
        reminderTableView.dataSource = self
        ref = Database.database().reference()
        
        ref?.child("Reminder").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            if let actualPost = post {
                reminder.append(actualPost)
                self.reminderTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminder.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
       
        mycell.textLabel?.text = reminder[indexPath.row]
        //mycell.textLabel?.text =
            //dateArray[indexPath.row]
        return mycell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            reminder.remove(at: indexPath.row)
            reminderTableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        reminderTableView.reloadData()
    }
}
	
