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
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.loginTitle()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.blue100()
        label.alpha = 0
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = R.color.blue100()
        indicator.startAnimating()
        indicator.alpha = 0
        return indicator
    }()
    
    internal var splashScreenDelegate: SplashScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        preLoader.getAppartments {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                self.splashScreenDelegate?.setupMainFlow()
                self.view.removeLoaderView()
            }
            
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationIcon()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = R.color.white500()

        self.view.addSubview(iconImage)
        iconImage.snp.makeConstraints {
            $0.height.width.equalTo(150)
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.view.addSubview(logoLabel)
        self.logoLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        self.view.addSubview(activityIndicator)
        self.activityIndicator.snp.makeConstraints {
            $0.top.equalTo(self.logoLabel.snp.bottom).offset(170)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(25)
        }
    }
    
    private func animationIcon() {
        
        UIView.animate(withDuration: 1, delay: 1) {
            self.iconImage.snp.remakeConstraints {
                $0.height.width.equalTo(90)
                $0.top.greaterThanOrEqualToSuperview().offset(10)
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview().offset(-150)
            }
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.7, delay: 2) {
            self.logoLabel.alpha = 1
            self.activityIndicator.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
}
