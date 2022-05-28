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
  var beforeAnswerNumber:UInt32 = 3;
  var newAnswerNumber:UInt32 = 0
  
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
//    print(newAnswerNumber)
//    print(beforeAnswerNumber)
  }
  
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    image.isHidden = false
    resultlabel.isHidden = false
    newAnswerNumber = arc4random_uniform(3)
    while(newAnswerNumber == beforeAnswerNumber){
      newAnswerNumber = arc4random_uniform(3)
    }
    beforeAnswerNumber = newAnswerNumber
    switch newAnswerNumber{
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

