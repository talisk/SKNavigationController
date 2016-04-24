//
//  ViewController2.swift
//  PopEventDemo
//
//  Created by 孙恺 on 16/4/24.
//  Copyright © 2016年 sunkai. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGRWithPopEventSelectorString("popEvent")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popEvent() {
        let alertView = UIAlertView(title: "警告", message: "请问要pop么？", delegate: self, cancelButtonTitle: "No", otherButtonTitles: "Pop")
        alertView.delegate = self
        alertView.show()
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
