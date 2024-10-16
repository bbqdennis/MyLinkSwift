//
//  ViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 8/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: GO View Controller
    
    func goSampleViewControlller() {
        
        let aSampleViewController = SampleViewController()
        
        let window = UIApplication.shared.windows.first!
        window.rootViewController = aSampleViewController
    }
    
    func goSampleListViewController() {
        
        let aSampleListViewController = SampleListViewController()
        
        let window = UIApplication.shared.windows.first!
        window.rootViewController = aSampleListViewController
    }
    
    func goValueAddedRecordViewController() {
        
        let aValueAddedRecordViewController = CMHKValueAddedRecordViewController()
        let aNavigationController = UINavigationController(rootViewController: aValueAddedRecordViewController)
        
        let window = UIApplication.shared.windows.first!
        window.rootViewController = aNavigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //goSampleViewControlller()
        //goSampleListViewController()
        goValueAddedRecordViewController()
//        view.layerView.frame = CGRect(x: 24, y: 381, width: 327, height: 48)
        
    }
}

