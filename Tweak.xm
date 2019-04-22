@interface AVCaptureConnection : NSObject
-(void)setAutomaticallyAdjustsVideoMirroring:(BOOL)arg1;
-(void)setVideoMirrored:(BOOL)arg1;
@end

@interface AVCaptureVideoPreviewLayer : CALayer
@property (nonatomic,readonly) AVCaptureConnection * connection;
@end

@interface CAMVideoPreviewView : UIView
@property (nonatomic,retain) AVCaptureVideoPreviewLayer * videoPreviewLayer;
-(void)layoutSubviews;
@end

%hook CAMVideoPreviewView
-(void)layoutSubviews {
	%orig;
	[[self.videoPreviewLayer connection] setAutomaticallyAdjustsVideoMirroring:NO];
	[[self.videoPreviewLayer connection] setVideoMirrored:NO];
}
%end