//
//  ImageStorageError.swift
//  Data
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation

public enum ImageStorageError: Error {
    case noStoragePath
    case fileAccessError(error: Error)
    case noImageFound
}
