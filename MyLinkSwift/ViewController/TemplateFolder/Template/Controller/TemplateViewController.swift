//
//  TemplateViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class TemplateViewController: CMHKBaseViewController {
    
    // MARK: Declare
    let layerModel = TemplateModel()
    let layerView = TemplateView()
    
    // MARK: Setup
    private func setup() {
        
        setupSelf()
        setupNavigationBar()
        setupLayerView()
    }
    
    private func setupSelf() {
        
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupNavigationBar() {
        
        self.title = "TemplateView"
    }
    
    private func setupLayerView() {
        
        layerView.frame = view.bounds
        view.addSubview(layerView)
    }

    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
}
