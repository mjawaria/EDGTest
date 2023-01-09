//
//  EndPointType.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import Foundation

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum EndPointItems {
    case products
}

extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .products:
            return Constant.API.productURL
        }
        // we can manage here more path like Products detail, user Profile etc.
    }
    
    var baseURL: String {
        return Constant.API.baseURL
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
}
