//
//  SecondViewController.swift
//  shuffleMusic
//
//  Created by 早川拓人 on 2016/10/03.
//  Copyright © 2016年 早川拓人. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView : UITableView?
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    var albums: [AlbumInfo] = []
    var songQuery: SongQuery = SongQuery()
    var audio: AVAudioPlayer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Songs"
        let stopButton: UIBarButtonItem = UIBarButtonItem(title: "Stop", style: UIBarButtonItemStyle.plain, target: self, action: "stop")
        self.navigationItem.rightBarButtonItem = stopButton
        albums = songQuery.get()
    }
    
    func stop() {
        if audio != nil {
            audio.stop()
            self.title = "Songs"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums[section].songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = albums[indexPath.section].songs[indexPath.row].songTitle
        cell.detailTextLabel?.text = albums[indexPath.section].songs[indexPath.row].artistName
        return cell
    }
}

