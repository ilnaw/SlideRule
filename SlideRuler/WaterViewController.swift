//
//  WaterViewController.swift
//  SlideRuler
//
//  Created by wl on 2024/5/11.
//

import Foundation

class WaterViewController: UIViewController{
    
    var wave_1: CLWaterWaveView!
    var wave_2: CLWaterWaveView!
    var progress = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let bg = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        bg.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        view.addSubview(bg)
        
        wave_1 = CLWaterWaveView(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        wave_1.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        wave_1.amplitude = 12
        wave_1.speed = 0.02
        wave_1.angularVelocity = 1
        wave_1.depth = progress
        
        view.addSubview(wave_1)

        wave_1.startAnimation()
        
        wave_2 = CLWaterWaveView(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        wave_2.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        wave_2.amplitude = 10
        wave_2.speed = 0.03
        wave_2.angularVelocity = 0.8
        wave_2.depth = progress

        view.addSubview(wave_2)
        wave_2.startAnimation()
        
        let button = UIButton(type: .system)
        button.setTitle("Drink", for: .normal)
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        view.addSubview(button)
        button.frame = CGRect(x: 200, y: 400, width: 100, height: 40)
    }
    
    var displayLink: CADisplayLink?
    
    @objc func start() {
        progress += 0.2
        if displayLink == nil {
            displayLink = CADisplayLink(target: self, selector: #selector(waveHeight))
            displayLink?.add(to: .main, forMode: .default)
        }
    }

    @objc func waveHeight(){
        self.wave_1.depth += 0.01
        self.wave_2.depth += 0.01
        if self.wave_1.depth >= progress{
            displayLink?.isPaused = true
            displayLink?.invalidate()
            displayLink = nil
        }
    }
}
