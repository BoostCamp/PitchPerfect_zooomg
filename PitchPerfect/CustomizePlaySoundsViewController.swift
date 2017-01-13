//
//  CustomizeViewController.swift
//  PitchPerfect
//
//  Created by MinGeon Ju on 2017. 1. 12..
//  Copyright © 2017년 MinGeon Ju. All rights reserved.
//

import UIKit
import AVFoundation

class CustomizePlaySoundsViewController: UIViewController {

    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var echoSwitch: UISwitch!
    @IBOutlet weak var reverbSwitch: UISwitch!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        let rate = rateSlider.value
        let pitch = pitchSlider.value
        let echo = echoSwitch.isOn
        let reverb = reverbSwitch.isOn
        print(rate,pitch,echo,reverb)
        playSound(rate : rate,pitch : pitch,echo : echo, reverb : reverb)
        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
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
