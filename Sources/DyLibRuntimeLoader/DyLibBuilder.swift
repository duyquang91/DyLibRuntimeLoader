//
//  Created by Duy Quang Dao on 31/3/23.
//

import Foundation

class DyLibBuilder<T> {

    private let factory: () -> T

    init(factory: @autoclosure @escaping () -> T) {
        self.factory = factory
    }

    func build() -> T {
        return factory()
    }
}
