//
//  NSData+CBHEncodingKit.m
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

@import CoreFoundation;
@import Security;


#import "NSData+CBHEncodingKit.h"


@implementation NSData (CBHEncodingKit)


#pragma mark - Base32 Encoding

- (NSString *)encodeBase32
{
	return [[[NSString alloc] initWithData:[self encodeUsingTransform:kSecBase32Encoding] encoding:NSUTF8StringEncoding] autorelease];
}

- (NSData *)decodeBase32
{
	return [self decodeUsingTransform:kSecBase32Encoding];
}


#pragma mark - Base64 Encoding

- (NSString *)encodeBase64
{
	return [[[NSString alloc] initWithData:[self encodeUsingTransform:kSecBase64Encoding] encoding:NSUTF8StringEncoding] autorelease];
}

- (NSData *)decodeBase64
{
	return [self decodeUsingTransform:kSecBase64Encoding];
}


#pragma mark - Transforms

- (NSData *)encodeUsingTransform:(CFTypeRef)transformType
{
	/// Cast to CoreFoundation
	CFDataRef sourceData = (CFDataRef)self;

	/// Pre-Define Variables
	CFErrorRef error = NULL;
	SecTransformRef encoder = NULL;
	CFDataRef encodedData = NULL;

	/// Perform Transform
	encoder = SecEncodeTransformCreate(transformType, &error);
	if ( error ) { goto fail; }

	SecTransformSetAttribute(encoder, kSecTransformInputAttributeName, sourceData, &error);
	if ( error ) { goto fail; }

	encodedData = SecTransformExecute(encoder, &error);
	if ( error ) { goto fail; }

	/// Cast back to Foundation
	NSData *returnData = (NSData *)encodedData;

	/// Cleanup
	CFRelease(encoder);

	return [returnData autorelease];

fail:
	if ( error ) { CFShow(error); }
	if ( encoder ) { CFRelease(encoder); }
	if ( encodedData ) { CFRelease(encodedData); }
	return nil;
}

- (NSData *)decodeUsingTransform:(CFTypeRef)transformType
{
	/// Cast to CoreFoundation
	CFDataRef sourceData = (CFDataRef)self;

	/// Pre-Define Variables
	CFErrorRef error = NULL;
	SecTransformRef decoder = NULL;
	CFDataRef decodedData = NULL;

	/// Perform Transform
	decoder = SecDecodeTransformCreate(transformType, &error);
	if ( error ) { goto fail; }

	SecTransformSetAttribute(decoder, kSecTransformInputAttributeName, sourceData, &error);
	if ( error ) { goto fail; }

	decodedData = SecTransformExecute(decoder, &error);
	if ( error ) { goto fail; }

	/// Cast back to Foundation
	NSData *returnData = (NSData *)decodedData;

	/// Cleanup
	CFRelease(decoder);

	return [returnData autorelease];

fail:
	if ( error ) { CFShow(error); }
	if ( decoder ) { CFRelease(decoder); }
	if ( decodedData ) { CFRelease(decodedData); }
	return nil;
}

@end
