//
//  UubeeSheetAlert.swift
//  ULife
//
//  Created by ashen on 16/10/13.
//  Copyright © 2016年 Ashen<http://www.devashen.com>. All rights reserved.
//

import UIKit

typealias callbackfunc=(selectIndex:Int)->Void

class ASSheetAlert: UIView {

    var bgkView:UIView! = nil
    var size:CGSize! = nil
    
    var selectIndex = callbackfunc?()
    
    init(frame: CGRect, titles:NSArray) {
        super.init(frame: frame)
        size = UIScreen.mainScreen().bounds.size
        self.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        let tap = UITapGestureRecognizer(target: self, action: #selector(hiddenSheet))
        self.addGestureRecognizer(tap)
        makeBaseUIWithTitles(titles)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func makeBaseUIWithTitles(titles:NSArray) {
        
        bgkView = UIView.init(frame: CGRectMake(0, size.height, size.width, CGFloat(titles.count) * 50 + 55))
        bgkView.backgroundColor = UIColor(hex: "e9e9e9")
        self.addSubview(bgkView)
        
        var y = self.createBtnWithTitle("取消", origin_y: bgkView.frame.size.height - 50, tag: -1) - 55
        for i in 0..<titles.count {
            y = self.createBtnWithTitle(titles[i] as! String, origin_y: y, tag: i)
        }
        
        UIView.animateWithDuration(0.3) { 
            var frame = self.bgkView.frame
            frame.origin.y -= frame.size.height
            self.bgkView.frame = frame
        }
    }
    
    func createBtnWithTitle(title:String, origin_y:CGFloat, tag:NSInteger) -> CGFloat{
        let btn = UIButton(type: .Custom)
        btn.setTitle(title, forState: .Normal)
        btn.frame = CGRectMake(0, origin_y, size.width, 50)
        btn.backgroundColor = UIColor.whiteColor()
        btn.tag = tag
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(click(_:)), forControlEvents: .TouchUpInside)
        bgkView.addSubview(btn)
        var y = origin_y
        y -= tag == -1 ? 0 : 50.4
        return y
        
    }
    
    func click(sender:UIButton) {
        if (selectIndex != nil) {
            selectIndex!(selectIndex: sender.tag)
        }
    }
    
    
    func hiddenSheet() {
        UIView.animateWithDuration(0.3) { 
            var frame = self.bgkView.frame
            frame.origin.y += frame.size.height
            self.bgkView.frame = frame
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
        
    }
    
}
