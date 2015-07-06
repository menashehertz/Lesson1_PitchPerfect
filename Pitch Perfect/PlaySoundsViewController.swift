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
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // var error = NSError()

    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")!)
    
    audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
    audioPlayer.prepareToPlay()
    audioPlayer.play()

    
    
   // audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
    
    
//      if let
//    audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
    
//       if let err = error {
//             println("audioPlayer error \(err.localizedDescription)")
//        } else {
//             audioPlayer?.delegate = self
//             audioPlayer?.prepareToPlay()
//          }
//


  }
  


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
