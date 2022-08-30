//
//  OnboardingViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import Foundation
import UIKit

class OnboardingViewModel {
    var onboardingSlide: [OnboardingModel] = []

    init() {
        onboardingSlide = [ OnboardingModel(image: R.image.onboarding1() ?? UIImage(),
                                            title: R.string.localizable.onboarding1Title(),
                                            description: R.string.localizable.onboarding1Description()),
                            OnboardingModel(image: R.image.onboarding2() ?? UIImage(),
                                            title: R.string.localizable.onboarding2Title(),
                                            description: R.string.localizable.onboarding2Description()),
                            OnboardingModel(image: R.image.onboarding3() ?? UIImage(),
                                            title: R.string.localizable.onboarding3Title(),
                                            description: R.string.localizable.onboarding3Description()),
        ]
    }
    
}
