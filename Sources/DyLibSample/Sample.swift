//
//  Created by Duy Quang Dao on 31/3/23.
//

import Foundation
import DyLibSampleInterface
import DyLibRuntimeLoader

public struct Sample: SampleInterface {
    public var version: String {
        "test"
    }
}

@_cdecl("sample")
public func sample() -> UnsafeMutableRawPointer {
    return dyLibCreator(factory: Sample(), forType: SampleInterface.self)
}
