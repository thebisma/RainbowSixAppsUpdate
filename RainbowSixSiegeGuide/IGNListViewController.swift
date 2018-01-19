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
    
    var todoArray = List<Todoes>()
    var realm: Realm!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
        
    }
    
    func preparetable(){
        if todoArray.count < 1{
            
            
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
