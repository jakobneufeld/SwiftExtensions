/// The precedence group for the ++ and -- operator
precedencegroup plusPlusAndMinusMinus {
    higherThan: PowerOperatorPrecedence
    assignment: false
    associativity: none
 }

 postfix operator ++
/// The ++ function increments by 1
 public postfix func ++(rhs: Int) -> Int {
    return rhs + 1
 }
 postfix operator --
/// Oposite of ++ see ++
 public postfix func --(rhs: Int) -> Int{
    return rhs - 1
 }
 
precedencegroup PowerOperatorPrecedence {
    higherThan: MultiplicationPrecedence
    lowerThan: BitwiseShiftPrecedence
    associativity: none
    assignment: false
 }
 /// Power operator like in Fortran
 infix operator **: PowerOperatorPrecedence
 public func **(lhs: Int, rhs: Int) -> Int  {
    if rhs == 0 {
        return 1
    }
    var r = lhs
    for _ in 1..<rhs {
        r = r * lhs
    }
    return r
 }
/// A reference to a Value.   Be carful ! It can lead to race conditions, memory leaks etc....
/// But if you use it wisely, no problemo!
@propertyWrapper
public final class Reference<Value> {
    private var storage: Value
    public init(wrappedValue initialValue: Value) {
        storage = initialValue
    }
    public var wrappedValue: Value {
        get {
            storage
        }
        set {
            storage = newValue
        }
    }
}
