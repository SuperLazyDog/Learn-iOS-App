//
//  ViewController.swift
//  PureLayout-Demo
//
//  Created by Weida Xu on 2017/8/21.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

import PureLayout


//------------------------------------------------------------------------------
//                       PureLayout 学习
//------------------------------------------------------------------------------
// 参考网页： http://www.cnblogs.com/zhouxihi/p/6557472.html

//
//  ViewController.m
//  PureLayoutDemo
//
//  Created by Jackey on 2017/3/15.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

//#import <PureLayout.h>
//
//#import "ViewController.h"
//
//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    
//    //蓝色view位于中心, 大小是50pt
//    UIView *blueView = [[UIView alloc] init];
//    [blueView setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:blueView];    //注意要先添加到父件上, 再调整
//    
//    //设置在父件中心
//    [blueView autoCenterInSuperview];
//    //设置大小
//    [blueView autoSetDimensionsToSize:CGSizeMake(50.0, 50.0)];
//    
//    
//    
//    
//    //红色view顶部与蓝色view底部位置一样, 左边与蓝色的右边一样, 宽度跟蓝色view一样, 高度40pt
//    UIView *redView = [[UIView alloc] init];
//    [redView setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:redView];
//    
//    //设置红色view顶部跟蓝色view的底部对齐
//    [redView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:blueView];
//    
//    //设置红色view的左边跟蓝色view的右边对齐
//    [redView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:blueView];
//    
//    //设置红色view的宽度跟蓝色view的宽度一致
//    [redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:blueView];
//    
//    //设置红色view的高度为40
//    [redView autoSetDimension:ALDimensionHeight toSize:40.0];
//    
//    
//    
//    
//    
//    //黄色view的顶部跟红色view的底部+10pt位置一致, 高度为25pt, 左右距父控件均为20pt
//    UIView *yellowView = [[UIView alloc] init];
//    [yellowView setBackgroundColor:[UIColor yellowColor]];
//    [self.view addSubview:yellowView];
//    
//    //设置黄色view的顶部高度距离红色view底部10
//    [yellowView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:redView withOffset:10.0];
//    
//    //设置黄色view的高度25
//    [yellowView autoSetDimension:ALDimensionHeight toSize:25.0];
//    
//    //设置黄色view左边距离父件左边20
//    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
//    
//    //设置黄色view的右边距离父件右边20
//    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];
//    
//    
//    
//    
//    //绿色view的顶部与黄色view的底部间距10, 与父view垂直居中, 高度是黄色view高度的两倍, 宽度是150
//    UIView *greenView = [[UIView alloc] init];
//    [greenView setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:greenView];
//    
//    //设置绿色view顶部高度距离黄色view底部10
//    [greenView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:yellowView withOffset:10.0];
//    
//    //设置绿色view在父件垂直中心线上
//    [greenView autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
//    
//    //设置绿色view高度是黄色view高度的2倍
//    [greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:yellowView withMultiplier:2.0];
//    
//    //设置绿色view宽度为150
//    [greenView autoSetDimension:ALDimensionWidth toSize:150.0];
//    }
//    
//    
//    - (void)didReceiveMemoryWarning {
//        [super didReceiveMemoryWarning];
//        // Dispose of any resources that can be recreated.
//}
//
//
//@end
class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
        //----------------------------------------------------------------------
        //                              测试 1
        //----------------------------------------------------------------------
        //    //蓝色view位于中心, 大小是50pt
        //    UIView *blueView = [[UIView alloc] init];
        //    [blueView setBackgroundColor:[UIColor blueColor]];
        //    [self.view addSubview:blueView];    //注意要先添加到父件上, 再调整
        //
        //    //设置在父件中心
        //    [blueView autoCenterInSuperview];
        //    //设置大小
        //    [blueView autoSetDimensionsToSize:CGSizeMake(50.0, 50.0)];

        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
        blueView.autoCenterInSuperview()
        blueView.autoSetDimensions(to: CGSize(width: 50, height: 50))
        
        
        
        //----------------------------------------------------------------------
        //                              测试 2
        //----------------------------------------------------------------------
        //    //红色view顶部与蓝色view底部位置一样, 左边与蓝色的右边一样, 宽度跟蓝色view一样, 高度40pt
        //      ---
        //      | | h = 50
        //      --- ---
        //          | | h = 40
        //          ---
        //    UIView *redView = [[UIView alloc] init];
        //    [redView setBackgroundColor:[UIColor redColor]];
        //    [self.view addSubview:redView];
        //
        //    //设置红色view顶部跟蓝色view的底部对齐
        //    [redView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:blueView];
        //
        //    //设置红色view的左边跟蓝色view的右边对齐
        //    [redView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:blueView];
        //
        //    //设置红色view的宽度跟蓝色view的宽度一致
        //    [redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:blueView];
        //    
        //    //设置红色view的高度为40
        //    [redView autoSetDimension:ALDimensionHeight toSize:40.0];
        //
        
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        redView.autoPinEdge(.top, to: .bottom, of: blueView)
        redView.autoPinEdge(.left, to: .right, of: blueView)
        redView.autoMatch(.width, to: .width, of: blueView)
        redView.autoSetDimension(.height, toSize: 40)
        
     
        //----------------------------------------------------------------------
        //                              测试 3
        //----------------------------------------------------------------------
        //    //黄色view的顶部跟红色view的底部+10pt位置一致, 高度为25pt, 左右距父控件均为20pt
        //      ---
        //      | | h = 50
        //      --- ---
        //          | | h = 40
        //          ---
        //   ---------------------------
        //   |                         |  h = 25
        //   ---------------------------
        //    UIView *yellowView = [[UIView alloc] init];
        //    [yellowView setBackgroundColor:[UIColor yellowColor]];
        //    [self.view addSubview:yellowView];
        //
        //    //设置黄色view的顶部高度距离红色view底部10
        //    [yellowView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:redView withOffset:10.0];
        //
        //    //设置黄色view的高度25
        //    [yellowView autoSetDimension:ALDimensionHeight toSize:25.0];
        //
        //    //设置黄色view左边距离父件左边20
        //    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
        //
        //    //设置黄色view的右边距离父件右边20
        //    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        self.view.addSubview(yellowView)
        yellowView.autoPinEdge(.top, to: .bottom, of: redView, withOffset: 10)
        yellowView.autoSetDimension(.height, toSize: 25)
        yellowView.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        yellowView.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        
        
        //----------------------------------------------------------------------
        //                              测试 4
        //----------------------------------------------------------------------
        //    //绿色view的顶部与黄色view的底部间距10, 与父view垂直居中, 高度是黄色view高度的两倍, 宽度是150
        //    UIView *greenView = [[UIView alloc] init];
        //    [greenView setBackgroundColor:[UIColor greenColor]];
        //    [self.view addSubview:greenView];
        //
        //    //设置绿色view顶部高度距离黄色view底部10
        //    [greenView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:yellowView withOffset:10.0];
        //
        //    //设置绿色view在父件垂直中心线上
        //    [greenView autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
        //
        //    //设置绿色view高度是黄色view高度的2倍
        //    [greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:yellowView withMultiplier:2.0];
        //
        //    //设置绿色view宽度为150
        //    [greenView autoSetDimension:ALDimensionWidth toSize:150.0];
        //    }
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.autoPinEdge(.top, to: .bottom, of: yellowView, withOffset: 10)
        greenView.autoAlignAxis(toSuperviewAxis: .vertical)
        greenView.autoMatch(.height, to: .height, of: yellowView, withMultiplier: 2.0)
        greenView.autoSetDimension(.width, toSize: 150)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

