//
//  CMHKBaseLabel.swift
//  csapp
//
//  Created by Taiki Ko on 27/9/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

import UIKit

class CMHKBaseLabel: UILabel {
    func dollarSignDifferenceSizeHandle(dollarSignFontSize: CGFloat, normalFontSize: CGFloat) {
        if let dollarSignIndex = text!.range(of: "$")?.upperBound {
            let dollarSignAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: normalFontSize)]
            let normalAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: dollarSignFontSize)]
            let partOne = NSMutableAttributedString(string: String(text![..<dollarSignIndex]), attributes: dollarSignAttributes)
            let partTwo = NSMutableAttributedString(string: String(text![dollarSignIndex..<text!.endIndex]), attributes: normalAttributes)
            let combination = NSMutableAttributedString()
            combination.append(partOne)
            combination.append(partTwo)
            self.attributedText = combination
        }
    }
}
