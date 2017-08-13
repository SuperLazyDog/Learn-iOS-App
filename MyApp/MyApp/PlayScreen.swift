//
//  PlayScreen.swift
//  MyApp
//
//  Created by 徐伟达 on 2017/5/3.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit
import CoreImage

class PlayScreen: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstBut(_ sender: Any) {
        print("test")
        let uuid = UUID()
        print(uuid)
        let test = CIFilter(name: "CIQRCodeGenerator")
        test?.setDefaults()
        test?.setValue("\(UUID())".data(using: .utf8), forKey: "inputMessage")
        //test?.setValue("我爱音音✌️😳✌️".data(using: .utf8), forKey: "inputMessage")
        /*let data = NSData(base64Encoded: "hellow", options: .ignoreUnknownCharacters)
        test?.setValue(data, forKey: "test")*/
        test?.setValue("搜一搜我就可以瘦二十斤".data(using: .utf8), forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 8, y: 8)
        let image = test?.outputImage?.applying(transform)
        let outputUIimage = UIImage(ciImage: image!)
        imageView.image = outputUIimage
        leftImage.isHidden = false
        rightImage.isHidden = false
    }
    @IBAction func secondBut(_ sender: Any) {
        imageView.image = nil
        leftImage.isHidden = true
        rightImage.isHidden = true
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
