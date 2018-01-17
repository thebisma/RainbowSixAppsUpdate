//
//  MapsTableViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 5/22/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import AVFoundation
import SVProgressHUD
var player:AVAudioPlayer = AVAudioPlayer()
func ButtonMusic()
{
    
    do
    {
        let audioPath = Bundle.main.path(forResource: "button-19", ofType: "mp3")
        try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch
    {
    }
    
    let session = AVAudioSession.sharedInstance()
    do
    {
        try session.setCategory(AVAudioSessionCategoryPlayback)
    }
    catch
    {
    }
    player.play()
}
let imagedetail = ["bankmap.jpg","chaletmap.jpg","clubhousemap.jpg","consulatemap.jpg"]
var myIndex = 0
class MapsTableViewController: UITableViewController {

    let image = ["Bank.jpg","Chalet.jpg","Clubhouse.jpg","Consulate.jpg","Hereford.jpg","House.jpg","Cafe.jpg","Kanal.jpg","Oregon.jpg","Plane.jpg","Yacht.jpg","Border.jpg","Favela.jpg","Skyscraper.jpg","Bartlett.jpg","Coastline.jpg"]
    
   
    let data = ["Bank","Chalet","Club House","Consulate","Hereford Base","House","Kafe Dostoyevsky","Kanal","Oregon","Presidential Plane","Yacht","Border","Favela","SkyScraper","Bartlett University","Coastline"]
    
    
    var imagemap = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return min(data.count,image.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FormMapsTableViewCell
        let mapName = data[indexPath.row]
        cell.mapLabel?.text = mapName
        cell.mapImage?.image = UIImage(named :image[indexPath.row])
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        myIndex = indexPath.row
        ButtonMusic()
        performSegue(withIdentifier: "map", sender: self)
        
    }
    
   

}
