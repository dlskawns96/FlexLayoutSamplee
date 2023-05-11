//
//  DealiNavigationBar.swift
//  FlexLayoutSample
//
//  Created by 이남준 on 2023/05/11.
//

import UIKit

import FlexLayout
import PinLayout
import Then

final class DealiNavigationBar: UIView {
    private var flexContainer = UIView()
    
    var statusBar = UIView()
    var leftItemsContainer = UIStackView()
    var rightItemsContainer = UIStackView()
    var titleLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .yellow
        
        self.addSubview(self.flexContainer)
        
        self.statusBar.backgroundColor = .green
        self.leftItemsContainer.backgroundColor = .red
        self.rightItemsContainer.backgroundColor = .blue
        self.titleLabel.do {
            $0.backgroundColor = .black
            $0.textColor = .yellow
            $0.text = "HELLO WORLD"
        }
        
        self.flexContainer.flex
            .direction(.column)
            .define {
                $0.addItem(statusBar).height(56.0).shrink(1)
                $0.addItem().direction(.row).grow(1)
                    .define {
                        $0.addItem(self.leftItemsContainer).width(50.0)
                        $0.addItem(self.titleLabel).grow(1)
                        $0.addItem(self.rightItemsContainer).width(50.0)
                    }
            }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.flexContainer.pin.all()
        self.flexContainer.flex.layout(mode: .fitContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
