//
//  ViewController.swift
//  BlurAlertControllerSample
//
//  Created by satorun on 2017/05/03.
//  Copyright © 2017年 satorun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        // Create blur effect
        let blurEffect = UIBlurEffect(style: .light)
        // Add effect to an effect view
        let visualEffectView: UIVisualEffectView? = UIVisualEffectView(effect: blurEffect)
        visualEffectView?.frame = view.frame
            if let visualEffectView = visualEffectView {
                view.addSubview(visualEffectView)
            }
        
        let alertController = UIAlertController(title: "Alert", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (_ action: UIAlertAction) -> Void in
            visualEffectView?.removeFromSuperview()
        })
        alertController.addAction(UIAlertAction(title: "Do Anything!", style: .destructive) { (_ action: UIAlertAction) -> Void in
            print("done Anything")
            visualEffectView?.removeFromSuperview()
        })
        alertController.addAction(UIAlertAction(title: "Do Anything2!", style: .default) { (_ action: UIAlertAction) -> Void in
            print("done Anything")
            visualEffectView?.removeFromSuperview()
        })


        // うまく動かない
//        let vibrancyView = vibrancyEffectView(fromBlurEffect: visualEffectView.effect as! UIBlurEffect, frame: alertController.view.frame)
//        vibrancyView.contentView.addSubview(alertController.view)
//        visualEffectView.addSubview(vibrancyView)
        //view.addSubview(alertController.view)
        
        present(alertController, animated: true, completion: { _ in })
    }
    
    // VibrancyエフェクトのViewを生成
    func vibrancyEffectView(fromBlurEffect effect: UIBlurEffect, frame: CGRect) -> UIVisualEffectView {
        let vibrancyEffect = UIVibrancyEffect(blurEffect: effect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = frame
        return vibrancyView
    }
}

