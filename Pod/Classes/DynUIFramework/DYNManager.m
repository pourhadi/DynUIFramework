//
//  DPStyleManager.m
//  TheQ
//
//  Created by Dan Pourhadi on 4/27/13.
//
//

#import "DYNManager.h"
#import "DYNDefines.h"
#import "DynUI.h"
#include "TargetConditionals.h"

@interface DYNManager ()
@property (nonatomic, strong) NSMutableArray *updateBlocks;
@property (nonatomic, strong) NSPointerArray *updateObservers;
@end

@implementation DYNManager

+ (DYNManager *)sharedInstance {
    static dispatch_once_t onceQueue;
    static DYNManager *instance = nil;
	
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (CIContext *)sharedCIContext {
    if (!_sharedCIContext) {
        _sharedCIContext = [CIContext contextWithOptions:nil];
    }
    return _sharedCIContext;
}

- (NSMutableArray *)styles {
    if (!_styles) {
        _styles = [NSMutableArray new];
    }
	
    return _styles;
}

- (NSMutableArray *)colorVariables {
    if (!_colorVariables) {
        _colorVariables = [NSMutableArray new];
    }
    return _colorVariables;
}

- (NSMutableArray *)textStyles {
    if (!_textStyles) {
        _textStyles = [NSMutableArray new];
    }
    return _textStyles;
}

- (NSMutableArray*)gradients
{
	if (!_gradients) {
		_gradients = [NSMutableArray new];
	}
	return _gradients;
}

- (DYNSliderStyle *)sliderStyleForName:(NSString *)name {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *filtered = [self.sliderStyles filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return filtered[0];
        }
    }
    return nil;
}

- (DYNViewStyle *)styleForName:(NSString *)name {
    @autoreleasepool {
        
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *filtered = [self.styles filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return filtered[0];
        }
    }
    return nil;
    }
}

- (UIColor *)colorForVariableName:(NSString *)variableName {
    @autoreleasepool {
        
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"variableName LIKE %@", variableName];
    NSArray *filtered = [self.colorVariables filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return [filtered[0] color];
        }
    }
    return nil;
    }
}

- (DYNTextStyle *)textStyleForName:(NSString *)name {
    @autoreleasepool {
        
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *filtered = [self.textStyles filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return filtered[0];
        }
    }
    return nil;
    }
}

- (DYNImageStyle *)imageStyleForName:(NSString *)name {
    @autoreleasepool {
        
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *filtered = [self.imageStyles filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return filtered[0];
        }
    }
    return nil;
    }
}

- (DYNGradient*)gradientForName:(NSString *)name
{
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"gradientName LIKE %@", name];
    NSArray *filtered = [self.gradients filteredArrayUsingPredicate:pred];
    if (filtered) {
        if (filtered.count > 0) {
            return filtered[0];
        }
    }
    return nil;
}

- (void)addSliderStyle:(DYNSliderStyle *)sliderStyle {
    [self.sliderStyles addObject:sliderStyle];
}

- (void)addViewStyle:(DYNViewStyle *)viewStyle {
    [self.styles addObject:viewStyle];
}

- (void)addColorVariable:(DYNColor *)colorVariable {
    [self.colorVariables addObject:colorVariable];
}

- (void)addTextStyle:(DYNTextStyle *)textStyle {
    [self.textStyles addObject:textStyle];
}

- (void)addImageStyle:(DYNImageStyle *)imageStyle {
    [self.imageStyles addObject:imageStyle];
}

- (void)registerView:(id)view {
    if (!self.registeredViews) {
        self.registeredViews = [NSArray array];
    }
	
	
    if (![self.registeredViews containsObject:view]) {
        NSMutableArray *mutable = [NSMutableArray arrayWithArray:self.registeredViews];
        [mutable addObject:view];
        [view addObserver:self forKeyPath:@"frame" options:0 context:nil];
        self.registeredViews = mutable;
    }
}

- (void)unregisterView:(id)view {
    if (self.registeredViews) {
        if ([self.registeredViews containsObject:view]) {
            [view removeObserver:self forKeyPath:@"frame"];
            NSMutableArray *mutable = [NSMutableArray arrayWithArray:self.registeredViews];
            [mutable removeObject:view];
            self.registeredViews = mutable;
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object respondsToSelector:@selector(dyn_frameChanged)]) {
        [object dyn_frameChanged];
    }
}

- (NSDictionary *)defaultParameterValues {
    if (!_defaultParameterValues) {
        _defaultParameterValues = [NSDictionary dictionary];
    }
    return _defaultParameterValues;
}

- (id)defaultValueForParameter:(NSString *)parameter {
    if ([self.defaultParameterValues objectForKey:parameter]) {
        return [self.defaultParameterValues objectForKey:parameter];
    }
	
    return nil;
}

+ (void)loadStylesFromFile:(NSString*)styleFileName replaceExisting:(BOOL)replaceExisting
{
    @autoreleasepool {
        
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:styleFileName ofType:nil]];
    NSError *error;

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    if (json) {
        [[DYNManager sharedInstance] processStyleDictionary:json replaceExisting:replaceExisting];
    }
    }

}

