//
//  SecondViewController.swift
//  1-passingDataUsingproperty
//
//  Created by s on 04/02/2022.
//

import UIKit
protocol UserInfo {
    func userInfo(name:String,age:Int,color:UIColor)
}

class SecondViewController: UIViewController {
    var userInfoDelegate:UserInfo?
    var button :UIButton!
    var label:UILabel!
    
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUPButton()
        label.text = name
       
        // Do any additional setup after loading the view.
    }
    
    func setUpLabel(){
         label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 90))
          
          label.textAlignment = .center
          label.text = "I'm a test label"
          label.numberOfLines = 0

          self.view.addSubview(label)
    }
    func setUPButton() {
        button = UIButton(frame: CGRect(x: 100,y: 300,width: 200,height: 60))
        button.setTitle("Test2",for: .normal)
        button.setTitleColor(.systemBlue,for: .normal)
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc
    func buttonAction() {
        print("Button pressed")
        userInfoDelegate?.userInfo(name: "maged mohammed", age: 30, color: .green)
        dismiss(animated: true, completion: nil)
    }
}

