# swift

![Screen Shot 2023-11-09 at 10 40 07 AM](https://github.com/ayusingh-123/swift/assets/83396369/00d38a59-1c02-4055-80c5-78f53e78fde3) 


//
//  ViewController.swift
//  MusicApp
//
//  Created by Student on 16/11/23.
//  Copyright © 2023 Lovely Profesional University. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var songStatusLabel: UILabel!
    @IBOutlet weak var playBGutton: UIButton!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playSong(named: "Ram")
    }
    
    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            playSong(named: "Vikram")
        case 1:
            playSong(named: "Sad")
        case 2:
            playSong(named: "Ram")
        default:
            break;
            
        }
    }
    
    
//    func soundFiles() {
//        // describe the bundle
//        let bundle = Bundle.main
//        // access the song
//        guard let sound = bundle.path(forResource: "Ram", ofType: "mp3") else { return }
//        // check this sound with audioPlayer
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
//            print("sound found")
//        } catch {
//            print("sound not found")
//        }
//    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
       // soundFiles()
        // play the song
        
        if self.audioPlayer.isPlaying {
            self.audioPlayer.pause()
            playBGutton.setTitle("Resume", for: .normal)
            songStatusLabel.text="The song is paused"
        } else {
            self.audioPlayer.play()
            playBGutton.setTitle("Pause", for: .normal)
            songStatusLabel.text="The song is Playing..."
        }
        
    }
    
    func playSong(named fileName: String){
        guard let path = Bundle.main.path(forResource: fileName, ofType: "mp3") else{
            print("Couldn't find the song!")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error while playing!")
        }
    }
    
}


