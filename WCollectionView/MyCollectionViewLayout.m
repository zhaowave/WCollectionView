//
//  MyCollectionViewLayout.m
//  WCollectionView
//
//  Created by wei zhao on 2018/7/15.
//  Copyright © 2018 wei zhao. All rights reserved.
//

#import "MyCollectionViewLayout.h"

@implementation MyCollectionViewLayout


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *arr = [self getCopyOfAttributes:[super layoutAttributesForElementsInRect:rect]];
    
    //屏幕中线
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2.0f;
    
    //刷新cell缩放
    
    for(UICollectionViewLayoutAttributes *attributes in arr) {
        CGFloat distance = fabs(attributes.center.x - centerX);
        
        //把到中心点的距离，调整为cos（x） 的参数 x = 到中心的距离/宽度最大值 * (对应的角度最大值)
        CGFloat apartScale = distance/ self.collectionView.bounds.size.width;
        // -π/4到 +π/4这一个范围内  distantce * M_PI / self.collectionView.bounds.size.width
        
        CGFloat scale = fabs(cos(apartScale * M_PI/4));
        //设置比例，宽度变，高度按比例缩放
        
        attributes.transform = CGAffineTransformMakeScale(1.0, scale);
        
    }
    return arr;
}




- (NSArray*)getCopyOfAttributes:(NSArray*)attributes

{
    NSMutableArray *copyArr = [NSMutableArray new];
    for(UICollectionViewLayoutAttributes*attribute in attributes) {
        
        [copyArr addObject:[attribute copy]];
        
    }
    return copyArr;
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return  YES;
}

@end
