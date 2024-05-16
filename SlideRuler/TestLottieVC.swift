//
//  TestLottieVC.swift
//  Stretch
//
//  Created by wl on 2024/3/12.
//

import Foundation
import Lottie
import SnapKit

class TestLottieVC: UIViewController{
    
    var animationView: LottieAnimationView!
    var provider: JFLottieImageProvider!
    var names = [
        "bird-avatar-act-center-1",
        "bird-avatar-act-center-2",
        "bird-avatar-act-center-3",
        "bird-avatar-act-down-1",
        "bird-avatar-act-left-1",
        "bird-avatar-act-right-1",
        "bird-avatar-act-up-1",
        "bird-card-peeking-act-1",
        "bird-card-peeking-act-2",
        "CMP_Cat_01",
        "CMP_Cloud_01",
        "CMP_Droplet_01",
        "CMP_Flower_01",
        "CMP_Fruit_01",
        "CMP_Jelly_01",
        "CMP_Star_01",
        "CMP_Worm_01",
        "Effects_Solo_Bubbles_01",
        "Effects_Solo_Confetti_01",
        "Effects_Solo_Fireworks_01",
        "CB01_Full_03.1_Naked"
    ]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        animationView = LottieAnimationView(name: "Test")
        animationView.animation = LottieAnimation.named("data")
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        animationView.play { finish in
            
        }

        let path = Bundle.main.path(forResource: "data", ofType: "json")!
        let filePath = URL(fileURLWithPath: path).deletingLastPathComponent().path
        provider = JFLottieImageProvider(filepath: filePath)
        
        animationView.imageProvider = provider
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            print(self.animationView.logHierarchyKeypaths())
//        }
        
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func nextAction(){
        
        let image = UIImage(named: "toushihou3")
        let image2 = UIImage(named: "toushiqian3")
        provider.refreshImageReplacement(imageReplacement: ["toushihou.png":image!,"toushiqian.png":image2!])
        animationView.imageProvider =  provider
        animationView.reloadImages()
        
//        let image2 = UIImage(named: "toushiqian2")
//        provider.refreshImageReplacement(imageReplacement: ["toushiqian":image2!])
//        animationView.imageProvider =  provider
//        animationView.reloadImages()
//        index += 1
//        let name = names[index]
//        animationView.animation = LottieAnimation.named("ConfettiPiece_Color2_01")
//        animationView.play { finish in
//
//        }
        
//        let fillKeypath = AnimationKeypath(keypath: "形状图层1#bang.矩形 1.填充 1.Color")
////         let subview = AnimationSubview()
////        let custom = LottieAnimationView(name: "Test")
////        custom.animation = LottieAnimation.named("CB01_HeadEffects_(S)_01")
////        custom.play()
////        subview.addSubview(custom)
////        animationView.addSubview(subview, forLayerAt: fillKeypath)
//
//        let redValueProvider = ColorValueProvider(LottieColor(r: 1, g: 0.2, b: 0.2, a: 1))
//
//        /// Set the provider on the animationView.
//        animationView.setValueProvider(redValueProvider, keypath: fillKeypath)
        
    }
}
