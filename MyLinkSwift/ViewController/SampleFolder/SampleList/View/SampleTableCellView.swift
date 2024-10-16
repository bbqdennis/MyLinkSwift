//
//  SampleTableCellView.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class SampleTableCellView: UIView {

    // MARK: Constants
    private let kLayerViewHeight : CGFloat = 30.0
    private let kLayerViewHorizontalPadding : CGFloat = 20.0

    // MARK: Declare
    var layerView = UIView()
    
    // MARK: Init
    override init (frame : CGRect) {
        super.init(frame : frame)
        // Do what you want.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Override
    override func willMove(toSuperview newSuperview: UIView?) {
        setupAll()
    }

    // MARK: Setup
    private func setupAll() {
        
        setup();
        setupLayer();
        setupConstraints();
    }
    
    private func setup() {
        
        selfSetup();
        layerViewSetup();
    }
    
    private func selfSetup() {
        
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }
    
    private func layerViewSetup() {
        
        layerView.backgroundColor = UIColor(red: 0.42, green: 0.26, blue: 0.82, alpha: 1)
        layerView.layer.cornerRadius = kLayerViewHeight / 2
    }
    
    // MARK: Setup Layer
    private func setupLayer() {
        
        self.addSubview(layerView)
    }
    
    // MARK: Setup Constraints
    private func setupConstraints() {
        
        layerViewSetupConstraints()
    }
    
    private func layerViewSetupConstraints() {
        
        layerView.minX = kLayerViewHorizontalPadding
        layerView.minRWidth = kLayerViewHorizontalPadding
        layerView.height = kLayerViewHeight
        layerView.midY = self.height / 2
    }
    
    // MARK: Helper
    
    // MARK: Common
    
    // MARK: Action
    
    // MARK: Public
}
