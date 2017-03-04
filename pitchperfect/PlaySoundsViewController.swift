//
//  PlaySoundsViewController.swift
//  pitchperfect
//
//  Created by Saw Yu Nwe on 2/28/17.
//  Copyright © 2017 Saw Yu Nwe. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
  
    enum ButtonType : Int{
        case slow = 0, fast, highPitch, lowPitch, reverb, echo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
        var duration: TimeInterval
        try! duration = AVAudioPlayer(contentsOf: recordedAudioURL).duration
        if let timeInSecond = duration.toInt(){
            durationLabel.text = "Duration: \(Time(timeInSecond: timeInSecond).toString())"
        }
    }
    
    
    @IBAction func PlayButtonPressed(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag)! {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
   
    @IBAction func StopButtonPressed(_ sender: Any) {
        stopAudio()
    }
}
