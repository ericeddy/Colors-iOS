//
//  DialogView.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-30.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit

class DialogView: UIView {
    
    var overlay: UIView!
    var background: UIView!
    
    var dialogSizeH: CGFloat { return 260 }// Set this in subclass
    var dialogSizeW: CGFloat { return 360 } // This is just a default
    
    var constantOffset: CGFloat = -12
    
    var dialogYContstraint: NSLayoutConstraint?
    
    var constraintsSet = false
    
    var dialogPosTop: CGFloat = 0
    var dialogPosBottom: CGFloat = 0
    var dialogPosLeft: CGFloat?
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit() {
        overlay = UIView()
        overlay.backgroundColor = UIColor.init(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.6)
        addSubview(overlay)
        
        background = UIView()
        background.backgroundColor = .white
        background.layer.cornerRadius = 8
        addSubview(background)
        
        let overlayTap = UITapGestureRecognizer(target: self, action: #selector(handleOverlayTap))
        let dialogTap = UITapGestureRecognizer(target: self, action: #selector(handleDialogTap))
        overlay.addGestureRecognizer(overlayTap)
        background.addGestureRecognizer(dialogTap)
    }
    
    func setupDialog(){
        alpha = 0
        
        overlay.pinToView(self)
        
        background.setHeightWidth(height:dialogSizeH, width:dialogSizeW)
        
        constraintsSet = true
        
        handleDialogPosition()
    }
    
    func handleDialogPosition() {
        // OVERRIDE DIALOG POSITION IN SUBCLASS
        self.pinToView(background, .centerX)
        dialogPosTop = (self.bounds.size.height - background.bounds.size.height) * 0.5
        dialogYContstraint = self.pinToView(background, .top, .top, dialogPosTop + constantOffset)
    }
    
    @objc func handleOverlayTap() {
        closeDialog()
    }
    @objc func handleDialogTap() {
        
    }
    
    func openDialog(_ left: CGFloat, _ bottom: CGFloat) {
        dialogPosBottom = bottom
        dialogPosLeft = left
        openDialog()
    }
    
    func openDialog() {
        if !constraintsSet {
            setupDialog()
        }

        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
            self.dialogYContstraint?.constant = self.dialogPosTop
            self.layoutIfNeeded()
        }
    }
    
    func closeDialog() {
        // Animate Out then remove self from parent
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
            self.dialogYContstraint?.constant = self.dialogPosTop + self.constantOffset
            self.layoutIfNeeded()
        }) { (cancelled) in
            self.removeFromSuperview()
        }
    }
}
