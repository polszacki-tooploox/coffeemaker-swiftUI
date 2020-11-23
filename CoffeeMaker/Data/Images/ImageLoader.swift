//
//  ImageLoader.swift
//  Data
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation
import Combine

public protocol ImageLoader {
    func loadImage(url: URL) -> AnyPublisher<Data, ImageStorageError>
}
