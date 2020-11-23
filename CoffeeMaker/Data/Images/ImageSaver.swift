//
//  ImageSaver.swift
//  Data
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation
import Combine

public protocol ImageSaver {
    func saveImage(fileName: String, data: Data) -> AnyPublisher<URL, ImageStorageError>
}
