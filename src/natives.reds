
native func Log(str: String)

native func RandRange(a: Int32, b: Int32) -> Int32

native func RandF() -> Float
native func RandRangeF(a: Float, b: Float) -> Float
native func SqrtF(a: Float) -> Float
native func LogF(a: Float) -> Float
native func CosF(a: Float) -> Float

native func OperatorAdd(a: String, b: String) -> String

native func OperatorLogicAnd(a: Bool, b: Bool) -> Bool
native func OperatorLogicOr(a: Bool, b: Bool) -> Bool

native func OperatorEqual(a: Int8, b: Int8) -> Bool
native func OperatorLess(a: Int8, b: Int8) -> Bool
native func OperatorLessEqual(a: Int8, b: Int8) -> Bool
native func OperatorGreater(a: Int8, b: Int8) -> Bool
native func OperatorGreaterEqual(a: Int8, b: Int8) -> Bool
native func OperatorAdd(a: Int8, b: Int8) -> Int8
native func OperatorAssignAdd(out a: Int8, b: Int8) -> Int8
native func OperatorSubtract(a: Int8, b: Int8) -> Int8
native func OperatorAssignSubtract(out a: Int8, b: Int8) -> Int8
native func OperatorMultiply(a: Int8, b: Int8) -> Int8
native func OperatorAssignMultiply(out a: Int8, b: Int8) -> Int8
native func OperatorDivide(a: Int8, b: Int8) -> Int8
native func OperatorAssignDivide(out a: Int8, b: Int8) -> Int8

native func OperatorEqual(a: Int16, b: Int16) -> Bool
native func OperatorLess(a: Int16, b: Int16) -> Bool
native func OperatorLessEqual(a: Int16, b: Int16) -> Bool
native func OperatorGreater(a: Int16, b: Int16) -> Bool
native func OperatorGreaterEqual(a: Int16, b: Int16) -> Bool
native func OperatorAdd(a: Int16, b: Int16) -> Int16
native func OperatorAssignAdd(out a: Int16, b: Int16) -> Int16
native func OperatorSubtract(a: Int16, b: Int16) -> Int16
native func OperatorAssignSubtract(out a: Int16, b: Int16) -> Int16
native func OperatorMultiply(a: Int16, b: Int16) -> Int16
native func OperatorAssignMultiply(out a: Int16, b: Int16) -> Int16
native func OperatorDivide(a: Int16, b: Int16) -> Int16
native func OperatorAssignDivide(out a: Int16, b: Int16) -> Int16

native func OperatorEqual(a: Int32, b: Int32) -> Bool
native func OperatorLess(a: Int32, b: Int32) -> Bool
native func OperatorLessEqual(a: Int32, b: Int32) -> Bool
native func OperatorGreater(a: Int32, b: Int32) -> Bool
native func OperatorGreaterEqual(a: Int32, b: Int32) -> Bool
native func OperatorAdd(a: Int32, b: Int32) -> Int32
native func OperatorAssignAdd(out a: Int32, b: Int32) -> Int32
native func OperatorSubtract(a: Int32, b: Int32) -> Int32
native func OperatorAssignSubtract(out a: Int32, b: Int32) -> Int32
native func OperatorMultiply(a: Int32, b: Int32) -> Int32
native func OperatorAssignMultiply(out a: Int32, b: Int32) -> Int32
native func OperatorDivide(a: Int32, b: Int32) -> Int32
native func OperatorAssignDivide(out a: Int32, b: Int32) -> Int32

native func OperatorEqual(a: Int64, b: Int64) -> Bool
native func OperatorLess(a: Int64, b: Int64) -> Bool
native func OperatorLessEqual(a: Int64, b: Int64) -> Bool
native func OperatorGreater(a: Int64, b: Int64) -> Bool
native func OperatorGreaterEqual(a: Int64, b: Int64) -> Bool
native func OperatorAdd(a: Int64, b: Int64) -> Int64
native func OperatorAssignAdd(out a: Int64, b: Int64) -> Int64
native func OperatorSubtract(a: Int64, b: Int64) -> Int64
native func OperatorAssignSubtract(out a: Int64, b: Int64) -> Int64
native func OperatorMultiply(a: Int64, b: Int64) -> Int64
native func OperatorAssignMultiply(out a: Int64, b: Int64) -> Int64
native func OperatorDivide(a: Int64, b: Int64) -> Int64
native func OperatorAssignDivide(out a: Int64, b: Int64) -> Int64

