//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Steven Hertz on 6/21/15.
//  Copyright (c) 2015 Steven Hertz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var recordingInProgress: UILabel!
  
  @IBOutlet weak var recordButton: UIButton!
  
  @IBOutlet weak var stopButton: UIButton!
  
  @IBAction func stopRecord(sender: AnyObject) {
    self.recordingInProgress.hidden = true
    stopButton.hidden = true
    recordButton.enabled = true
    println("Stop Button Pressed")


  }
  @IBAction func recordVoice(sender: AnyObject) {
    // TODO: record voice
    recordButton.enabled = false
    self.recordingInProgress.hidden = false
    stopButton.hidden = false

  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // MARK:  Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    stopButton.hidden = true
    recordButton.enabled = true

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

