//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Foundation


class WeatherViewController: UIViewController {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    let stormButton = UIButton()
    
    let stormView = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addImagesToSubview()
        prepareStormButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        

        sunMoonAnimation()
        backgroundAnimation()
        
    }
    
    func addImagesToSubview() {
        self.view.addSubview(sun)
        self.view.addSubview(moon)
        
        self.view.addSubview(stormView)
        stormView.isHidden = false
        stormView.alpha = 1.0
        stormView.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.frame.height * 0.6, width: self.view.frame.width * 0.5, height: self.view.frame.width * 0.5)
        stormView.isUserInteractionEnabled = false
        
        self.stormView.addSubview(cloud)
        cloud.isHidden = true
        cloud.alpha = 0.0
        cloud.frame = CGRect(x: 0, y: 0, width: stormView.frame.width, height: stormView.frame.height * 0.5)
        
        
        
        self.stormView.addSubview(lightning)
        lightning.isHidden = true
        lightning.alpha = 0.0
        lightning.frame = CGRect(x: stormView.frame.width * 0.25 , y: stormView.frame.height * 0.5, width: stormView.frame.width * 0.375, height: stormView.frame.height * 0.5)
        
    }
    
    func prepareStormButton() {
  
        stormButton.frame = CGRect(x: self.view.frame.width * 0.5 - 25, y: self.view.frame.height * 0.75, width: 50, height: 50)
        stormButton.layer.borderWidth = 5
        stormButton.layer.borderColor = UIColor.gray.cgColor
        stormButton.backgroundColor = UIColor.white
        stormButton.titleLabel?.textAlignment = .center
        stormButton.setTitle("🌩", for: .normal)
        stormButton.addTarget(self, action: #selector(stormAnimation), for: .touchUpInside)
        self.view.addSubview(stormButton)
        
    }
    
    func backgroundAnimation() {
        self.view.backgroundColor = UIColor.blue
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.calculationModeCubic, .allowUserInteraction, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.36, animations: {
                self.view.backgroundColor = UIColor.black
            })
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
        }) { (finished) in
            print("background")
        }
    }
    
    func sunMoonAnimation() {
        
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.calculationModeCubic, .allowUserInteraction, .repeat], animations: {
            self.sun.center = CGPoint(x: self.view.frame.width * 1.25, y: self.view.frame.height * 1.25)
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0.165, animations: {
                self.sun.center = CGPoint(x: self.view.frame.width * 0.5, y: self.view.frame.height * 0.25)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.17, relativeDuration: 0.165, animations: {
                self.sun.center = CGPoint(x: self.view.frame.width * -0.25, y: self.view.frame.height * 1.25)
            })
            self.moon.center = CGPoint(x: self.view.frame.width * 1.25, y: self.view.frame.height * 1.25)
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.165, animations: {
                self.moon.center = CGPoint(x: self.view.frame.width * 0.5, y: self.view.frame.height * 0.25)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.165, animations: {
                self.moon.center = CGPoint(x: self.view.frame.width * -0.25, y: self.view.frame.height * 1.25)
            })
            
        }) { (finished) in
            print("sun and moon")
        }
    }
    
    func stormAnimation() {
        
        
        self.lightningFlashes()
        UIView.animateKeyframes(withDuration: 8.0, delay: 0.0, options: [.calculationModeCubic], animations: {
            
          
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.cloud.isHidden = false
                self.cloud.alpha = 1.0
                self.stormView.center.y = self.view.center.y * 0.8
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.stormView.center.y = self.view.center.y * 1.2
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.stormView.center.y = self.view.center.y * 0.8
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.cloud.alpha = 0.0
                self.stormView.center.y = self.view.center.y * 1.2
            })
            
        }) { (finished) in
            self.cloud.isHidden = true
            print("storm done")
        }
    }
    
    func lightningFlashes() {
        UIView.animateKeyframes(withDuration: 1.0, delay: 3.0, options: .calculationModeLinear, animations: {
            
           
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.165, animations: {
                self.lightning.isHidden = false
                self.lightning.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.165, relativeDuration: 0.165, animations: {
                self.lightning.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.165, animations: {
                self.lightning.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.165, animations: {
                self.lightning.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.665, relativeDuration: 0.165, animations: {
                self.lightning.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.825, relativeDuration: 0.165, animations: {
                self.lightning.alpha = 0.0
                
            })
            }) { (finished) in
                self.lightning.isHidden = true
                print("light")
        }
    }
    
}










