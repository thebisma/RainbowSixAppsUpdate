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
    
    
    @IBOutlet weak var InputTextField: UITextField!
    
    
    //var todoArray = List<Todoes>()
    var realm: Realm!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = ignTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BismaTableViewCell
        let todosrealm = todoArray[indexPath.row]
        mycell.textLabel?.text = todosrealm.todo
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
        if todoArray.count < 1 {
            //noTodosLabel.isHidden = false
            ignTableView.isHidden = true
        }else{
            ignTableView.isHidden = true
        }
    }
    
    
    /*func loaddatarealm(){
        self.realm = try! Realm()
        let lists = realm.objects(Todoes.self)
        if self.todoArray.realm == nil, lists.count > 0 {
            for list in lists {
                self.todoArray.append(list)
            }
        }
    }
    
    */
    override func viewDidAppear(_ animated: Bool) {
        ignTableView.reloadData()
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddButton(_ sender: Any) {
     let temptodo = Todoes()
        temptodo.todo = (InputTextField.text!)
     InputTextField.text = ""
     self.view.endEditing(true)
     tabBarController?.selectedIndex = 0
    }
    
    
  
    
   

}
