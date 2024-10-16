//
//  CMHKBaseView.swift
//  csapp
//
//  Created by Taiki Ko on 27/9/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

import UIKit

class CMHKBaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    func commitInit() {
        let nameSpaceClassName = NSStringFromClass(type(of: self))
        let className = nameSpaceClassName.components(separatedBy: ".").last! as String
        
        if Bundle.main.path(forResource: className, ofType: "nib") != nil {
            let view = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView
            view!.frame = self.bounds
            view!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view!)
        }
    }
}
