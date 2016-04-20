//
//  ViewController.swift
//  TestUIBezier
//
//  Created by 薛焱 on 16/3/23.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    var layer:CAShapeLayer = CAShapeLayer()
    
    var beganPoint: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        //填充颜色
        layer.fillColor = UIColor.orangeColor().CGColor
        view.layer.addSublayer(layer)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        beganPoint = touch.locationInView(view)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let currentPoint = touch.locationInView(view)
        var pointY = currentPoint.y - beganPoint.y
        //如果y轴移动的距离大于100就让他等于100，不让无限拉伸
        if pointY > 100 {
            pointY = 100
        }else{
            pointY = currentPoint.y - beganPoint.y
        }
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 100))
        
        path.addQuadCurveToPoint(CGPoint(x: UIScreen.mainScreen().bounds.size.width, y: 100), controlPoint: CGPoint(x: currentPoint.x, y: 100 + pointY))
        layer.path = path.CGPath
        
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let path = UIBezierPath()
        layer.path = path.CGPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

