//
//  RecordSoundViewController.swift
//  pitchperfect
//
//  Created by Saw Yu Nwe on 2/18/17.
//  Copyright © 2017 Saw Yu Nwe. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder : AVAudioRecorder!
    
    @IBOutlet weak var lblRecord: UILabel!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnStopRecording: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnStopRecording.isEnabled = false
        btnRecord.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "playSounds"){
            guard let playSoundsVC = segue.destination as? PlaySoundsViewController else{
                fatalError("Unexpected destination \(segue.destination).")
            }
            guard let recordedVoiceURL = sender as? URL else{
                fatalError("Unexpected sender \(sender)")
            }
            playSoundsVC.recordedAudioURL = recordedVoiceURL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Did finish recording")
        if flag {
            performSegue(withIdentifier: "playSounds", sender: audioRecorder.url)
        }else{
            print("Recording was not successful")
        }
    }
    
    @IBAction func record(_ sender: UIButton) {
        lblRecord.text = "Recording ..."
        btnRecord.isEnabled = false
        btnStopRecording.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        lblRecord.text = "Tap to Record"
        
        btnRecord.isEnabled = true
        btnStopRecording.isEnabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    


}

