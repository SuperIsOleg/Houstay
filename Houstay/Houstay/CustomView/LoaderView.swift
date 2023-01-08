//
//  LoaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 22.11.22.
//

import UIKit

class LoaderView: UIView {
    private var loaderView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.white500()
        return view
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        return imageView
    }()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.loginTitle()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.blue100()
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = R.color.blue100()
        indicator.startAnimating()
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(loaderView)
        loaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        loaderView.addSubview(logoImage)
        logoImage.snp.makeConstraints {
            $0.top.greaterThanOrEqualToSuperview().offset(10)
            $0.centerY.equalToSuperview().offset(-150)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        loaderView.addSubview(logoLabel)
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        loaderView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(170)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(25)
        }
    }
}

