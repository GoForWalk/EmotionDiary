//
//  AnniverseryCalenderViewController.swift
//  EmotionDiary
//
//  Created by sae hun chung on 2022/07/13.
//

import UIKit

class AnniverseryCalenderViewController: UIViewController {
    
    //MARK: propertis
    @IBOutlet var opacityViews: [UIView]!
    @IBOutlet var imageSuperViews: [UIView]!
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet var dDayLabels: [UILabel]!
    @IBOutlet var dateLabels: [UILabel]!
    
    let dDays: [Int] = [0, 100, 200, 300]

    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: SetUI
    func setUI() {
        setimageSuperViews()
        setImageView()
        setOpacityViews()
        setDDayLabel()
        // 오늘을 기준으로 D-day를 보여준다.
        setUIDatePicker()
        setDateLabels(calender: Calendar.current, startDay: Date())
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
            
            // Opacity 설정
            $0.backgroundColor = UIColor.white.withAlphaComponent(0)
        }
    }

    func setOpacityViews() {
        opacityViews.forEach {
            $0.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
    }
    
    func setDDayLabel() {
        var index = 0
        
        dDays.forEach {
            dDayLabels[index].text = "D + " + String($0)
            index += 1
        }
    }
    
    func setUIDatePicker() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
    }
    
    // MARK: UIDatePicker Value Changed IBAction
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        setDateLabels(calender: sender.calendar, startDay: sender.date)
    }
    
    
    func setKorDateToSring(date: Date) -> String {
        
        let formatter = DateFormatter()
        
        formatter.locale = Locale.init(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy년 \n MM월 dd일"
        
        return formatter.string(from: date)
    }
    
    func getDday(Dday: Int, calender: Calendar, startDay: Date) -> String {
        
        guard let dDay = calender.date(byAdding: DateComponents(day: Dday), to: startDay) else { return "에러발생!!" }
        return setKorDateToSring(date: dDay)
    }
    
    func setDateLabels (calender: Calendar, startDay: Date) {
        
        var index = 0
        dDays.forEach { dDay in
            dateLabels[index].text = getDday(Dday: dDay, calender: calender, startDay: startDay)
            index += 1
        }
    }
    
}

