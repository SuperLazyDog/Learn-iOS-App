//
//  ImagePickerControllerViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/3.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class ImagePickerControllerViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView! // image view
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func chooseImage(_ sender: UIButton) { // 选择图象
		let picker = UIImagePickerController.init()
		picker.delegate = self
		picker.sourceType = .photoLibrary
		present(picker, animated: true, completion: nil)
	}
	
}

extension ImagePickerControllerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
		dismiss(animated: true, completion: nil)
	}
}
