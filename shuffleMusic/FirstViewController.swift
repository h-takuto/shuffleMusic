//
//  FirstViewController.swift
//  shuffleMusic
//
//  Created by 早川拓人 on 2016/10/03.
//  Copyright © 2016年 早川拓人. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "sample", ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
    }
    
    @IBAction func buttonTapped(_ sender : AnyObject) {
        if (audioPlayer.isPlaying) {
            audioPlayer.stop()
            button.setTitle("Stop", for: UIControlState())
        }
        else {
            audioPlayer.play()
            button.setTitle("Play", for: UIControlState())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

