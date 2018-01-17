////
//  ViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by iosdev on 4/29/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import SVProgressHUD
import PermissionScope
import FirebaseAuth
import Firebase
//import FacebookCore
//import FacebookLogin




class ViewController: UIViewController ,FBSDKLoginButtonDelegate{
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("goodbye")
    }
   
    
let pscope = PermissionScope()
@IBOutlet weak var loginButton: FBSDKLoginButton!
    
    
    override func viewDidLoad() {
        let loginButton = FBSDKLoginButton()
        
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
       // PermissionScope
        
     
    
        if (FBSDKAccessToken.current() != nil)
        {
            performSegue(withIdentifier: "a", sender: self)
        }
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil)
        {
        performSegue(withIdentifier: "a", sender: self)
        }
    }
        
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        print("login")
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                
                return
            }
           print("user logged")
          }
          performSegue(withIdentifier: "a", sender: self)
        
    }
        /*if (error != nil)
        
        {
               let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            
            
            print(error.localizedDescription)
            
        }
      
        else
        {
     FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        // performSegue(withIdentifier: "a", sender: self)
          return true
        }
     */
    


    
    
}
