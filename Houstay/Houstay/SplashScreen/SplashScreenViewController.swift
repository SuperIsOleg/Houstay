//
//  SplashScreenViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol SplashScreenDelegate: AnyObject {
    func setupMainFlow()
}

class SplashScreenViewController: UIViewController {
    private let preLoader = PreLoader.shared
    
    private let layerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.white500()
        return view
    }()
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        return imageView
    }()
    
    internal var splashScreenDelegate: SplashScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        preLoader.getAppartments {
            self.splashScreenDelegate?.setupMainFlow()
        }
    }
    
    private func setupLayout() {
        view.addSubview(layerView)
        layerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        layerView.addSubview(iconImage)
        iconImage.snp.makeConstraints {
            $0.height.width.equalTo(150)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
}
