//
//  RoundButton.swift
//  AudioJournalApp
//
//  Created by David Robie on 7/16/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    var url: URL?
    override var intrinsicContentSize: CGSize {
       let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude)) ?? .zero
              var desiredHeight = labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom + self.layer.cornerRadius + 20
                  if(desiredHeight < minSize)
                  {
                    desiredHeight = minSize
                  }
              let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: desiredHeight)
             return desiredButtonSize

    }
    
    var toggle = false
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }
    
   
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var minSize: CGFloat = 0 {
          didSet{
              
          }
      }

    

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
   
}
