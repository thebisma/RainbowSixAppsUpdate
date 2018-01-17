//
//  WebviewViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by iosdev on 5/13/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import SVProgressHUD
class WebviewViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://r6stats.com/")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        
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
