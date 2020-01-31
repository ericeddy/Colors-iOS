//
//  ViewController.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-20.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorDelegate {
    var panel: ColorPanel!// = MazeView()
    var settingsBar: UIView!
    
    lazy var dialog: SliderDialogView = {
        return SliderDialogView()
    }()
    
    var sHeight: CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if panel == nil {
            let width = UIScreen.main.bounds.width
            let xNumCells = 32
            let cellSize = Int(ceil( width / CGFloat(xNumCells) ))
            let yNumCells = Int((view.bounds.height - sHeight) / CGFloat(cellSize))
            sHeight = view.bounds.height - CGFloat(yNumCells * cellSize)
            let pR = CGRect(x: 0, y: 0, width: view.bounds.width, height: CGFloat(yNumCells * cellSize))
            panel = ColorPanel(self, frame: pR, xCell: xNumCells, yCell: yNumCells, size: cellSize)
            panel.delegate = self
            panel.backgroundColor = UIColor(rgb: 0x00FFFF)
            view!.addSubview(panel)
        }
        
        if settingsBar == nil {
            let sR = CGRect(x: 0, y: view.bounds.height - sHeight, width: view.bounds.width, height: sHeight)
            settingsBar = UIView(frame: sR)
            settingsBar.backgroundColor = UIColor(rgb: 0x0000FF)
            view!.addSubview(settingsBar)
            
            settingsBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playTapped)))
        }
    }
    
    @objc func playTapped() {
//        panel.playTapped()
        view!.addSubview(dialog)
        dialog.setHeightWidth(height: view.bounds.height, width: view.bounds.width)
        dialog.openDialog(60, sHeight)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // -- ColorDelegate -
    
    func panelSizeUpdated() {
//        int screenHeight = root.getMeasuredHeight();
//        int colorPanelHeight = panel.cellSize * panel.yNumCells;
        
        let height = UIScreen.main.bounds.height
        let colorPanelHeight = CGFloat(panel.cellSize * panel.yNumCells)
        var pB = panel.bounds
        var sB = settingsBar.bounds
        pB.size.height = colorPanelHeight
        sB.origin.y = colorPanelHeight
        sB.size.height = height - colorPanelHeight
        panel.frame = sB
        settingsBar.frame = sB
    }
    
}

protocol ColorDelegate {
    func panelSizeUpdated()
}


