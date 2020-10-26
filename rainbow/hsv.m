#import <Cocoa/Cocoa.h>

typedef struct col {
	unsigned char r;
	unsigned char g;
	unsigned char b;
} col;

void shiftHue(col* color, float shift) {
	//printf("it was %d\n", color->r);
	NSColor* unshifted = [[NSColor colorWithRed:color->r/255.0 green:color->g/255.0 blue:color->b/255.0 alpha:1.0] colorUsingColorSpace:NSColorSpace.sRGBColorSpace];

	CGFloat hue, sat, bri;

	[unshifted getHue:&hue saturation:&sat brightness:&bri alpha:nil];

	hue += (shift/360);
	hue = fmod(hue, 1.0);


	NSColor* shifted = [NSColor colorWithHue:hue saturation:sat brightness:bri alpha:1.0];

	CGFloat red, green, blue;

	[shifted getRed:&red green:&green blue:&blue alpha:nil];

	color->r = red*255;
	color->g = green*255;
	color->b = blue*255;

	//printf("now its %lf\n", red);
}