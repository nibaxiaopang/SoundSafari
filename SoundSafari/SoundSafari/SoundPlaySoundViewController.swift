//
//  PlaySoundVC.swift
//  SoundSafari
//
//  Created by SoundSafari on 2024/11/22.
//


import UIKit
import AVFoundation

class SoundPlaySoundViewController: UIViewController {    
    
    @IBOutlet weak var animalTable: UITableView!
    
    var audioPlayer: AVAudioPlayer?
    
    let animalNames = [
      "Lion",
      "Tiger",
      "Elephant",
      "Giraffe",
      "Zebra",
      "Kangaroo",
      "Panda",
      "Monkey",
      "Cheetah",
      "Bear",
      "Wolf",
      "Fox",
      "Deer",
      "Leopard",
      "Crocodile",
      "Hippopotamus",
      "Rhinoceros",
      "Snake",
      "Eagle",
      "Penguin",
      "Dolphin",
      "Shark",
      "Whale",
      "Parrot",
      "Peacock",
      "Frog",
      "Rabbit",
      "Horse",
      "Turtle",
      "Owl"
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTable.dataSource = self
        animalTable.delegate = self
        
    }
    
    func playSound(soundName: String, fileType: String = "mp3") {
        guard let path = Bundle.main.path(forResource: soundName, ofType: fileType) else {
            print("Sound file not found")
            return
        }

        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error: Could not play sound. \(error.localizedDescription)")
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SoundPlaySoundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = animalTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SoundAnimalCell
        let index = animalArry[indexPath.row]
        cell.aniImg.image = UIImage(named: index.animalImg)
        cell.aniName.text = index.animalName
        cell.aniOneLine.text = index.oneLine
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSound(soundName: animalNames[indexPath.row])
    }
    
}
