//
//  First14ViewController.swift
//  MyApp
//
//  Created by Weida Xu on 2017/8/16.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class First14ViewController: UIViewController {

    @IBOutlet weak var areaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeColor(_ sender: UIButton, forEvent event: UIEvent) {
        areaView.backgroundColor = UIColor.red
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func close(segue:UIStoryboardSegue){
        //
    }

}