+ (void)setAutoUpdatePath:(NSString*)absolutePathToFile
{
#if (TARGET_IPHONE_SIMULATOR)

    @synchronized(self) {
        NSData *data = [NSData dataWithContentsOfFile:absolutePathToFile];
        NSError *error;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
        if (json) {
            [[DYNManager sharedInstance] processStyleDictionary:json replaceExisting:YES];
        }
        
        [CATransaction flush];
        
        [[DYNManager sharedInstance] watch:absolutePathToFile withCallback:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [DYNManager setAutoUpdatePath:absolutePathToFile];
            });
        }];
    }
#endif
}

- (void)loadStylesFromFileAbsolutePath:(NSString*)absolute resourcePath:(NSString*)resourcePath replaceExisting:(BOOL)replaceExisting liveUpdateIfPossible:(BOOL)liveUpdate
{
    @synchronized(self) {
        NSError *error;
        NSData *data;
		
        if (liveUpdate) {
            
#if (TARGET_IPHONE_SIMULATOR)
            
            if (absolute) {
                data = [NSData dataWithContentsOfFile:absolute];
                
                if (liveUpdate && !self.liveUpdating) {
                    _liveUpdating = YES;
                    [self watch:absolute withCallback:^{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self loadStylesFromFileAbsolutePath:absolute resourcePath:resourcePath replaceExisting:replaceExisting liveUpdateIfPossible:liveUpdate];
                        });
                    }];
                } else {
                    _liveUpdating = NO;
                }
                
                
            } else {
                data = [NSData dataWithContentsOfFile:resourcePath];
            }
#else
            data = [NSData dataWithContentsOfFile:resourcePath];
#endif
        } else {
            data = [NSData dataWithContentsOfFile:resourcePath];
        }
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
        if (json) {
            [self processStyleDictionary:json replaceExisting:replaceExisting];
        }
        
        [CATransaction flush];
    }
    
}

- (void)loadStylesFromFile:(NSString *)fileName replaceExisting:(BOOL)replaceExisting liveUpdate:(BOOL)liveUpdate {
    @synchronized(self) {
        NSError *error;
        NSData *data;
		
        if (liveUpdate) {
            data = [NSData dataWithContentsOfFile:fileName];
        } else {
            data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
        }
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
        if (json) {
            [self processStyleDictionary:json replaceExisting:replaceExisting];
        }
		
        [CATransaction flush];
        if (liveUpdate && !self.liveUpdating) {
            _liveUpdating = YES;
            [self watch:fileName withCallback:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self loadStylesFromFile:fileName replaceExisting:replaceExisting liveUpdate:liveUpdate];
                });
            }];
        } else {
            _liveUpdating = NO;
        }
    }
    
}

- (NSArray*)stylesForParentStyle:(NSDictionary*)dictionary
{
    NSMutableArray *tmp = [NSMutableArray new];
    for (NSDictionary *style in [dictionary objectForKey:@"children"]) {
        if ([[style objectForKey:@"isLeaf"] boolValue]) {
            DYNViewStyle *viewStyle = [[DYNViewStyle alloc] initWithDictionary:style];
            [tmp addObject:viewStyle];
        } else {
            
            [tmp addObjectsFromArray:[self stylesForParentStyle:style]];
            
        }
    }
    
    
    return tmp;
}

