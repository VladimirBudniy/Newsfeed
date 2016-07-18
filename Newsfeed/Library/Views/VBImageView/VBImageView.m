//
//  VBImageView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 26.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageView.h"
#import "VBImageModel.h"

@interface VBImageView ()
@property (nonatomic, strong) UIImageView               *imageView;
@property (nonatomic, strong) UIActivityIndicatorView   *spinner;
@property (nonatomic, strong) VBImageModel              *model;
@property (nonatomic, assign) UIViewContentMode         contentMode;

- (void)performSpinnerAnimation;
- (void)baseInit;
- (void)load;
- (void)dump;

@end

@implementation VBImageView

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (void)baseInit {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    self.imageView = imageView;
    [self performSpinnerAnimation];
    self.model = [VBImageModel new];
}


#pragma mark -
#pragma mark Accessors

- (void)setModel:(VBImageModel *)model {
    if (_model != model) {
        _model = model;
        
        VBWeakSelfMacro;
        [_model addHandler:^(UIImage *image){
            VBStrongSelfAndReturnNilMacro
            strongSelf.imageView.image = image;
            [strongSelf.spinner stopAnimating];
        } forState:kVBModelLoadedState
                    object:self];
        
        [_model addHandler:^(UIImage *image){
            VBStrongSelfAndReturnNilMacro
            strongSelf.model.URL = strongSelf.URL;
        } forState:kVBModelFailedState
                    object:self];
    }
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    if (_contentMode != contentMode) {
        _contentMode = contentMode;
        
        self.imageView.contentMode = _contentMode;
    }
}

- (void)setURL:(NSURL *)URL {
    if (_URL != URL) {
        _URL = URL;
        
        [self dump];
        [self load];
    }
}

#pragma mark -
#pragma mark Private

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.spinner.center = self.imageView.center;
}

#pragma mark -
#pragma mark Private

- (void)dump {
    self.imageView.image = nil;
}

- (void)load {
    [self.spinner startAnimating];
    self.model.URL = self.URL;
}

- (void)performSpinnerAnimation {
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    spinner.color = [UIColor blackColor];
    UIImageView *imageView = self.imageView;
    [imageView addSubview:spinner];
    spinner.center = self.center;
    spinner.hidesWhenStopped = YES;
    self.spinner = spinner;
}

@end

