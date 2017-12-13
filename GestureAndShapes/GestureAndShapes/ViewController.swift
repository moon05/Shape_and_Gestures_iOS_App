//
//  ViewController.swift
//  GestureAndShapes
//
//  Created by Abdullah Al Mamun on 12/12/17.
//  Copyright © 2017 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet var imageView: UIImageView!
    
    let tap = UITapGestureRecognizer()
    let dTap = UITapGestureRecognizer()
    let tTap = UITapGestureRecognizer()
    let pinch = UIPinchGestureRecognizer()
    let rotate = UIRotationGestureRecognizer()
    let pan = UIPanGestureRecognizer()
    let longPress = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Single Tap
        tap.numberOfTapsRequired = 1
        tap.addTarget(self, action: #selector(ViewController.handleSingleTap))
        
        //Double Tap
        dTap.numberOfTapsRequired = 2
        dTap.addTarget(self, action: #selector(ViewController.handleDoubleTap))
        
        //Triple Tap
        tTap.numberOfTapsRequired = 3
        tTap.addTarget(self, action: #selector(ViewController.handleTripleTap))
        
        //Long Press
        longPress.addTarget(self, action: #selector(ViewController.handleLongPress(_:)))
        
        //Pan Gesture
        pan.addTarget(self, action: #selector(ViewController.handlePan(_:)))
        
        //Rotate Gesture
        rotate.addTarget(self, action: #selector(ViewController.handleRotation(_:)))
        
        //Pinch Gesture
        pinch.addTarget(self, action: #selector(ViewController.handlePinch(_:)))
        
        
        //adding all the gestures to the view
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(dTap)
        view.addGestureRecognizer(tTap)
        view.addGestureRecognizer(longPress)
        view.addGestureRecognizer(pan)
        view.addGestureRecognizer(rotate)
        view.addGestureRecognizer(pinch)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: gesture handlers
    
    //handler functions
    
    func handleSingleTap(touch: UITapGestureRecognizer){
        
        let location = touch.location(in: self.view)
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.path = makeCirclePath(location: location, radius: CGFloat(20.0))
        let color = randomColor().cgColor
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = color
        
        touch.view?.layer.addSublayer(shapeLayer)
    }
    
    func handleDoubleTap(touch: UITapGestureRecognizer){
        
        let location = touch.location(in: self.view)
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.path = makeRectPath(location: location)
        let color = randomColor().cgColor
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = color
        
        touch.view?.layer.addSublayer(shapeLayer)
    }
    
    func handleTripleTap(touch: UITapGestureRecognizer){
        
        let location = touch.location(in: self.view)
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.path = makeTrianglePath(location: location)
        let color = randomColor().cgColor
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = color
        
        touch.view?.layer.addSublayer(shapeLayer)
        
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer){
        self.view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    
    func handleRotation(_ sender: UIRotationGestureRecognizer){
        let location = sender.location(in: self.view)
        if sender.state == .began {
        }
        
        if sender.state == .changed {
            
        }
        if sender.state == .ended {
            let shapeLayer = CAShapeLayer();
            shapeLayer.path = makeFunkyShape(location: location)
            let color = randomColor().cgColor
            shapeLayer.strokeColor = color
            shapeLayer.fillColor = color
            
            sender.view?.layer.addSublayer(shapeLayer)
        }
            
        else {
        }
        
    }
    
    func handlePan(_ sender: UIGestureRecognizer){
        if sender.state == .began {
        }
        
        if sender.state == .ended {
            self.imageView.backgroundColor = UIColor.white
        }
        
        if sender.state == .changed {
            
        } else {
        }
    }
    
    @objc func handleLongPress(_ sender: UIGestureRecognizer){
        
        if sender.state == .ended {
            self.imageView.backgroundColor = randomColor()
        }
        else if sender.state == .began {
            
        }
    }
    
    // MARK: drawing functions
    
    //Drawing Functions
    
    func makeCirclePath(location: CGPoint, radius: CGFloat) -> CGPath {
        
        let center = location
        let rad = radius
        
        let circlePath = UIBezierPath(arcCenter: center, radius: rad, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        circlePath.lineWidth = 5.0
        
        return circlePath.cgPath
    }
    
    func makeRectPath(location: CGPoint) -> CGPath {
        
        let start = location
        let rect = CGRect(origin: start, size: CGSize(width: 100, height: 100))
        
        let rectPath = UIBezierPath(roundedRect: rect, cornerRadius: 0)
        
        rectPath.lineWidth = 5.0
        
        return rectPath.cgPath
    }
    
    func makeTrianglePath(location: CGPoint) -> CGPath {
        
        let path = UIBezierPath()
        path.move(to: location)
        path.addLine(to: CGPoint(x: location.x+40.0, y: location.y+40.0))
        path.addLine(to: CGPoint(x: location.x-40.0, y: location.y+40.0))
        
        path.close()
        
        return path.cgPath
    }
    
    func makeFunkyShape(location: CGPoint) -> CGPath {
        
        let start = location
        let rect = CGRect(origin: start, size: CGSize(width: 100, height: 100))
        
        let rectPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii:  CGSize(width: 30.0, height: 0.0))
        
        rectPath.lineWidth = 5.0
        
        return rectPath.cgPath
    }
    
    func makeFunkyShape2(location: CGPoint) -> CGPath {
        
        let start = location
        let rect = CGRect(origin: start, size: CGSize(width: 100, height: 100))
        
        let rectPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii:  CGSize(width: 50.0, height: 30.0))
        
        rectPath.lineWidth = 5.0
        
        return rectPath.cgPath
    }
    
    
    //For Random Color
    func randomFloat() -> Float {
        return Float(arc4random()) / Float(UINT32_MAX)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat(randomFloat()),
                       green: CGFloat(randomFloat()),
                       blue: CGFloat(randomFloat()),
                       alpha: 1.0)
    }
}
