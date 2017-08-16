//
//  Third14ViewController.swift
//  MyApp
//
//  Created by Weida Xu on 2017/8/16.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit

class Third14ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goto2Button(_ sender: UIButton, forEvent event: UIEvent) {
        let target = First14ViewController()
        self.present(target, animated: true, completion: nil)
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
