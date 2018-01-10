//
//  ViewController.swift
//  翻页book
//
//  Created by yurong on 2018/1/8.
//  Copyright © 2018年 yurong. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    //前翻页还是后翻页  true false
    var isFoward:Bool = true
    //页数
    var pageOfBook = 0{
        didSet{
            if pageOfBook == -1 {
                pageOfBook = 7
            }else if pageOfBook > 7  {
                pageOfBook = 0
            }
        }
    }

    /// 获取storyboard里面对应得控制器
    ///
    /// - Parameter name: storyboardID
    /// - Returns: BookViewController
    func getStoryboardVC(name:String) -> BookViewController {
        let vc = (storyboard?.instantiateViewController(withIdentifier: name)) as!BookViewController
        //必须有这一步 instantiateViewController还没有绘制.view的图层 这个时候self.view里面是空的 当调用.view的时候才会加载图层 这里应该用的是懒加载
        vc.view.backgroundColor = .white
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let page = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.pageCurl, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: [UIPageViewControllerOptionSpineLocationKey:NSNumber.init(value: Int8(UIPageViewControllerSpineLocation.mid.rawValue))])
        let firstVC = getStoryboardVC(name: "book")
        firstVC.bookPage = 0
        
        let secondVC = getStoryboardVC(name: "book")
        secondVC.bookPage = 1
        
        page.setViewControllers([firstVC,secondVC], direction:UIPageViewControllerNavigationDirection.forward, animated: true) { (isOK) in
            
        }
        page.isDoubleSided = true
        
        page.view.frame.size = CGSize.init(width: 300, height: 300)
        page.view.center = view.center
        
        page.dataSource = self
        page.delegate = self
        view.addSubview(page.view)
        addChildViewController(page)
        page.didMove(toParentViewController: self)
        pageOfBook = 0
    }

    
    //MARK: -UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
     
        let lastVC = viewController as!BookViewController
        pageOfBook = lastVC.bookPage
        
        pageOfBook -= 1
        
        let VC =  getStoryboardVC(name: "book")
        VC.bookPage = pageOfBook
        print(VC.bookPage)
        return VC
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        let lastVC = viewController as!BookViewController
        pageOfBook = lastVC.bookPage
        
        pageOfBook += 1
        
        let VC =  getStoryboardVC(name: "book")
        VC.bookPage = pageOfBook
        print(VC.bookPage)
        return VC
    }
    //MARK: -UIPageViewControllerDelegate
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pageViewController.view.isUserInteractionEnabled = false
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            pageViewController.view.isUserInteractionEnabled = true
        }
        if completed{
            if isFoward{
                //前翻
                
            }else{
                //后翻
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

