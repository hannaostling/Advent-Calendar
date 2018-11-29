//
//  StartViewController.swift
//  God Jul
//
//  Created by Hanna Östling on 2018-11-29.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    @IBOutlet weak var button24: UIButton!
    
    let currentDate = Date()
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // Go to DetailViewController with correct gift from (pressedNumber-12-2018)
    @IBAction func numberPressed(_ sender: UIButton) {
        let pressedDate = getDecember2018Date(day: sender.tag)
        Model.sharedInstance.pressedDate = getDateInString(date: pressedDate)
        Model.sharedInstance.giftAtPressedDate = getGiftFromPressedDate(day: sender.tag-1)
        performSegue(withIdentifier: "fromStartToDetail", sender: nil)
    }
    
    // Setting the interface depending on today's date
    func setUI() {
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        let christmasEve2018Date = getDecember2018Date(day: 24)
        let buttons = [button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11,button12,button13,button14,button15,button16,button17,button18,button19,button20,button21,button22,button23,button24]
        if currentDate > christmasEve2018Date {
            for i in 0...23 {
                buttons[i]?.alpha = 1
                buttons[i]?.isEnabled = true
            }
        } else {
            if currentYear >= 2018 && currentMonth >= 12 {
                for i in 0...currentDay-1 {
                    buttons[i]?.alpha = 1
                    buttons[i]?.isEnabled = true
                }
            }
        }
    }
    
    // Returns a date in a string
    func getDateInString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "sv")
        formatter.dateFormat = "d MMMM yyyy"
        let dateString = formatter.string(from: date)
        let dateCapitalized = dateString.capitalized
        return dateCapitalized
    }

    //  Returns date day-12-2018
    func getDecember2018Date(day: Int) -> Date {
        dateComponents.year = 2018
        dateComponents.month = 12
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: "CET")
        let pressedDate = calendar.date(from: dateComponents)!
        return pressedDate
    }
    
    func getGiftFromPressedDate(day: Int) -> String {
        return Model.sharedInstance.gifts[day]
    }

}
