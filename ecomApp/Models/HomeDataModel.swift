//
//  HomeDataModel.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import Foundation

struct HomeDataModel : Codable {
    let status : Bool?
    let homeData : [HomeData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case homeData = "homeData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        homeData = try values.decodeIfPresent([HomeData].self, forKey: .homeData)
    }

}

struct HomeData : Codable {
    let type : String?
    let homeValues : [HomeValues]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case homeValues = "values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        homeValues = try values.decodeIfPresent([HomeValues].self, forKey: .homeValues)
    }

}


struct HomeValues : Codable {
    let id: Int
        let name: String?
        let imageURL, bannerURL: String?
        let image: String?
        let actualPrice, offerPrice: String?
        let offer: Int?
        let isExpress: Bool?

        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case bannerURL = "banner_url"
            case image
            case actualPrice = "actual_price"
            case offerPrice = "offer_price"
            case offer
            case isExpress = "is_express"
        }

        init(id: Int, name: String?, imageURL: String?, bannerURL: String?, image: String?, actualPrice: String?, offerPrice: String?, offer: Int?, isExpress: Bool?) {
            self.id = id
            self.name = name
            self.imageURL = imageURL
            self.bannerURL = bannerURL
            self.image = image
            self.actualPrice = actualPrice
            self.offerPrice = offerPrice
            self.offer = offer
            self.isExpress = isExpress
        }

}
