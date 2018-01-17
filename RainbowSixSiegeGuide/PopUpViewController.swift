//
//  PopUpViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 5/28/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit


class PopUpViewController: UIViewController,FBSDKLoginButtonDelegate {

    
    
    @IBAction func quitButton(_ sender: Any) {
        exit(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        let loginButton = FBSDKLoginButton()
        //loginButton.center = view.center;
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func popupClose(_ sender: Any) {
        self.removeAnimate()
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil)
            
        {
            print(error.localizedDescription)
        }
            
        else
        {
            
        }
        
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        ButtonMusic()
        performSegue(withIdentifier: "logout", sender: nil)
    }

}
