//
//  HomeViewModel.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import Foundation


class HomeViewModel: NSObject {
    
    private var apiService: APIService!
    
   private(set) var homedata : [HomeData]? {
        didSet{
            self.bindHomeViewModelToController()
        }
    }
    
    var bindHomeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        cellGetHome()
    }
    
    func cellGetHome(){
        self.apiService.apiToGetEmployeeData { (data) in
            self.homedata = data.homeData ?? []
        }
    }
    
    
}
