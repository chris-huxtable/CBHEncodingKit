# CBHEncodingKit

[![release](https://img.shields.io/github/release/chris-huxtable/CBHEncodingKit.svg)](https://github.com/chris-huxtable/CBHEncodingKit/releases)
[![pod](https://img.shields.io/cocoapods/v/CBHEncodingKit.svg)](https://cocoapods.org/pods/CBHEncodingKit)
[![licence](https://img.shields.io/badge/licence-ISC-lightgrey.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHEncodingKit/blob/master/LICENSE)
[![coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHEncodingKit)

An easy to use category for `NSData` and `NSString` to encode data.

Supports:
- Base32
- Base64


## Use

`CBHEncodingKit` extends `NSData` and `NSString` with a category; adding methods for several encoding types.

#### Examples:

Encode `NSData` using Base64:
```objective-c
NSData *data = /* some data */
NSString *base64 = [data encodeBase64];
```

Decode `NSData` encoded in Base64:
```objective-c
NSString *base64 = /* some base64 encoded string */
NSData *data = [base64 decodeBase64];
```

Encode `NSString` using Base64:
```objective-c
NSString *string = @"some string"
NSString *base64 = [string encodeBase64];
```

Decode `NSString` encoded in Base64:
```objective-c
NSString *base64 = /* some base64 encoded string */
NSString *string = [NSString stringByDecodingBase64String];
```


## Licence
CBHEncodingKit is available under the [ISC license](https://github.com/chris-huxtable/CBHEncodingKit/blob/master/LICENSE).
