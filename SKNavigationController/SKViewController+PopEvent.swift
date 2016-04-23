//
//  SKViewController+PopEvent.swift
//  PopEventDemo
//
//  Created by 孙恺 on 16/4/20.
//  Copyright © 2016年 sunkai. All rights reserved.
//  http://www.talisk.cn/
//  https://github.com/talisk
//

import UIKit
import ObjectiveC

public protocol SKNavigationControllerDelegate {
    func viewControllerHasPopEvent(viewController: UIViewController) -> Bool
}

extension UIViewController: SKNavigationControllerDelegate {
    
    ///  为VC添加带有自定义回调的手势
    ///
    ///  - parameter selectorString: 回调方法名
    func addGRWithPopEventSelectorString(selectorString: String) {
        
        self.m_hasPopEvent = true
        
        let m_edgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: NSSelectorFromString("edgePanGRdidRecognizeWithPopEventSelectorString:"))
        m_edgePanGR.edges = .Left
        m_edgePanGR.m_selectorString = selectorString
        self.view.addGestureRecognizer(m_edgePanGR)
        
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
    }
    
    public func viewControllerHasPopEvent(viewController: UIViewController) -> Bool {
        return self.m_hasPopEvent
    }
    
    ///  自定义pop手势的回调
    ///
    ///  - parameter sender: pop手势
    public func edgePanGRdidRecognizeWithPopEventSelectorString(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state != .Ended {
            return
        }
        
        ///  只有iOS 9支持performSelector，所以在此借用UIControl来执行selector
        let control: UIControl = UIControl()
        control.sendAction(NSSelectorFromString(sender.m_selectorString), to: self, forEvent: nil)
    }
    
    
    private struct PopEventSwitcherKeys {
        static var DescriptiveName = "_popEventSwitcher"
    }
    
    var m_hasPopEvent: Bool {
        get {
            return objc_getAssociatedObject(self, &PopEventSwitcherKeys.DescriptiveName) as! Bool
        }
        set {
            objc_setAssociatedObject(self, &PopEventSwitcherKeys.DescriptiveName, newValue as Bool, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
}

// MARK: - 手势回调方法名
extension UIGestureRecognizer {
    
    private struct SelectorStringKeys {
        static var DescriptiveName = "_selectorString"
    }
    
    var m_selectorString: String {
        get {
            return objc_getAssociatedObject(self, &SelectorStringKeys.DescriptiveName) as! String
        }
        set {
            objc_setAssociatedObject(self, &SelectorStringKeys.DescriptiveName, newValue as String, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    

}
