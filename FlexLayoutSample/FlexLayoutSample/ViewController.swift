//
//  ViewController.swift
//  FlexLayoutSample
//
//  Created by 이남준 on 2023/05/11.
//

import UIKit

import FlexLayout
import PinLayout

class ViewController: UIViewController {

    let contentView = ViewControllerView()
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentView.button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        self.contentView.navigationBar.flex.markDirty()
        if self.contentView.isNavigationBarHidden {
//            self.contentView.navigationBar.statusBar.flex.height(56.0)
            self.contentView.navigationBar.flex.height(200.0)
        } else {
//            self.contentView.navigationBar.statusBar.flex.height(0.0)
            self.contentView.navigationBar.flex.height(0.0)
        }
        
        self.contentView.isNavigationBarHidden.toggle()
        self.contentView.flex.markDirty()
        self.contentView.setNeedsLayout()
        UIView.animate(withDuration: 0.5) {
            self.contentView.layoutIfNeeded()
        }
    }
}

final class ViewControllerView: UIView {
    private var scrollView = UIScrollView()
    private var flexContainer = UIView()
    
    var button = UIButton()
    
    var navigationBar = DealiNavigationBar()
    var isNavigationBarHidden = false
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        self.addSubview(self.scrollView)
        self.scrollView.bounces = true
        self.scrollView.addSubview(self.flexContainer)
        self.button.backgroundColor = .brown
        
        self.flexContainer.flex
            .alignItems(.center)
            .define {
                $0.addItem(self.navigationBar).height(200.0).alignSelf(.stretch)
                $0.addItem(self.button).size(100.0)
            }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.scrollView.pin.all()
        self.flexContainer.pin.top().left().right()
        self.flexContainer.flex.layout(mode: .adjustHeight)
        self.scrollView.contentSize = self.flexContainer.frame.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
