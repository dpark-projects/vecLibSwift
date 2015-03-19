//
//  MJAccelerate.swift
//  vForce
//
//  Created by Dan Park on 3/18/15.
//  Copyright (c) 2015 Dan Park. All rights reserved.
//

import Accelerate

// Convenience functions wrapping functions from vForce.h.
//
// Function names are orignal name without `vv` prefix with few exceptions listed below.
// - trunc = vvint
// - round = vvnint
// - reciprocal = vvrec
//
// Arguments are adjusted to match standard <math.h> functions when applicable.

class MJAccelerate {
    
    // MARK: Array-Oriented Arithmetic and Auxiliary Functions
    /// ⌈x[i]⌉
    func ceil(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var r = x
            vvceil(&r, x, $0)
            return r
        }
    }
    /// ⌈x[i]⌉
    func ceil(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var r = x
            vvceilf(&r, x, $0)
            return r
        }
    }
    
    /// (y[i] < 0) ? -|x[i]| : +|x[i]|
    func copysign(x: [Double], y: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var r = x
            vvcopysign(&r, x, y, $0)
            return r
        }
    }
    /// (y[i] < 0) ? -|x[i]| : +|x[i]|
    func copysign(x: [Float], y: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var r = x
            vvcopysignf(&r, x, y, $0)
            return r
        }
    }
    
    
    //func div(x: [Double], y: [Double]) -> [Double] {
    //  var n = Int32(x.count)
    //  return withUnsafePointer(&n) {
    //    var z = x
    //    vvdiv(&z, x, y, $0)
    //    return z
    //  }
    //}
    //func div(x: [Float], y: [Float]) -> [Float] {
    //  var n = Int32(x.count)
    //  return withUnsafePointer(&n) {
    //    var z = x
    //    vvdivf(&z, x, y, $0)
    //    return z
    //  }
    //}
    
    
    /// |x[i]|
    func fabs(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvfabs(&y, x, $0)
            return y
        }
    }
    /// |x[i]|
    func fabs(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvfabsf(&y, x, $0)
            return y
        }
    }
    
    
    /// ⌊x[i]⌋
    func floor(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvfloor(&y, x, $0)
            return y
        }
    }
    /// ⌊x[i]⌋
    func floor(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvfloorf(&y, x, $0)
            return y
        }
    }
    
    
    // The returned value has the same sign as x and is less or equal to y in magnitude.
    func fmod(x: [Double], y: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvfmod(&z, x, y, $0)
            return z
        }
    }
    func fmod(x: [Float], y: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvfmodf(&z, x, y, $0)
            return z
        }
    }
    
    
    // remainder of round-to-even division x∕y
    // In contrast to fmod(), the returned value is not guaranteed to have the same sign as x.
    func remainder(x: [Double], y: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvremainder(&z, x, y, $0)
            return z
        }
    }
    func remainder(x: [Float], y: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvremainderf(&z, x, y, $0)
            return z
        }
    }
    
    
    // vvint; x rounded towards zero
    func trunc(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvint(&z, x, $0)
            return z
        }
    }
    func trunc(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvintf(&z, x, $0)
            return z
        }
    }
    
    
    // vvnint; nearest integeter to x
    func round(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvnint(&z, x, $0)
            return z
        }
    }
    func round(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            vvnintf(&z, x, $0)
            return z
        }
    }
    
    
    // Returns the next representable value of `from` in the direction of `to`.
    func nextafter(from: [Double], to: [Double]) -> [Double] {
        var n = Int32(from.count)
        return withUnsafePointer(&n) {
            var z = from
            vvnextafter(&z, from, to, $0)
            return z
        }
    }
    func nextafter(from: [Float], to: [Float]) -> [Float] {
        var n = Int32(from.count)
        return withUnsafePointer(&n) {
            var z = from
            vvnextafterf(&z, from, to, $0)
            return z
        }
    }
    
    
    /// 1/√x
    func rsqrt(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvrsqrt(&y, x, $0)
            return y
        }
    }
    /// 1/√x
    func rsqrt(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvrsqrtf(&y, x, $0)
            return y
        }
    }
    
    
    /// √x
    func sqrt(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsqrt(&y, x, $0)
            return y
        }
    }
    /// √x
    func sqrt(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsqrtf(&y, x, $0)
            return y
        }
    }
    
    
    /// ∛x
    @availability(OSX, introduced=10.10)
    func cbrt(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcbrt(&y, x, $0)
            return y
        }
    }
    /// ∛x
    @availability(OSX, introduced=10.10)
    func cbrt(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcbrtf(&y, x, $0)
            return y
        }
    }
    
    
    /// 1/x
    func reciprocal(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvrec(&y, x, $0)
            return y
        }
    }
    func reciprocal(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvrecf(&y, x, $0)
            return y
        }
    }
    
    
    
    // MARK: Array-Oriented Exponential and Logarithmic Functions
    /// 𝒆ⁿ
    func exp(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexp(&y, x, $0)
            return y
        }
    }
    /// 𝒆ⁿ
    func exp(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexpf(&y, x, $0)
            return y
        }
    }
    
    
    /// 2ⁿ
    func exp2(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexp2(&y, x, $0)
            return y
        }
    }
    /// 2ⁿ
    func exp2(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexp2f(&y, x, $0)
            return y
        }
    }
    
    
    /// 𝒆ⁿ − 1
    func expm1(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexpm1(&y, x, $0)
            return y
        }
    }
    /// 𝒆ⁿ − 1
    func expm1(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvexpm1f(&y, x, $0)
            return y
        }
    }
    
    
    /// log(x[i])
    func log(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog(&y, x, $0)
            return y
        }
    }
    func log(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlogf(&y, x, $0)
            return y
        }
    }
    
    
    /// log(1 + x[i])
    func log1p(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog1p(&y, x, $0)
            return y
        }
    }
    func log1p(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog1pf(&y, x, $0)
            return y
        }
    }
    
    
    /// log₂(x[i])
    func log2(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog2(&y, x, $0)
            return y
        }
    }
    func log2(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog2f(&y, x, $0)
            return y
        }
    }
    
    /// log₁₀(x[i])
    func log10(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog10(&y, x, $0)
            return y
        }
    }
    func log10(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlog10f(&y, x, $0)
            return y
        }
    }
    
    
    // unbiased exponent of x
    func logb(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlogb(&y, x, $0)
            return y
        }
    }
    func logb(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvlogbf(&y, x, $0)
            return y
        }
    }
    
    
    // MARK: Array-Oriented Power Functions
    // pow(x[i], y[i])
    func pow(x: [Double], y: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = y
            vvpow(&z, y, x, $0)
            return z
        }
    }
    func pow(x: [Float], y: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = y
            vvpowf(&z, y, x, $0)
            return z
        }
    }
    
    
    // pow(x[i], y)
    func pows(x: [Double], var y: Double) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointers(&y, &n) {
            var z = x
            vvpows(&z, $0, x, $1) // z,y,x,n
            return z
        }
    }
    func pows(x: [Float], var y: Float) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointers(&y, &n) {
            var z = x
            vvpowsf(&z, $0, x, $1)
            return z
        }
    }
    
    
    // MARK: Array-Oriented Trigonometric Functions
    func sin(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsin(&y, x, $0)
            return y
        }
    }
    func sin(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsinf(&y, x, $0)
            return y
        }
    }
    
    
    // sin(π * x[i])
    func sinpi(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsinpi(&y, x, $0)
            return y
        }
    }
    func sinpi(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsinpif(&y, x, $0)
            return y
        }
    }
    
    
    func sincos(x: [Double]) -> (sin: [Double], cos: [Double]) {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            var y = x
            vvsincos(&z, &y, x, $0)
            return (z, y)
        }
    }
    func sincos(x: [Float]) -> (sin: [Float], cos: [Float]) {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var z = x
            var y = x
            vvsincosf(&z, &y, x, $0)
            return (z, y)
        }
    }
    
    
    func cos(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcos(&y, x, $0)
            return y
        }
    }
    func cos(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcosf(&y, x, $0)
            return y
        }
    }
    
    
    // cos(π * x[i])
    func cospi(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcospi(&y, x, $0)
            return y
        }
    }
    func cospi(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcospif(&y, x, $0)
            return y
        }
    }
    
    
    func tan(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtan(&y, x, $0)
            return y
        }
    }
    func tan(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtanf(&y, x, $0)
            return y
        }
    }
    
    
    // tan(π * x[i])
    func tanpi(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtanpi(&y, x, $0)
            return y
        }
    }
    func tanpi(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtanpif(&y, x, $0)
            return y
        }
    }
    
    
    func asin(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvasin(&y, x, $0)
            return y
        }
    }
    func asin(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvasinf(&y, x, $0)
            return y
        }
    }
    
    
    func acos(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvacos(&y, x, $0)
            return y
        }
    }
    func acos(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvacosf(&y, x, $0)
            return y
        }
    }
    
    
    func atan(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvatan(&y, x, $0)
            return y
        }
    }
    func atan(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvatanf(&y, x, $0)
            return y
        }
    }
    
    
    func atan2(y: [Double], x: [Double]) -> [Double] {
        var n = Int32(y.count)
        return withUnsafePointer(&n) {
            var z = y
            vvatan2(&z, y, x, $0)
            return z
        }
    }
    func atan2(y: [Float], x: [Float]) -> [Float] {
        var n = Int32(y.count)
        return withUnsafePointer(&n) {
            var z = y
            vvatan2f(&z, y, x, $0)
            return z
        }
    }
    
    
    // MARK: Array-Oriented Hyperbolic Functions
    func sinh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsinh(&y, x, $0)
            return y
        }
    }
    func sinh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvsinhf(&y, x, $0)
            return y
        }
    }
    
    
    func cosh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcosh(&y, x, $0)
            return y
        }
    }
    func cosh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvcoshf(&y, x, $0)
            return y
        }
    }
    
    
    func tanh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtanh(&y, x, $0)
            return y
        }
    }
    func tanh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvtanhf(&y, x, $0)
            return y
        }
    }
    
    
    func asinh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvasinh(&y, x, $0)
            return y
        }
    }
    func asinh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvasinhf(&y, x, $0)
            return y
        }
    }
    
    
    func acosh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvacosh(&y, x, $0)
            return y
        }
    }
    func acosh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvacoshf(&y, x, $0)
            return y
        }
    }
    
    
    func atanh(x: [Double]) -> [Double] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvatanh(&y, x, $0)
            return y
        }
    }
    func atanh(x: [Float]) -> [Float] {
        var n = Int32(x.count)
        return withUnsafePointer(&n) {
            var y = x
            vvatanhf(&y, x, $0)
            return y
        }
    }
    
    func pows(numbers:NSArray) -> NSDictionary {
        var x:[Float] = [Float]()
        for number in numbers as [NSNumber] {
            var value:Float = number.floatValue
            x.append(value)
        }
        
        var y:Float = 2
        var z:[Float] = pows(x, y:y)
        var mutable:NSMutableDictionary = NSMutableDictionary()
        
        for index in 0...numbers.count-1 {
            let key:NSNumber = numbers[index] as NSNumber;
            let value:NSNumber = NSNumber(float: z[index]);
            mutable[key] = value;
        }
        return mutable;
    }
}
