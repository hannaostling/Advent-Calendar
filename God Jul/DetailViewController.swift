//
//  DetailViewController.swift
//  God Jul
//
//  Created by Hanna Östling on 2018-11-29.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var giftLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = Model.sharedInstance.pressedDate
        giftLabel.text = Model.sharedInstance.giftAtPressedDate
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // Pop to rootViewController
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
