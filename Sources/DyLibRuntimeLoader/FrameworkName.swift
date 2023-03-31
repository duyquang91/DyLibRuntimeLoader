//
//  Created by Duy Quang Dao on 31/3/23.
//

import Foundation

public enum Directory {
    case frameworks
    case resources
    case executables
    case custom(folder: String)

    public var rawValue: String {
        switch self {
        case .frameworks:
            return "Frameworks"
        case .resources:
            return ""
        case .executables:
            return "Executables"
        case .custom(let folder):
            return folder
        }
    }
}

public enum FrameworkName {
    /// Dynamic XCFramework
    case xcFramework(name: String, bundle: Bundle = .main, directory: Directory = .frameworks)

    /// Dynamic fat framework
    case framework(name: String, Bundle: Bundle = .main, directory: Directory = .frameworks)

    var fileExtension: String {
        switch self {
        case .xcFramework:
            return "xcframework"
        case .framework:
            return "framework"
        }
    }

    func getAppendFilePath() throws -> String {
        switch self {
        case .xcFramework(let name, let bundle, let directory):
            #if targetEnvironment(simulator)
            let path = try getfilePath(withName: name, fileExtension: fileExtension, fromBundle: bundle, inDirectory: directory)
            return path + "/ios-arm64_x86_64-simulator/\(name).framework/\(name)"
            #else
            let path = try getfilePath(withName: name, fileExtension: fileExtension, fromBundle: bundle, inDirectory: directory)
            return path + "/ios-arm64/\(name).framework/\(name)"
            #endif
        case .framework(let name, let bundle, let directory):
            let path = try getfilePath(withName: name, fileExtension: fileExtension, fromBundle: bundle, inDirectory: directory)
            return path + "/\(name)"
        }
    }

    private func getfilePath(withName name: String, fileExtension: String, fromBundle bundle: Bundle, inDirectory directory: Directory) throws -> String {
        guard let path = bundle.path(forResource: name, ofType: fileExtension, inDirectory: directory.rawValue) else {
            throw DynamicFrameworkLoaderError.failedToOpenFile(reason: "\"\(name).\(fileExtension)\" is not found from bundle: \(bundle.description)")
        }

        return path
    }
}
