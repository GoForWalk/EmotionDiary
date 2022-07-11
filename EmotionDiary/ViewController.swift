//
//  ViewController.swift
//  EmotionDiary
//
//  Created by sae hun chung on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {
 
    // MARK: properties
    @IBOutlet var emotionLabels: [UILabel]!
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: setUI
    func setUI() {
        setCountLabel()
    }
    
    func setCountLabel(){
        emotionLabels.forEach {
            $0.text! += " 0"
        }
    }

    // MARK: methods
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
    
        var emotionIndex: Int = 0
        
        guard let keyword: String = sender.restorationIdentifier?.description, imageNames.contains(keyword) else { return }
        
        for (index, imageName) in imageNames.enumerated() {
            
            if imageName == keyword {
                emotionIndex = index
                emotionCounts[emotionIndex] += 1
                updateEmotionLabel(index: emotionIndex)
                return
                
            }
        }
        
    }
    
    func updateEmotionLabel(index: Int) {
        guard let text = emotionLabels[index].text,
              let textCount = text.firstIndex(of: " ") else { return }
        emotionLabels[index].text = text[text.startIndex...textCount] + "\(emotionCounts[index])"
    }
    
}

