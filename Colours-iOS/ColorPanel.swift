//
//  ColorPanel.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-20.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit
import QuartzCore

class ColorPanel: UIView {
    
    var delegate: ColorDelegate?
    var loop:GameLoop!
    
    var colours: [UIColor] = [UIColor]()
    var cells: [[Int]] = [[Int]]()
    var cellSize: Int = 0
    var xNumCells: Int = 0
    var yNumCells: Int = 0
    
    var currentCellX: Int = -1
    var currentCellY: Int = -1
    var touchSize: Int = 2
    var brushType: Int = 0
    var brushColorType: Int = 0
    
    var isPlaying = false
    var isPlayingForwards = true
    var testLoop = 0
    
    convenience init(_ cDelegate: ColorDelegate, frame: CGRect, xCell: Int, yCell: Int, size: Int) {
        self.init(frame: frame)
        xNumCells = xCell
        yNumCells = yCell
        cellSize = size
        delegate = cDelegate
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        clearsContextBeforeDrawing = true
        loop = GameLoop(doSomething: {
            if self.isPlaying {
                self.increaseAllCells()
            }
            
            self.setNeedsDisplay()
        })
        colours = Helper.getSelectedColors()
        generateDefaultCells()
        
        self.backgroundColor = UIColor.init(rgb: 0xFFFF00)
    }
    
    func generateDefaultCells() {
        
        cells = Array(repeating: Array(repeating: 0, count: xNumCells), count: yNumCells)
//        delegate?.panelSizeUpdated()
    }
    
    
    func increaseAllCells() {
        for y in 0..<yNumCells {
            for x in 0..<xNumCells {
                affectCellPlayingValue(y, x);
            }
        }
    }
    
    func affectCellPlayingValue(_ cellY: Int, _ cellX: Int ) {
        if(cellY < 0 || cellY >= yNumCells || cellX < 0 || cellX >= xNumCells) {
            return;
        }
        var newValue = 0
        if isPlayingForwards {
            newValue = cells[cellY][cellX] + 1;
        } else {
            newValue = cells[cellY][cellX] - 1;
        }
        if(newValue >= colours.count){
            newValue = 0;
        } else if( newValue < 0 ) {
            newValue = colours.count - 1;
        }
        cells[cellY][cellX] = newValue;
    }
    
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        for y in 0..<yNumCells {
            for x in 0..<xNumCells {
                let cellValue = cells[y][x]
                let fill = colours[cellValue]
                let rect = CGRect(x: x * cellSize, y: y * cellSize, width: cellSize, height: cellSize )
                context?.setFillColor(fill.cgColor)
                context?.fill(rect)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let cellX = Int(location.x) / cellSize
            let cellY = Int(location.y) / cellSize
            currentCellX = cellX
            currentCellY = cellY
            cellTouched()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let cellX = Int(location.x) / cellSize
            let cellY = Int(location.y) / cellSize
            if cellX != currentCellX || cellY != currentCellY {
                currentCellX = cellX
                currentCellY = cellY
                cellTouched()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func cellTouched() {
        if touchSize == 0 {
            affectCellValue(currentCellY, currentCellX)
        } else {
            let cellY = currentCellY; let cellX = currentCellX;
            let length = 1 + (touchSize * 2); // touch = 1; length = 3;
            var skip = 0
            for j in 0..<touchSize { // x
                var offsetY = -touchSize
                for i in 0..<length { // y
                    let c_cellY = cellY + offsetY
                    if(j > 0) {
                        let c_cellX1 = cellX + skip
                        let c_cellX2 = cellX - skip
                        if(i >= skip && i < length - skip){
                            affectCellValue(c_cellY, c_cellX1);
                            affectCellValue(c_cellY, c_cellX2);
                        }
                    } else {
                        affectCellValue(c_cellY, cellX);

                    }
                    offsetY = offsetY + 1
                }
                skip = skip + 1
            }
        }
    }
    
    func affectCellValue(_ cellY: Int, _ cellX: Int) {
        if(cellY < 0 || cellY >= yNumCells || cellX < 0 || cellX >= xNumCells) {
            return;
        }
        var newValue = 0
        if brushType == 0 {
            newValue = cells[cellY][cellX] + 1
        } else if (brushType == 1) {
            newValue = cells[cellY][cellX] - 1
        } else if(brushType == 2) {
            newValue = brushColorType
        }
        if(newValue >= colours.count){
            newValue = 0
        } else if( newValue < 0 ) {
            newValue = colours.count - 1
        }
        cells[cellY][cellX] = newValue
        
    }
    
    func playTapped() {
        isPlaying = !isPlaying
    }
    
    class GameLoop : NSObject {

        var doSomething: () -> ()
        var displayLink : CADisplayLink!

        init(doSomething: @escaping () -> ()) {
            self.doSomething = doSomething
            super.init()
            start()
        }

        // you could overwrite this too
        @objc func handleTimer() {
            doSomething()
        }

        func start() {
            displayLink = CADisplayLink(target: self, selector: #selector(handleTimer))
            /*
            * If set to zero, the
            * display link will fire at the native cadence of the display hardware.
            * The display link will make a best-effort attempt at issuing callbacks
            * at the requested rate.
            */
            displayLink.preferredFramesPerSecond = 24
            displayLink.add(to: .main, forMode: RunLoop.Mode.common)
        }

        func stop() {
            displayLink.invalidate()
            displayLink.remove(from: .main, forMode: RunLoop.Mode.common)
            displayLink = nil
        }
    }
    
}
