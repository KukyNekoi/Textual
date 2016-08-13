/* ********************************************************************* 
                  _____         _               _
                 |_   _|____  _| |_ _   _  __ _| |
                   | |/ _ \ \/ / __| | | |/ _` | |
                   | |  __/>  <| |_| |_| | (_| | |
                   |_|\___/_/\_\\__|\__,_|\__,_|_|

  Copyright (c) 2010 - 2016 Codeux Software, LLC & respective contributors.
        Please see Acknowledgements.pdf for additional information.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Textual and/or "Codeux Software, LLC", nor the 
      names of its contributors may be used to endorse or promote products 
      derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

 *********************************************************************** */

NS_ASSUME_NONNULL_BEGIN

@implementation TDCBuddyListDialogCellView

- (BOOL)wantsLayer
{
	return YES;
}

- (NSViewLayerContentsRedrawPolicy)layerContentsRedrawPolicy
{
	return NSViewLayerContentsRedrawOnSetNeedsDisplay;
}

- (NSString *)nickname
{
	TDCBuddyListDialogEntry *objectValue = self.objectValue;

	if (objectValue == nil) {
		return NSStringEmptyPlaceholder;
	}

	return objectValue.nickname;
}

- (NSString *)networkName
{
	TDCBuddyListDialogEntry *objectValue = self.objectValue;

	if (objectValue == nil) {
		return NSStringEmptyPlaceholder;
	}

	return objectValue.client.networkNameAlt;
}

- (NSImage *)availabilityImage
{
	TDCBuddyListDialogEntry *objectValue = self.objectValue;

	NSString *imageName = nil;

	switch (objectValue.availability) {
		case IRCAddressBookUserTrackingIsAvailalbeStatus:
		{
			imageName = @"NSStatusAvailable";

			break;
		}
		case IRCAddressBookUserTrackingIsNotAvailalbeStatus:
		{
			imageName = @"NSStatusUnavailable";

			break;
		}
		case IRCAddressBookUserTrackingIsAwayStatus:
		{
			imageName = @"NSStatusPartiallyAvailable";

			break;
		}
		default:
		{
			imageName = @"NSStatusNone";

			break;
		}
	}

	return [NSImage imageNamed:imageName];
}

- (void)setObjectValue:(nullable id)objectValue
{
	super.objectValue = objectValue;

	[self reloadKeyValues];
}

- (void)reloadKeyValues
{
	[self willChangeValueForKey:@"nickname"];
	[self didChangeValueForKey:@"nickname"];

	[self willChangeValueForKey:@"networkName"];
	[self didChangeValueForKey:@"networkName"];

	[self willChangeValueForKey:@"availabilityImage"];
	[self didChangeValueForKey:@"availabilityImage"];
}

@end

NS_ASSUME_NONNULL_END
