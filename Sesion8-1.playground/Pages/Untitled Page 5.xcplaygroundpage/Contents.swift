//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0))

let square = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))

square.center = containerView.center
square.layer.cornerRadius = 20.0
square.backgroundColor = .white

containerView.addSubview(square)

square.alpha = 1

UIView.animate(withDuration: 1.0, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3, options: .curveEaseIn, animations: {
    
    square.alpha = 0
    
}, completion: nil)


PlaygroundPage.current.liveView = containerView

//: [Next](@next)
