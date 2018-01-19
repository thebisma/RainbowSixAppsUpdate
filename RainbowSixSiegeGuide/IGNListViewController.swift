//
//  IGNListViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 18/01/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit
import RealmSwift
class IGNListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var ignTableView: UITableView!
    
    @IBOutlet weak var inputTextField: UITextField!

    var todoArray = List<Todoes>()
    var realm: Realm!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = ignTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BismaTableViewCell
        let todosrealm = todoArray[indexPath.row]
        mycell.ignLabel?.text = todosrealm.todo
        //mycell.datetime?.text = todosrealm.dateandtime
        return mycell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete"){(action, indexPath) in
            
            try! self.realm.write {
                let list = self.todoArray[indexPath.row]
                self.realm.delete(list)
            }
                      self.todoArray.remove(at: indexPath.row)
                       tableView.reloadData()
                       self.prepareTable()
    
        }
        return [deleteAction]
    }
    
    
    func prepareTable(){
        if todoArray.count < 0
        {
            ignTableView.isHidden = false
        }else{
            ignTableView.isHidden = false
        }
    }
    
    func loaddatarealm(){
        self.realm = try! Realm()
        let lists = realm.objects(Todoes.self)
        if self.todoArray.realm == nil, lists.count > 0 {
            for list in lists {
                self.todoArray.append(list)
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
      loaddatarealm()
       prepareTable()
    }
 
    func updatedata(todoe: Todoes){
        let realm = try! Realm()
        try! realm.write{
            todoArray.insert(todoe, at: todoArray.count)
            realm.add(todoe)
        }
        ignTableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let todoe = Todoes()
        try! realm.write{
            todoArray.insert(todoe, at: todoArray.count)
            realm.add(todoe)
        }
        ignTableView.reloadData()
        prepareTable()
        loaddatarealm()
        // Do any additional setup after loading the view.
    }


    @IBAction func Addbutton(_ sender: Any) {
        
        let temptodo = Todoes()
        temptodo.todo = (inputTextField.text!)
        inputTextField.text = ""
        self.view.endEditing(true)
        tabBarController?.selectedIndex = 0
        let realm = try! Realm()
        //let todoe = Todoes()
        try! realm.write{
            todoArray.insert(temptodo, at: todoArray.count)
            realm.add(temptodo)
            loaddatarealm()
            prepareTable()
            ignTableView.reloadData()
        }
    }
    
  
    
   

}
