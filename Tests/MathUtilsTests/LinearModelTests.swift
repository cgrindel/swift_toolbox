@testable import MathUtils
import Truth
import XCTest

class LinearModelTests: XCTestCase {
    func test_yValue() throws {
        let linearModel = LinearModel.with {
            $0.slope = 1
            $0.intercept = -1
        }
        assertThat(linearModel.yValue(forX: 0)).isEqualTo(-1)
        assertThat(linearModel.yValue(forX: 1)).isEqualTo(0)
        assertThat(linearModel.yValue(forX: 2)).isEqualTo(1)
    }

    func test_from_WithEmptyPairs() throws {
        let pairs: [OrderedPair<Decimal, Decimal>] = []
        let linearModel = LinearModel.from(pairs: pairs)
        assertThat(linearModel).isNil()
    }

    func test_from_WithOnePair() throws {
        let pairs: [OrderedPair<Decimal, Decimal>] = [.init(0, -1)]
        let linearModel = LinearModel.from(pairs: pairs)
        assertThat(linearModel).isNil()
    }

    func test_from_WithPairs() throws {
        let pairs: [OrderedPair<Decimal, Decimal>] = [
            .init(0, -1),
            .init(-1, -2),
            .init(1, 0),
        ]
        let linearModel = LinearModel.from(pairs: pairs)
        assertThat(linearModel).isEqualTo(.with {
            $0.slope = 1
            $0.intercept = -1
        })
    }
}
