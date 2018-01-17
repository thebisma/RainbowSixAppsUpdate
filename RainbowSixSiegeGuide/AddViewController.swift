//
//  AddViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 6/9/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import FirebaseDatabase
class AddViewController: UIViewController {

    var ref: DatabaseReference!
    
    
    @IBOutlet weak var insertText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()        //FirebaseApp.configure()
    
    }
    
    
       @IBAction func addButton(_ sender: Any) {
            //reminder.append(insertText.text!)
            //insertText.text = ""
       ref?.child("Reminder").childByAutoId().setValue(insertText.text)
        
    }
    
    
   
    /*func addReminder(){
        let key = refreminder.childByAutoId().key
        let reminders = ["id":key,"reminderku":insertText.text! as String]
        refreminder.child(key).setValue(reminders)
        
    }*/


}
