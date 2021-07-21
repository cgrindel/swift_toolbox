import TypeUtils

protocol TestProtocol: Typeable {}
extension String: TestProtocol {}
extension Int: TestProtocol {}
