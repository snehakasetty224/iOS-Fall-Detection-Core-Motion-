//
//  ViewController.swift
//  FallDetection
//
//  Created by Sneha Kasetty Sudarshan on 10/20/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var fallLabel: UILabel!
    
    var motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startDetection(_ sender: Any) {
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!){ (data,error) in
            if let myData = data{
                
                //                print (myData.acceleration.x)
                //                print (myData.acceleration.y)
                //                print (myData.acceleration.z)
                let value = sqrt((myData.acceleration.x * myData.acceleration.x) +
                    (myData.acceleration.y * myData.acceleration.y) +
                    (myData.acceleration.z * myData.acceleration.z))
                //(a = sqrt(ax^2 + ay^2 + az^2))
                print (value)
                
                if (value > 7)
                {
                    self.fallLabel.text = " Fall Detected"
                }
                
            }
            
            
        }
        
    }
    
    @IBAction func stopDetection(_ sender: Any) {
        
        motionManager.stopAccelerometerUpdates()
        self.fallLabel.text = "none"
    }
    

    
}

