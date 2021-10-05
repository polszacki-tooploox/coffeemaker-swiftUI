//
//  Coffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation

public struct Coffee {
    public let id: String
    public let name: String
    public let imagePath: String?

    public init(id: String, name: String, imagePath: String?) {
        self.id = id
        self.name = name
        self.imagePath = imagePath
    }
}
