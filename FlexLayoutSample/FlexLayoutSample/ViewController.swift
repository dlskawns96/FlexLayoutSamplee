//
//  ViewController.swift
//  FlexLayoutSample
//
//  Created by Nam Jun Lee on 2023/05/10.
//

import UIKit

import FlexLayout
import PinLayout

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = DealiNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }

}

final class DealiNavigationBar: UIView {
    private let rootFlexContainer = UIView()
    
    let label = UILabel()
    let view = UIView()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        
        self.label.text = "HELLO WORLD"
        self.label.backgroundColor = .blue
        
        self.view.backgroundColor = .yellow
        
        self.rootFlexContainer.flex
            .direction(.row).padding(10.0)
            .define {
                $0.addItem(self.label)
                $0.addItem(self.view).width(50.0).height(50.0).marginLeft(20.0)
            }
        
        self.addSubview(self.rootFlexContainer)
    }
    
    
      override func layoutSubviews() {
          super.layoutSubviews()

          // Layout the flexbox container using PinLayout
          // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
          rootFlexContainer.pin.top().horizontally().margin(pin.safeArea)

          // Then let the flexbox container layout itself
          rootFlexContainer.flex.layout(mode: .adjustHeight)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
