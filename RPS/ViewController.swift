//
//  ViewController.swift
//  RPS
//
//  Created by Makoto Miyahara on 2022/05/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate  {
  
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var resultlabel: UILabel!
  
  var jankenponPlayer:AVAudioPlayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let audioPath = Bundle.main.path(forResource: "jankenpon", ofType:"mp3")!
    let jankenponUrl = URL(fileURLWithPath: audioPath)
    
    do{
           jankenponPlayer = try AVAudioPlayer(contentsOf: jankenponUrl)
    } catch let error as NSError {
           print(error.code)
    }
    jankenponPlayer.delegate = self
  }
  
  @IBAction func button(_ sender: UIButton) {
    label.isHidden = true
    resultlabel.isHidden = true
    image.isHidden = true
    jankenponPlayer.play()
  }
  
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    image.isHidden = false
    resultlabel.isHidden = false
    var newAnserNumber:UInt32 = 0
    newAnserNumber=arc4random_uniform(3)
    switch newAnserNumber{
      case 0:
        image.image = UIImage(named: "gu")
        resultlabel.text = "グー"
      case 1:
        image.image = UIImage(named: "choki")
        resultlabel.text = "チョキ"
      case 2:
        image.image = UIImage(named: "pa")
        resultlabel.text = "パー"
      default: break
    }
  }
}

