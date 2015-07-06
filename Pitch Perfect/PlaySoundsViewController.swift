//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Steven Hertz on 6/21/15.
//  Copyright (c) 2015 Steven Hertz. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
  
  var audioPlayer : AVAudioPlayer!
  var error : NSError?
  
  @IBAction func slowPlay(sender: AnyObject) {
    println("PLay button pressed")
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("movie_quot", ofType: "mp3")!)
    audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
    if audioPlayer == nil {
      if let err = error {
        println("in error \(err.localizedDescription)")
      }
      println("out of error")
    }
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