- (void)processStyleDictionary:(NSDictionary*)json replaceExisting:(BOOL)replaceExisting
{
    @autoreleasepool {
        
    
        NSArray *colors = [json objectForKey:@"colors"];
        NSMutableArray *colorTmp = [NSMutableArray arrayWithCapacity:1];
        for (NSDictionary *dict in colors) {
            [colorTmp addObject:[[DYNColor alloc] initWithDictionary:dict]];
        }
        if (replaceExisting) {
            self.colorVariables = colorTmp;
        } else {
            [self.colorVariables addObjectsFromArray:colorTmp];
        }
	
	NSArray *grads = [json objectForKey:@"gradients"];
	NSMutableArray *gradientTmp = [NSMutableArray new];
	for (NSDictionary *dict in grads) {
		[gradientTmp addObject:[[DYNGradient alloc] initWithDictionary:dict]];
	}
	
	if (replaceExisting) {
		self.gradients = gradientTmp;
	} else {
		[self.gradients addObjectsFromArray:gradientTmp];
	}
        
        NSArray *textStyles = [json objectForKey:@"textStyles"];
        NSMutableArray *textStylesTmp = [NSMutableArray arrayWithCapacity:1];
        for (NSDictionary *dict in textStyles) {
            [textStylesTmp addObject:[[DYNTextStyle alloc] initWithDictionary:dict]];
        }
        if (replaceExisting) {
            self.textStyles = textStylesTmp;
        } else {
            [self.textStyles addObjectsFromArray:textStylesTmp];
        }
        NSArray *styles = [json objectForKey:@"styles"];
        NSMutableArray *viewStyleTmp = [NSMutableArray arrayWithCapacity:1];
        for (NSDictionary *style in styles) {
            if ([[style objectForKey:@"isLeaf"] boolValue]) {
                DYNViewStyle *viewStyle = [[DYNViewStyle alloc] initWithDictionary:style];
                [viewStyleTmp addObject:viewStyle];
            } else {
                
                [viewStyleTmp addObjectsFromArray:[self stylesForParentStyle:style]];
                
            }
        }
        if (replaceExisting) {
            self.styles = viewStyleTmp;
        } else {
            [self.styles addObjectsFromArray:viewStyleTmp];
        }
        
        NSArray *sliderStyles = [json objectForKey:@"sliderStyles"];
        NSMutableArray *sliderTmp = [NSMutableArray new];
        for (NSDictionary *style in sliderStyles) {
            [sliderTmp addObject:[[DYNSliderStyle alloc] initWithDictionary:style]];
        }
        if (replaceExisting) {
            self.sliderStyles = sliderTmp;
        } else {
            [self.sliderStyles addObjectsFromArray:sliderTmp];
        }
        
        NSArray *imageStyles = [json objectForKey:@"imageStyles"];
        NSMutableArray *imgTemp = [NSMutableArray new];
        for (NSDictionary *style in imageStyles) {
            [imgTemp addObject:[[DYNImageStyle alloc] initWithDictionary:style]];
        }
        
        if (replaceExisting) {
            self.imageStyles = imgTemp;
        } else {
            [self.imageStyles addObjectsFromArray:imgTemp];
        }
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendUpdateNotification];
        });
        }
}

- (void)watch:(NSString *)path withCallback:(void (^)())callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    int fileDescriptor = open([path UTF8String], O_EVTONLY);
	
    __block dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_VNODE, fileDescriptor,
                                                              DISPATCH_VNODE_DELETE | DISPATCH_VNODE_WRITE | DISPATCH_VNODE_EXTEND,
                                                              queue);
    dispatch_source_set_event_handler(source, ^
									  {
										  unsigned long flags = dispatch_source_get_data(source);
										  if (flags) {
											  dispatch_source_cancel(source);
											  callback();
											  [self watch:path withCallback:callback];
										  }
									  });
    dispatch_source_set_cancel_handler(source, ^(void)
									   {
										   close(fileDescriptor);
									   });
    dispatch_resume(source);
}

- (void)sendUpdateNotification {
    //[[NSNotificationCenter defaultCenter] postNotificationName:kDYNThemeChangedNotification object:nil];
	
    for (id obj in self.registeredViews) {
        [obj dyn_refreshStyle];
    }
    
//    int x = 0;
//    NSMutableArray *tmp = [NSMutableArray new];
//    
    for (id obj in self.updateObservers) {
        if (obj != NULL) {
            [obj dyn_updateAppearance];
        }
    }
    
    for (id obj in self.updateObservers) {
        if (obj != NULL) {
            [obj dyn_resetAutoUpdateBlock];
        }
    }
    
    return;
    
    /*
    for (DYNAutoUpdateBlock block in self.updateBlocks) {
        id obj = [self.updateObservers pointerAtIndex:x];
        
        if (block && obj) {
            
            //__weak __typeof(&*obj) weakObj = obj;
               block(obj);
        } else {
            [self.updateObservers removePointerAtIndex:x];
            [tmp addObject:block];
        }
        x += 1;
    }
    
    if (tmp.count > 0) {
        for (DYNAutoUpdateBlock block in tmp ) {
            if ([self.updateBlocks containsObject:block])
                [self.updateBlocks removeObject:block];
        }
    }
    [tmp removeAllObjects];
    tmp = nil;
     */
}

- (NSMutableArray*)updateBlocks
{
    if (!_updateBlocks) {
        _updateBlocks = [NSMutableArray new];
    }
    
    return _updateBlocks;
}

- (NSPointerArray*)updateObservers
{
    if (!_updateObservers) {
        _updateObservers = [NSPointerArray weakObjectsPointerArray];
    }
    return _updateObservers;
}

- (void)attachAutoUpdateBlockToObject:(id)obj block:(DYNAutoUpdateBlockWithObject)block
{
    //  @synchronized(self) {
    if (block && obj) {
        [self removeAutoUpdateBlockFromObject:obj];
        
        //[self.updateBlocks addObject:block];
        [self.updateObservers addPointer:(__bridge void *)(obj)];
        
        __weak __typeof(&*obj) weakObj = obj;
        block(weakObj);
    }
    // }
}

- (void)removeAutoUpdateBlockFromObject:(id)obj
{
    /*
    @synchronized(self) {
    if ([self.updateObservers containsObject: obj]) {
        int x = [self.updateObservers indexOfObject:obj];
        if (x < self.updateBlocks.count) {
            [self.updateBlocks removeObjectAtIndex:x];
        }
        
        [self.updateObservers removeObject:obj];
        Block_release((__bridge void*)obj);
    }
    }
     */
}

@end
