//
//  Created by Duy Quang Dao on 31/3/23.
//
import Foundation
import Darwin

typealias InitFunction = @convention(c) () -> UnsafeMutableRawPointer


/// Load whole library, useful for using `NSClassFromString` method
/// - Parameter framework: ynamic framework hosts the dynamic library
/// - Throws: DynamicFrameworkLoaderError
public func dyLibLoad(fromFramework framework: FrameworkName) throws {
    dyLibLoad(fromPath: try framework.getAppendFilePath())
}

/// Load whole library, useful for using `NSClassFromString` method
/// - Parameter fromPath: path to the dynamic library
public func dyLibLoad(fromPath: String) {
    dlopen(fromPath, RTLD_LAZY)
}

/// Load a concrete implementation from dynamic library.
/// - Parameters:
///   - symbolName: symbol name of the method in the library which return the concrete implementation
///   - framework: dynamic framework hosts the dynamic library
///   - type: protocol type which concrete implementation conforms to
/// - Throws: DynamicFrameworkLoaderError
/// - Returns: concrete implementation of protocol type
public func dyLibLoad<T>(withSymbol symbolName: String,
                         fromFramework framework: FrameworkName,
                         forType type: T.Type) throws -> T {
    return try dyLibLoad(withSymbol: symbolName, fromPath: try framework.getAppendFilePath(), forType: type)
}

/// Load a concrete implementation from dynamic library.
/// - Parameters:
///   - symbolName: symbol name of the method in the library which return the concrete implementation
///   - path: path to the dynamic library
///   - type: protocol type which concrete implementation conforms to
/// - Throws: DynamicFrameworkLoaderError
/// - Returns: concrete implementation of protocol type
public func dyLibLoad<T>(withSymbol symbolName: String,
                         fromPath path: String,
                         forType: T.Type) throws -> T {

    let openRes = dlopen(path, RTLD_LAZY)
    if openRes != nil {
        let sym = dlsym(openRes, symbolName)

        if sym != nil {
            let f: InitFunction = unsafeBitCast(sym, to: InitFunction.self)
            let pluginPointer = f()
            return Unmanaged<DyLibBuilder<T>>.fromOpaque(pluginPointer).takeRetainedValue().build()
        }
        else {
            throw DynamicFrameworkLoaderError.symbolNotFound
        }
    }
    else {
        if let err = dlerror() {
            throw DynamicFrameworkLoaderError.failedToOpenFile(reason: String(cString: err))
        }
        else {
            throw DynamicFrameworkLoaderError.unknow
        }
    }
}
