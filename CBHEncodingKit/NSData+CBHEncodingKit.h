//
//  NSData+CBHEncodingKit.h
//  CBHEncodingKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, June 2013.
//  Copyright (c) 2013, Christian Huxtable <chris@huxtable.ca>
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

@import Foundation.NSData;
@import Foundation.NSString;


NS_ASSUME_NONNULL_BEGIN


/** Adds encoding methods to `NSData`.
 *
 * @author              Chris Huxtable <chris@huxtable.ca>
 * @version             1.0
 */
@interface NSData (CBHEncodingKit)


#pragma mark - Base32 Encoding

/**
 * @name Base32 Encoding
 */

/** Creates a Base32 encoded string representation of the receiver.
 *
 * @return              A Base32 encoded string representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)encodeBase32;


/** Decodes a Base32 encoded data.
 *
 * @return              The Base632 decoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)decodeBase32;


#pragma mark - Base64 Encoding

/**
 * @name Base64 Encoding
 */

/** Creates a Base64 encoded string representation of the receiver.
 *
 * @return              A Base64 encoded string representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)encodeBase64;


/** Decodes a Base64 encoded data.
 *
 * @return              The Base64 decoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)decodeBase64;


#pragma mark - Generic Transforms

/**
 * @name Generic Transforms
 */

/** Encodes data using the Security provided transform type.
 *
 * @param transformType The Security provided transform type to use.
 *
 * @return              A encoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)encodeUsingTransform:(CFTypeRef)transformType;

/** Decodes data using the Security provided transform type.
 *
 * @param transformType The Security provided transform type to use.
 *
 * @return              A decoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)decodeUsingTransform:(CFTypeRef)transformType;

@end

NS_ASSUME_NONNULL_END
