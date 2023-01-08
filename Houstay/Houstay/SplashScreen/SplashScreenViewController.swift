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

    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        return imageView
    }()
    
    internal var splashScreenDelegate: SplashScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        print(#function, ": ", iconImage.frame)
        preLoader.getAppartments {
            self.splashScreenDelegate?.setupMainFlow()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function, ": ", iconImage.frame)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationIcon()
        print(#function, ": ", iconImage.frame)
    }
    
    private func setupLayout() {
        self.view.backgroundColor = R.color.white500()

        self.view.addSubview(iconImage)
        iconImage.snp.makeConstraints {
            $0.height.width.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func animationIcon() {
        
        UIView.animate(withDuration: 0.3, delay: 0.1) {
            self.iconImage.snp.remakeConstraints {
                $0.height.width.equalTo(150)
                $0.top.greaterThanOrEqualToSuperview().offset(10)
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview().offset(-150)

            }
            self.view.layoutIfNeeded()
        }
    }
    
}
