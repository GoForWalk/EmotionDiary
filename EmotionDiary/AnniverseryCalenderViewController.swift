//
//  AnniverseryCalenderViewController.swift
//  EmotionDiary
//
//  Created by sae hun chung on 2022/07/13.
//

import UIKit

class AnniverseryCalenderViewController: UIViewController {
    
    @IBOutlet var opacityViews: [UIView]!
    @IBOutlet var imageSuperViews: [UIView]!
    @IBOutlet var imageViews: [UIImageView]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        setimageSuperViews()
        setImageView()
        setOpacityViews()
    }
        
    func setImageView() {
        imageViews.forEach {
            $0.backgroundColor = UIColor.purple

            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true

        }
    }
    
    func setimageSuperViews() {
        imageSuperViews.forEach {

            $0.layer.shadowRadius = 8
            $0.layer.shadowOpacity = 1
            $0.layer.shadowColor = UIColor.darkGray.cgColor
            $0.layer.shadowOffset = CGSize(width: 1, height: 1)

            $0.backgroundColor = UIColor.white.withAlphaComponent(0)
        

        }
    }

    func setOpacityViews() {
        opacityViews.forEach {
            $0.backgroundColor = UIColor.lightGray
                .withAlphaComponent(0.4)
            
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        
    }
    
    func setDateLabel() {
        
    }
    
    func setDateString() {
        
    }
}
