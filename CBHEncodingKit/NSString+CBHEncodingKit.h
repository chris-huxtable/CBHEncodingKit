//
//	NSString+CBHEncodingKit.h
//	CBHEncodingKit
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

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/** Adds encoding methods to `NSString`.
 *
 * @author              Chris Huxtable <chris@huxtable.ca>
 * @version             1.0
 */
@interface NSString (CBHEncodingKit)


#pragma mark - Base32 Encoding

/**
 * @name Base32 Encoding
 */

/** Creates a Base32 encoded representation of the receiver serialized as a UTF-8 String.
*
* @return              The Base32 encoded string representing the receiver or nil if there is an error.
*/
- (nullable NSString *)encodeBase32;

/** Creates a Base32 encoded representation of the receiver.
 *
 * @param encoding	The string encoding to use to serialize the receiver.
 *
 * @return              A Base632 encoded representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)encodeBase32WithStringEncoding:(NSStringEncoding)encoding;

/** Decodes a Base32 encoded string.
 *
 * @return              The Base32 decoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)decodeBase32;

/** Decodes a Base32 encoded string as a UTF-8 encoded string.
 *
 * @return              The Base32 decoded String representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)stringByDecodingBase32String;

/** Decodes a Base32 encoded string as a string.
 *
 * @param encoding      The string encoding to use to serialize the resultant string.
 *
 * @return              The Base32 decoded String representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)stringByDecodingBase32StringWithStringEncoding:(NSStringEncoding)encoding;


#pragma mark - Base64 Encoding

/**
 * @name Base64 Encoding
 */

/** Creates a Base64 encoded representation of the receiver serialized as a UTF-8 String.
 *
 * @return              The Base64 encoded string representing the receiver or nil if there is an error.
 */
- (nullable NSString *)encodeBase64;

/** Creates a Base64 encoded representation of the receiver.
 *
 * @param encoding      The string encoding to use to serialize the receiver.
 *
 * @return              A Base64 encoded representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)encodeBase64WithStringEncoding:(NSStringEncoding)encoding;

/** Decodes a Base64 encoded string.
 *
 * @return              The Base64 decoded representation of the receiver or nil if there is an error.
 */
- (nullable NSData *)decodeBase64;

/** Decodes a Base64 encoded string as a UTF-8 encoded string.
 *
 * @return              The Base64 decoded String representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)stringByDecodingBase64String;

/** Decodes a Base64 encoded string as a string.
 *
 * @param encoding      The string encoding to use to serialize the resultant string.
 *
 * @return              The Base64 decoded String representation of the receiver or nil if there is an error.
 */
- (nullable NSString *)stringByDecodingBase64StringWithStringEncoding:(NSStringEncoding)encoding;

@end

NS_ASSUME_NONNULL_END
