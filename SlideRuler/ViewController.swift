//
//  ViewController.swift
//  SlideRuler
//
//  Created by wl on 2024/5/7.
//

import UIKit

extension ViewController: RulerViewDelegate {
    func rulerSelectValue(_ value: Double, tag: Int) {
        
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        setupRulerH()
        setupRulerV()
    }
    
    func setupRulerH(){
        let hRuler = RulerView.init(frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.size.width - 40, height: 200))
        hRuler.backgroundColor = .clear
        hRuler.delegate = self
        
        let config = RulerConfig()
        config.inches = true;
        //刻度高度
        config.shortScaleLength = 20
        config.longScaleLength = 40
        //刻度宽度
        config.scaleWidth = 1
        //刻度起始位置
        config.shortScaleStart = 80 //x位置
        config.longScaleStart = 70 //x位置
        //刻度颜色
        config.scaleColor = UIColor.gray
        //刻度之间的距离
        config.distanceBetweenScale = 10
        //刻度距离数字的距离
        config.distanceFromScaleToNumber = 20
        //指示视图属性设置
        config.pointSize = CGSizeMake(4, 40)
        config.pointColor = UIColor.black
        //        config.pointColor = .red
        
        config.pointStart = 70
        //文字属性
        config.numberFont = .systemFont(ofSize: 11)
        config.numberColor = UIColor.gray
        config.selectFont = .systemFont(ofSize: 18, weight: .medium)
        config.selectColor = UIColor.black
        
        //数字所在位置方向
        config.numberDirection = .numberBottom;
        
        //取值范围
        config.max = 8;
        config.min = 3;
        //默认值
        config.defaultNumber = 4;
        //使用小数类型
        config.isDecimal = true;
        //选中
        config.selectionEnable = true;
        //数字顺序相反
        config.reverse = false;
        config.infiniteLoop = false;
        
        hRuler.rulerConfig = config;
        
        self.view.addSubview(hRuler)
    }
    
    func setupRulerV(){
        let hRuler = RulerView.init(frame: CGRect(x: 100, y: 400, width: 200, height: 400))
        hRuler.backgroundColor = .clear
        hRuler.delegate = self
        
        let config = RulerConfig()
//        config.inches = false;
        //刻度高度
        config.shortScaleLength = 17
        config.longScaleLength = 23
        //刻度宽度
        config.scaleWidth = 1
        //刻度起始位置
        config.shortScaleStart = 80 //x位置
        config.longScaleStart = 74 //x位置
        //刻度颜色
        config.scaleColor = UIColor.gray
        //刻度之间的距离
        config.distanceBetweenScale = 5
        //刻度距离数字的距离
        config.distanceFromScaleToNumber = 13
        //指示视图属性设置
        config.pointSize = CGSizeMake(1.5, 30)
        config.pointColor = UIColor.black
        //        config.pointColor = .red
        
        config.pointStart = 65
        //文字属性
        config.numberFont = .systemFont(ofSize: 11)
        config.numberColor = UIColor.gray
        config.selectFont = .systemFont(ofSize: 18, weight: .medium)
        config.selectColor = UIColor.black
        
        //数字所在位置方向
        config.numberDirection = .numberLeft;
        
        //取值范围
        config.max = 230;
        config.min = 10;
        //默认值
        config.defaultNumber = 160.0;
        //使用小数类型
        config.isDecimal = false;
        //选中
        config.selectionEnable = true;
        //数字顺序相反
        config.reverse = true;
        config.infiniteLoop = false;
        
        hRuler.rulerConfig = config;
        
        self.view.addSubview(hRuler)
    }
}

