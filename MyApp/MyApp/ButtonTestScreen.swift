//
//  ButtonTestScreen.swift
//  MyApp
//
//  Created by 徐伟达 on 2017/5/9.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class ButtonTestScreen: UIViewController {
    func ok(_ sender: UIButton) {
        print("OK")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let okButton = UIButton(type: .custom)
        okButton.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        //let bkgImage = UIImage(named: "maru")
        okButton.setBackgroundImage(#imageLiteral(resourceName: "Image-2"), for: .normal)
        okButton.setImage(#imageLiteral(resourceName: "Image-1"), for: .highlighted)
        okButton.setTitle("OK", for: .normal)
        okButton.setTitleColor(UIColor.black, for: .normal)
        
        okButton.addTarget(self, action: #selector(ok(_:)), for: .touchUpInside)
        
        okButton.isHidden = false
        
        
        view.addSubview(okButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
