//
//  PageViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/3.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
	let identifierIDs = ["PageViewControllerFirst", "PageViewControllerSecond", "PageViewControllerThird"]
	var targetViewControllers: [UIViewController] = []
    override func viewDidLoad() {
		// 设置dataSource, delegate
		self.dataSource = self
		self.delegate = self
        super.viewDidLoad()
		// 设置pages
		self.targetViewControllers = []
		for id in self.identifierIDs {
			self.targetViewControllers.append((self.storyboard?.instantiateViewController(withIdentifier: id))!)
		}
		// 设置一开始显示的viewController
		setViewControllers([targetViewControllers[0]], direction: .forward, animated: true)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension PageViewController: UIPageViewControllerDataSource {
	// 设置当前页面的前一页
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		if let index = self.targetViewControllers.index(of: viewController), index > 0 {
			return self.targetViewControllers[index - 1]
		}
		return nil
	}
	// 设置当前页面的后一页
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		if let index = self.targetViewControllers.index(of: viewController), index < self.targetViewControllers.count - 1  {
			return self.targetViewControllers[index + 1]
		}
		return nil
	}

}

extension PageViewController: UIPageViewControllerDelegate {
}
