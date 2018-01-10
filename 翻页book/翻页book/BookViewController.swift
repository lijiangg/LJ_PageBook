//
//  BookViewController.swift
//  翻页book
//
//  Created by yurong on 2018/1/8.
//  Copyright © 2018年 yurong. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var bookImageView: UIImageView?
    
    
    var imageArray: [String] = {
        return ["image0.jpg","image1.jpg","image2.jpg","image3.jpg","image4.jpeg","image5.jpeg","image6.jpeg","image7.jpeg","image8.jpeg"]
    }()
    
    var bookPage = 0{
        
        didSet{
            bookImageView?.image = UIImage.init(named: imageArray[bookPage])
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
