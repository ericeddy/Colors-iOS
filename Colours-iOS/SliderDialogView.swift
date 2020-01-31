//
//  SliderDialogView.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-31.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit

class SliderDialogView: DialogView {
    
    override var dialogSizeW: CGFloat { return 60 }
    override var dialogSizeH: CGFloat { return 320 }
    
    var thumb: UIView!
    
    var isDraggingThumb = false
    
    var thumbYConstraint: NSLayoutConstraint?
    
    let thumbPadding: CGFloat = 20
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func commonInit() {
        super.commonInit()
        thumb = UIView()
        thumb.backgroundColor = .lightGray
        background.addSubview(thumb)
    }
    
    override func setupDialog() {
        super.setupDialog()
        thumb.setHeightWidth(height: 40, width: 40)
        thumbYConstraint = background.pinToView(thumb, .top, .top, -thumbPadding)
        background.pinToView(thumb, .centerX)
        thumb.layer.cornerRadius = 20
    }
    
    override func handleDialogPosition() {
        // OVERRIDE DIALOG POSITION IN SUBCLASS
        self.pinToView(background, .left, .left, (dialogPosLeft ?? thumbPadding) * -1 )
        dialogPosTop = (UIScreen.main.bounds.height - dialogSizeH - dialogPosBottom) * -1
        dialogYContstraint = self.pinToView(background, .top, .top, dialogPosTop + constantOffset )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: background)
            if point.x > background.bounds.origin.x && point.x < background.bounds.origin.x + dialogSizeW && point.y > background.bounds.origin.y &&  point.y < background.bounds.origin.y + dialogSizeH {
                isDraggingThumb = true
                
                var pos = point.y - (thumb.bounds.size.height * 0.5)
               if pos < thumbPadding { pos = thumbPadding } else if pos > dialogSizeH - thumbPadding - thumb.bounds.size.height { pos = dialogSizeH - thumbPadding - thumb.bounds.size.height }
                thumbYConstraint?.constant = pos * -1
                background.layoutIfNeeded()
                
                updateValue()
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isDraggingThumb {
            if let touch = touches.first {
                let point = touch.location(in: background)
                var pos = point.y - (thumb.bounds.size.height * 0.5)
                if pos < thumbPadding { pos = thumbPadding } else if pos > dialogSizeH - thumbPadding - thumb.bounds.size.height { pos = dialogSizeH - thumbPadding - thumb.bounds.size.height }
                thumbYConstraint?.constant = pos * -1
                background.layoutIfNeeded()
                updateValue()
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDraggingThumb = false
    }
    
    func updateValue() {
        let barMAX = dialogSizeH - thumbPadding * 2 - (thumb.bounds.size.height * 0.5)
        let barMIN = thumbPadding
        let currentPosition = (thumbYConstraint?.constant ?? thumbPadding)
        let rationalized = (currentPosition < 0 ? currentPosition * -1 : currentPosition) - barMIN
        let value = rationalized / (barMAX - barMIN)
        print(value)
    }
}
