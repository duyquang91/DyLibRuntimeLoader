//
//  File.swift
//  
//
//  Created by Duy Quang Dao on 31/3/23.
//

import Foundation

public enum DynamicFrameworkLoaderError: Error {
    case symbolNotFound
    case failedToOpenFile(reason: String)
    case unknow
}

extension DynamicFrameworkLoaderError: LocalizedError {
    public var errorDescription: String {
        switch self {
        case .symbolNotFound:
            return "Symbol is not found"
        case .failedToOpenFile(let reason):
            return "Failed to open file with reason: \(reason)"
        case .unknow:
            return "Unknow error"
        }
    }
}
