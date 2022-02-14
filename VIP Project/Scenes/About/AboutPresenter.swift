//
//  AboutPresenter.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AboutPresenterProtocol {
    func set(viewController: AboutViewControllerProtocol)
    
    func presentAboutData(response: About.AboutData.Response)
    func goToLink(response: About.Navigate.Response)
}

class AboutPresenter: AboutPresenterProtocol {
    
    //MARK: - DI
    
    weak var viewController: AboutViewControllerProtocol?
    
    func set(viewController: AboutViewControllerProtocol) {
        self.viewController =  viewController
    }
    
    //MARK: - Presenters
    
    func presentAboutData(response: About.AboutData.Response) {
        let viewModel = About.AboutData.ViewModel(aboutText: response.aboutText, myImage: response.myImage)
        viewController?.displayAboutData(viewModel: viewModel)
    }
    
    func goToLink(response: About.Navigate.Response) {
        let viewModel = About.Navigate.ViewModel(url: response.url)
        viewController?.goToLink(viewModel: viewModel)
    }
}
