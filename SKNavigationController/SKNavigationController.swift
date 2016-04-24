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

class SKNavigationController: UINavigationController, UINavigationControllerDelegate, UINavigationBarDelegate, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let m_panGR = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer!.delegate, action: NSSelectorFromString("handleNavigationTransition:"))
        m_panGR.delegate = self
        self.view.addGestureRecognizer(m_panGR)
        
        self.delegate = self
        
        self.interactivePopGestureRecognizer?.enabled = false
    }
    
    ///  MARK: - NavigationController 代理，布尔量初值设定
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        viewController.m_hasPopEvent = false
    }
    
    ///  MARK: - 手势代理
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.childViewControllers.count == 1 {
            return false
        }
        
        if topViewController is SKNavigationControllerDelegate {
            if ((topViewController?.viewControllerHasPopEvent(topViewController!)) != nil) {
                return (topViewController?.viewControllerHasPopEvent(topViewController!))!
            }
        }
        return true
    }
    
}
