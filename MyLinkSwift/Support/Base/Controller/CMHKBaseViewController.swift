//
//  CMHKBaseViewController.swift
//  csapp
//
//  Created by Taiki Ko on 27/9/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

import UIKit

class CMHKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addNevigationLargeTitle(titleStr: String) {
        title = titleStr
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true

            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
            navigationController?.navigationBar.largeTitleTextAttributes = attributes
        }
    }
}
