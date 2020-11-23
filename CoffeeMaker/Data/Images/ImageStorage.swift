//
//  ImageStorage.swift
//  Data
//
//  Created by Przemysław Olszacki on 19/11/2020.
//

import Foundation
import Combine

public final class ImageStorage: ImageLoader, ImageSaver {

    private let fileManager: FileManager
    private var storageDirectoryPath: URL? {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func saveImage(fileName: String, data: Data) -> AnyPublisher<URL, ImageStorageError> {
        guard let storageDirectoryPath = storageDirectoryPath else {
            return Fail(error: ImageStorageError.noStoragePath).eraseToAnyPublisher()
        }

        var imagePath = storageDirectoryPath
        imagePath.appendPathComponent(fileName)
        do {
            try data.write(to: imagePath)
            return Just(imagePath).setFailureType(to: ImageStorageError.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: ImageStorageError.fileAccessError(error: error)).eraseToAnyPublisher()
        }
    }

    public func loadImage(url: URL) -> AnyPublisher<Data, ImageStorageError> {
        do {
            let fileData = try Data(contentsOf: url)
            return Just(fileData).setFailureType(to: ImageStorageError.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: ImageStorageError.fileAccessError(error: error)).eraseToAnyPublisher()
        }
    }
}
