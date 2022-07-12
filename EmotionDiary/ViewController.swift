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
        
        showAlertController()
        
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
    
    // Alert
    func showAlertController() {
        
        // 1. 흰색 바탕 만들기 + 알럿안에 글자 넣기
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2. 버튼들 선언
        // cancel style은 한 개 이상 사용 금지 -> 런타임 에러 발생
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let defaultbutton = UIAlertAction(title: "default", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let destructive = UIAlertAction(title: "destructive", style: .destructive, handler: nil)
        
        // 3. 버튼 합치기
        alert.addAction(ok)
        alert.addAction(defaultbutton)
        alert.addAction(destructive)
        alert.addAction(cancel)
        
        // 4. present
        present(alert, animated: true, completion: nil)
        
    }
    
}

