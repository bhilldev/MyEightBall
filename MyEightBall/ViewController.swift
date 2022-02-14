//
//  ViewController.swift
//  MyEightBall
//
//  Created by Brandon Hill on 2/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outerCircle: UIView!
    @IBOutlet weak var innerCircle: UIView!
    
    @IBOutlet weak var textTriangle: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    let magicText = ["It is certain", "Most likely", "Ask again later", "Don't count on it"]
    
    let shape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outerCircle.layer.masksToBounds = true
        outerCircle.layer.cornerRadius = outerCircle.bounds.width / 2
        
        innerCircle.layer.masksToBounds = true
        innerCircle.layer.cornerRadius = innerCircle.bounds.width / 2
        textField.backgroundColor = UIColor.blue.withAlphaComponent(0)
        shape.fillColor = UIColor.blue.cgColor
//        textTriangle.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.setUpTriangle()
    }
    func setUpTriangle(){
        let heightWidth = textTriangle.frame.size.width
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 0, y: 3*heightWidth/4))
        //top
        path.addLine(to: CGPoint(x:heightWidth/2, y: 0))
        //right bottom
        path.addLine(to: CGPoint(x:heightWidth, y:3*heightWidth/4))
        
        //left bottom
        path.addLine(to: CGPoint(x:0, y:3*heightWidth/4))
        
        
        shape.path = path
        
        shape.fillColor = UIColor.blue.cgColor
        
        textTriangle.layer.insertSublayer(shape, at: 0)
    }
    
    
    @IBAction func answerQuestion(_ sender: UIButton) {
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 1
        fadeOut.toValue = 0
        fadeOut.duration = 2
        shape.add(fadeOut, forKey: "fadeOut")
        
        //Change text after 2 seconds. Otherwise it will run immediately when button is pressed
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.textField.text = self.magicText.randomElement()
        }
        
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.beginTime = CACurrentMediaTime() + 2
        fadeIn.fromValue = 0
        fadeIn.toValue = 1
        fadeIn.duration = 3
        self.shape.add(fadeIn, forKey: "fadeIn")
        
        

        
            
        

    }

}
