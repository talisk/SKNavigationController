//
//  SKNavigationController.swift
//  PopEventDemo
//
//  Created by 孙恺 on 16/4/19.
//  Copyright © 2016年 sunkai. All rights reserved.
//  http://www.talisk.cn/
//  https://github.com/talisk
//

import UIKit

class SKNavigationController: UINavigationController, UINavigationBarDelegate, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let m_panGR = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer!.delegate, action: NSSelectorFromString("handleNavigationTransition:"))
        m_panGR.delegate = self
        self.view.addGestureRecognizer(m_panGR)
        
        self.interactivePopGestureRecognizer?.enabled = false
    }
    
    ///  MARK: - 手势代理
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.childViewControllers.count == 1 {
            return false
        }
        
        if topViewController is SKNavigationControllerDelegate {
            topViewController?.viewControllerHasPopEvent(topViewController!)
//        if self {
            return false
        }
        return true
    }
    
}
