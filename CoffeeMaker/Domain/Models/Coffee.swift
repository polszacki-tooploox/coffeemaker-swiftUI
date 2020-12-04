//
//  Coffee.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation

public struct Coffee {
    public let name: String
    public let imagePath: String?

    public init(name: String, imagePath: String?) {
        self.name = name
        self.imagePath = imagePath
    }
}
