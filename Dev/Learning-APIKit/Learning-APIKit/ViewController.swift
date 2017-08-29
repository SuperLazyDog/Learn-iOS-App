//
//  ViewController.swift
//  Learning-APIKit
//
//  Created by Weida Xu on 2017/8/28.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit
import PureLayout
import APIKit

// 东京天气
//http://weather.livedoor.com/forecast/webservice/json/v1?city=130010
class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        let statusFrame = UIApplication.shared.statusBarFrame
        let statusHeight = statusFrame.height
        
        self.view.backgroundColor = UIColor.gray
        let webView = UIWebView()
        self.view.addSubview(webView)
        
        webView.autoPinEdge(toSuperviewEdge: .top, withInset: statusHeight)
        webView.autoPinEdge(toSuperviewEdge: .left)
        webView.autoPinEdge(toSuperviewEdge: .bottom)
        webView.autoPinEdge(toSuperviewEdge: .right)

        let url = URL(string: "https://github.com/ishkawa/APIKit/blob/master/Documentation/GettingStarted.md#defining-request-type")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let request = WeatherAPI.GetWeatherRequest()
        
        Session.send(request) { result in
            switch result {
            case .success(let weather):
                // Type of `rateLimit` is inferred as `RateLimit`,
                // which is also known as `RateLimitRequest.Response`.
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print(weather)
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                
            case .failure(let error):
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("error: \(error)")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
                print("----------------------------------------------")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

