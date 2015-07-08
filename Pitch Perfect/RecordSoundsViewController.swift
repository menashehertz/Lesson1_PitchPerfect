//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Steven Hertz on 6/21/15.
//  Copyright (c) 2015 Steven Hertz. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
  
  var audioRecorder: AVAudioRecorder!
  var recordedAudio: RecordedAudio!

  @IBOutlet weak var recordingInProgress: UILabel!
  @IBOutlet weak var recordButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!

  @IBAction func stopRecord(sender: AnyObject) {
    setScreenButtons(true)
    audioRecorder.stop()
  }
  
  @IBAction func recordVoice(sender: AnyObject) {
    setScreenButtons(false)
    audioRecorder.record()
  }

  @IBAction func pauseRecording(sender: AnyObject) {
    audioRecorder.pause()
    setScreenButtons(true)
  }
  
  func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
    if (flag) {
      recordedAudio = RecordedAudio(fielPathUrl: recorder.url, title: recorder.url.lastPathComponent!)
      performSegueWithIdentifier("stopRecording", sender: recordedAudio)
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "stopRecording" {
      let playSoundVC: PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
      let data = sender as! RecordedAudio
      playSoundVC.receivedAudio = recordedAudio
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
    let recordingName = "mySound.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    var session = AVAudioSession.sharedInstance()
    session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
    audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
    audioRecorder.delegate = self
    audioRecorder.meteringEnabled = true
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    setScreenButtons(true)
  }
  
  func setScreenButtons(flag : Bool) {
    recordButton.enabled = flag
    recordingInProgress.hidden = flag
    stopButton.hidden = flag
    pauseButton.hidden = flag
  }
  
}






