//
//  RippleView.swift
//  SlideRuler
//
//  Created by wl on 2024/5/14.
//

import Foundation
import UIKit
import CoreMotion


class RippleView: UIView {
    private let rippleLayer = CAShapeLayer()
    private var animationGroup = CAAnimationGroup()
    private let motionManager = CMMotionManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRipple()
        setupMotion()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupRipple()
        setupMotion()
    }
    
    private func setupRipple() {
        let rippleRadius = min(bounds.width, bounds.height) / 2
        let ripplePath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: rippleRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        rippleLayer.fillColor = UIColor.clear.cgColor
        rippleLayer.strokeColor = UIColor.blue.cgColor
        rippleLayer.lineWidth = 3.0
        rippleLayer.bounds = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        rippleLayer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        rippleLayer.path = ripplePath.cgPath
        layer.addSublayer(rippleLayer)
    }
    
    private func setupMotion() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { [weak self] (data, error) in
                guard let acceleration = data?.acceleration else { return }
                self?.updateRippleWithGravity(acceleration)
            }
        }
    }
    
    private func updateRippleWithGravity(_ acceleration: CMAcceleration) {
        let x = CGFloat(acceleration.x)
        let y = CGFloat(acceleration.y)
        
        let angle = atan2(y, x)
        let scale = sqrt(x * x + y * y)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber(value: angle)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = NSNumber(value: scale * 0.5)
        
        animationGroup.animations = [animation, scaleAnimation]
        animationGroup.duration = 0.1
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        rippleLayer.add(animationGroup, forKey: "gravityAnimation")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animateRipple()
    }
    
    private func animateRipple() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = NSNumber(value: 0.0)
        animation.toValue = NSNumber(value: 1.5)
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = NSNumber(value: 1.0)
        opacityAnimation.toValue = NSNumber(value: 0.0)
        
        animationGroup.animations = [animation, opacityAnimation]
        animationGroup.duration = 0.5
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        rippleLayer.add(animationGroup, forKey: "rippleAnimation")
    }
    
    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}
