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
    var myCollectionView:UICollectionView!
    var userInfoDelegate:UserInfo?
    var button :UIButton!
    var label:UILabel!
    
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUPButton()
        setUpCollectionView ()
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
    
    func setUpCollectionView () {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        //myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        let frame = CGRect(x: 0, y: 580, width: 400, height: 100)
        myCollectionView =  UICollectionView(frame: frame, collectionViewLayout: layout)
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        myCollectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
    }
}


extension SecondViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        myCell.myimage.image = UIImage(named: "maged")
        return myCell
    }
    
}

extension SecondViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
    
    
}
