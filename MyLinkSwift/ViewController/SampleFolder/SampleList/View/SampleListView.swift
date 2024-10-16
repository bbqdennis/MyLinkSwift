//
//  SampleListView.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

// MARK: Constants

class SampleListView: UIView {

    // MARK: Declare
    
    // MARK: Init
    override init (frame : CGRect) {
        super.init(frame : frame)
        // Do what you want.
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        setupAll()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Setup
    private func setupAll() {
        
        setup();
        setupLayer();
        setupConstraints();
    }
    
    private func setup() {
        
        selfSetup();
    }
    
    private func selfSetup() {
        
        self.backgroundColor = UIColor.white
    }
    
    // MARK: Setup Layer
    
    private func setupLayer() {
        
    }
    
    // MARK: Setup Constraints
    
    private func setupConstraints() {
        
    }
    
    // MARK: Helper
    
    // MARK: Common
    
    // MARK: Action
    
    // MARK: Public
}
