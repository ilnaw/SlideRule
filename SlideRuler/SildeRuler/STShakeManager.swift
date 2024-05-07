//
//  STShakeManager.swift
//  Stretch
//
//  Created by wl on 2023/10/11.
//

import Foundation
import CoreHaptics
import AudioToolbox
import UIKit

@available(iOS 13.0, *)
var hapticEngine: CHHapticEngine!

@objc class STShakeManager: NSObject{
    
    @objc static let manager = STShakeManager()
    
    var shakeEnable = true
    var lastKeyTime: Double = 0
    
    //MARK: public
    @objc func initHapitcEngine(){
        do {
            if #available(iOS 13.0, *) {
                hapticEngine = try CHHapticEngine()
            }
        }catch{
            
        }
    }
    
    @objc func doCHHapticTransient(keyTime:Double){
        if keyTime != lastKeyTime {
            lastKeyTime = keyTime
            if supportCHHaptic(){
                doCHHapticTransient()
            }else{
                shake()
            }
        }
    }
    
    @objc func doCHHapticTransientHeavy(){
        if supportCHHaptic(){
            doCHHapticTransient(intensity: 1.5,
                                sharpness: 1)
        }else{
            shake(heavy: true)
        }
    }
    
    //MARK: private
    private func shake(heavy: Bool = false) {
       let model = UIDevice.current.modelID
       if let e = model.firstIndex(of: "e"),
          let sperator = model.firstIndex(of: ","){
           var num = model[e..<sperator]
           num = num.suffix(num.count - 1)
           //iPhone7 以后支持新震动
           if Int(num) ?? 0 >= 9 {
               let impact = UIImpactFeedbackGenerator(style: heavy ? .heavy : .medium)
                impact.impactOccurred()
           }else{
               AudioServicesPlaySystemSound(heavy ? 1520 : 1519);
           }

       }else{
           AudioServicesPlaySystemSound(heavy ? 1520 : 1519);
       }
    }
    
    private func doCHHapticTransient(intensity: Float = 0.5,
                                     sharpness: Float = 0.5){
        do {
            if !shakeEnable { return }
            if #available(iOS 13.0, *){

                let transientParameters = [CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                                           CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)]
                let events = [CHHapticEvent(eventType: .hapticTransient,
                                            parameters: transientParameters,
                                            relativeTime: 0)]
                let pattern = try CHHapticPattern(events: events, parameterCurves: [])


                let player = try hapticEngine.makePlayer(with: pattern)
                try hapticEngine.start()
                try player.start(atTime: CHHapticTimeImmediate)
            }
        } catch let e {
            
        }
    }
    
    private func supportCHHaptic() -> Bool{
        var deviceSupport = false
        let model = UIDevice.current.modelID
        if let e = model.firstIndex(of: "e"),
           let sperator = model.firstIndex(of: ","){
            var num = model[e..<sperator]
            num = num.suffix(num.count - 1)
            //iPhone8 以后支持CoreHaptics
            if Int(num) ?? 0 >= 10 {
                deviceSupport = true
            }
        }
        
        if #available(iOS 13.0, *){
            if deviceSupport {
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
}