native func OperatorEqual(a: Float, b: Float) -> Bool
native func OperatorLess(a: Float, b: Float) -> Bool
native func OperatorLessEqual(a: Float, b: Float) -> Bool
native func OperatorGreater(a: Float, b: Float) -> Bool
native func OperatorGreaterEqual(a: Float, b: Float) -> Bool
native func OperatorAdd(a: Float, b: Float) -> Float
native func OperatorAssignAdd(out a: Float, b: Float) -> Float
native func OperatorSubtract(a: Float, b: Float) -> Float
native func OperatorAssignSubtract(out a: Float, b: Float) -> Float
native func OperatorMultiply(a: Float, b: Float) -> Float
native func OperatorAssignMultiply(out a: Float, b: Float) -> Float
native func OperatorDivide(a: Float, b: Float) -> Float
native func OperatorAssignDivide(out a: Float, b: Float) -> Float

native func OperatorEqual(a: Double, b: Double) -> Bool
native func OperatorLess(a: Double, b: Double) -> Bool
native func OperatorLessEqual(a: Double, b: Double) -> Bool
native func OperatorGreater(a: Double, b: Double) -> Bool
native func OperatorGreaterEqual(a: Double, b: Double) -> Bool
native func OperatorAdd(a: Double, b: Double) -> Double
native func OperatorAssignAdd(out a: Double, b: Double) -> Double
native func OperatorSubtract(a: Double, b: Double) -> Double
native func OperatorAssignSubtract(out a: Double, b: Double) -> Double
native func OperatorMultiply(a: Double, b: Double) -> Double
native func OperatorAssignMultiply(out a: Double, b: Double) -> Double
native func OperatorDivide(a: Double, b: Double) -> Double
native func OperatorAssignDivide(out a: Double, b: Double) -> Double

native func Cast(a: Int8) -> Int16
native func Cast(a: Int8) -> Int32
native func Cast(a: Int8) -> Int64
native func Cast(a: Int8) -> Uint8
native func Cast(a: Int8) -> Uint16
native func Cast(a: Int8) -> Uint32
native func Cast(a: Int8) -> Uint64
native func Cast(a: Int8) -> Float
native func Cast(a: Int8) -> Double

native func Cast(a: Int16) -> Int8
native func Cast(a: Int16) -> Int32
native func Cast(a: Int16) -> Int64
native func Cast(a: Int16) -> Uint8
native func Cast(a: Int16) -> Uint16
native func Cast(a: Int16) -> Uint32
native func Cast(a: Int16) -> Uint64
native func Cast(a: Int16) -> Float
native func Cast(a: Int16) -> Double

native func Cast(a: Int32) -> Int8
native func Cast(a: Int32) -> Int16
native func Cast(a: Int32) -> Int64
native func Cast(a: Int32) -> Uint8
native func Cast(a: Int32) -> Uint16
native func Cast(a: Int32) -> Uint32
native func Cast(a: Int32) -> Uint64
native func Cast(a: Int32) -> Float
native func Cast(a: Int32) -> Double

native func Cast(a: Int64) -> Int8
native func Cast(a: Int64) -> Int16
native func Cast(a: Int64) -> Int32
native func Cast(a: Int64) -> Uint8
native func Cast(a: Int64) -> Uint16
native func Cast(a: Int64) -> Uint32
native func Cast(a: Int64) -> Uint64
native func Cast(a: Int64) -> Float
native func Cast(a: Int64) -> Double

native func Cast(a: Float) -> Int8
native func Cast(a: Float) -> Int16
native func Cast(a: Float) -> Int32
native func Cast(a: Float) -> Int64
native func Cast(a: Float) -> Uint8
native func Cast(a: Float) -> Uint16
native func Cast(a: Float) -> Uint32
native func Cast(a: Float) -> Uint64
native func Cast(a: Float) -> Double

native func Cast(a: Double) -> Int8
native func Cast(a: Double) -> Int16
native func Cast(a: Double) -> Int32
native func Cast(a: Double) -> Int64
native func Cast(a: Double) -> Uint8
native func Cast(a: Double) -> Uint16
native func Cast(a: Double) -> Uint32
native func Cast(a: Double) -> Uint64
native func Cast(a: Double) -> Float
