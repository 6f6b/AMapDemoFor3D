//
//  MaMapViewController.m
//  AMapDemo
//
//  Created by LiuFeng on 16/2/3.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MaMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "Tools.h"

@interface MaMapViewController ()<MAMapViewDelegate>
@property (weak, nonatomic) IBOutlet MAMapView *mapView;

@end

@implementation MaMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
//    for (int i=0; i<210; i++) {
//        MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
//        annotation.title = @"天安门";
//        annotation.subtitle = @"北京天安门";
//        self.mapView.delegate = self;
//        
//        annotation.coordinate = CLLocationCoordinate2DMake(arc4random()%1000*0.001+39,arc4random()%1000*0.001+116);
//        [self.mapView addAnnotation:annotation];
//    }

    // Do any additional setup after loading the view from its nib.
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if (updatingLocation) {
        NSLog(@"经度：%f",userLocation.coordinate.latitude);
        NSLog(@"纬度：%f",userLocation.coordinate.longitude);
    }
}

#pragma mark -- 切换卫星/普通
- (IBAction)dealBtn1:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.mapType = MAMapTypeSatellite;
    }
    if (!button.selected) {
        self.mapView.mapType = MAMapTypeStandard;
    }
}

#pragma mark -- 显示/隐藏交通状况
- (IBAction)dealBtn2:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.showTraffic = YES;
    }
    if (!button.selected) {
        self.mapView.showTraffic = NO;
    }
}
#pragma mark -- 显示/隐藏标注
- (IBAction)dealBtn3:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
        annotation.title = @"天安门";
        annotation.subtitle = @"北京天安门";
        annotation.coordinate = CLLocationCoordinate2DMake(39.989631,116.481018);
        [self.mapView addAnnotation:annotation];
    }
    if (!button.selected) {
        self.mapView.showTraffic = NO;
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    
    
    MAPinAnnotationView *annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    annotationView.canShowCallout = YES;
    annotationView.animatesDrop = YES;
    annotationView.draggable = YES;
    //    annotationView.backgroundColor = [UIColor purpleColor];
    annotationView.pinColor = MAPinAnnotationColorPurple;
    return annotationView;
    //    return nil;
}


#pragma mark -- 显示/隐藏折线
- (IBAction)dealBtn4:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        
        CLLocationCoordinate2D commonPolylineCoords[4];
        commonPolylineCoords[0].latitude = 39.832136;
        commonPolylineCoords[0].longitude = 116.34095;
        
        commonPolylineCoords[1].latitude = 39.832136;
        commonPolylineCoords[1].longitude = 116.42095;
        
        commonPolylineCoords[2].latitude = 39.902136;
        commonPolylineCoords[2].longitude = 116.42095;
        
        commonPolylineCoords[3].latitude = 39.902136;
        commonPolylineCoords[3].longitude = 116.44095;
        MAPolyline *polyline = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:4];
        [self.mapView addOverlay:polyline];
        NSLog(@"shit");
    }
    if (!button.selected) {
    }
}


#pragma mark -- 显示/隐藏多边形
- (IBAction)dealBtn5:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        CLLocationCoordinate2D commonPolylineCoords[4];
        commonPolylineCoords[0].latitude = 39.832136;
        commonPolylineCoords[0].longitude = 116.34095;
        
        commonPolylineCoords[1].latitude = 39.832136;
        commonPolylineCoords[1].longitude = 116.42095;
        
        commonPolylineCoords[2].latitude = 39.902136;
        commonPolylineCoords[2].longitude = 116.42095;
        
        commonPolylineCoords[3].latitude = 39.902136;
        commonPolylineCoords[3].longitude = 116.44095;
        MAPolygon *polyline = [MAPolygon polygonWithCoordinates:commonPolylineCoords count:4];
        [self.mapView addOverlay:polyline];    }
    if (!button.selected) {
        self.mapView.showTraffic = NO;
    }
}

#pragma mark -- 显示/隐藏圆
- (IBAction)dealBtn6:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.902136, 116.42095) radius:5000];
        [self.mapView addOverlay:circle];
    }
    if (!button.selected) {
        
    }
}

#pragma mark -- 显示/隐藏大地曲线
- (IBAction)dealBtn7:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        CLLocationCoordinate2D geodesicCoords[2];
        geodesicCoords[0].latitude = 42.905151;
        geodesicCoords[0].longitude = 116.401726;
        
        geodesicCoords[1].latitude = 38.905151;
        geodesicCoords[1].longitude = 70.401726;
        MAGeodesicPolyline *geodesicPolyline = [MAGeodesicPolyline polylineWithCoordinates:geodesicCoords count:2];
        [self.mapView addOverlay:geodesicPolyline];
    }
    if (!button.selected) {
        
    }
}

#pragma mark -- 显示/隐藏自定义图片
- (IBAction)dealBtn8:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        MACoordinateBounds coordinateBounds = MACoordinateBoundsMake(CLLocationCoordinate2DMake(39.939577, 116.388331), CLLocationCoordinate2DMake(39.935029, 116.384377));
        MAGroundOverlay *groundOverPlay = [MAGroundOverlay groundOverlayWithBounds:coordinateBounds icon:[UIImage imageNamed:@"订单完成"]];
        [self.mapView addOverlay:groundOverPlay];
        self.mapView.visibleMapRect = groundOverPlay.boundingMapRect;
    }
    if (!button.selected) {
        
    }
}

#pragma mark -- 显示/隐藏自定义图层
- (IBAction)dealBtn9:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.centerCoordinate   = CLLocationCoordinate2DMake(39.910695, 116.372830);
        self.mapView.zoomLevel          = 19;
        
        [self.mapView addOverlay: [self constructTileOverlayWithFloor:2]];    }
    if (!button.selected) {
        
    }
}

#pragma mark -- 显示/隐藏热力图层
- (IBAction)dealBtn10:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        MAHeatMapTileOverlay *heatMaptileOverlay = [[MAHeatMapTileOverlay alloc] init];
        NSMutableArray *data = [NSMutableArray array];
        
        //设置哪些坐标点显示热力图层
        for (int i=0; i<10000; i++) {
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = arc4random()%18000*0.01;
            coordinate.longitude = arc4random()%18000*0.01;
            MAHeatMapNode *node = [[MAHeatMapNode alloc] init];
            node.coordinate = coordinate;
            node.intensity = 1;
            [data addObject:node];
        }
        heatMaptileOverlay.data = data;
        //设置热力图层的渐变属性
        MAHeatMapGradient *gradient = [[MAHeatMapGradient alloc] initWithColor:@[[UIColor blueColor],[UIColor greenColor],[UIColor redColor]] andWithStartPoints:@[@(0.2),@(0.5),@(0.9)]];
        heatMaptileOverlay.gradient = gradient;
        heatMaptileOverlay.allowRetinaAdapting = YES;
        [self.mapView addOverlay:heatMaptileOverlay];
    }
    if (!button.selected) {
        
    }
}

#pragma mark -- 显示/隐藏指南针
- (IBAction)dealBtn11:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.showsCompass = NO;
//        self.mapView.compassOrigin设置指南针的位置
    }
    if (!button.selected) {
        self.mapView.showsCompass = YES;
    }
}

#pragma mark -- 显示/隐藏比例尺
- (IBAction)dealBtn12:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.showsScale = NO;
    }
    if (!button.selected) {
        self.mapView.showsScale = YES;
    }
}

#pragma mark -- 截屏
- (IBAction)dealBtn13:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    UIImage *image = [self.mapView takeSnapshotInRect:self.mapView.bounds];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
//    if (button.selected) {
//        
//    }
//    if (!button.selected) {
//        
//    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"成功");
}

#pragma mark -- 开启／关闭定位
- (IBAction)dealBtn14:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
        self.mapView.showsUserLocation = YES;
        [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    }
    if (!button.selected) {
        self.mapView.showsUserLocation = NO;
    }
}

#pragma mark -- 显示/隐藏
- (IBAction)dealBtn15:(id)sender {
    UIButton *button = sender;
    button.selected = !button.selected;
    
    if (button.selected) {
    }
    if (!button.selected) {
        
    }
}

- (MATileOverlay *)constructTileOverlayWithFloor:(NSInteger)floor
{
    //
    /* 构建tileOverlay的URL模版. */
    NSString *URLTemplate = [NSString stringWithFormat: @"http://sdkdemo.amap.com:8080/tileserver/Tile?x={x}&y={y}&z={z}&f=%ld", (long)floor];
    
    MATileOverlay *tileOverlay = [[MATileOverlay alloc] initWithURLTemplate:URLTemplate];
    
    tileOverlay.minimumZ = 18; //设置可见最小Zoom值
    tileOverlay.maximumZ = 20; //设置可见最大Zoom值
    
    tileOverlay.boundingMapRect = MAMapRectForCoordinateRegion(MACoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(39.910695, 116.372830), 200, 200)); //设置可渲染区域
    
    return tileOverlay;
}


#pragma mark -- 代理方法用于返回覆盖对象的View
- (MAOverlayView*)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay{
    if ([NSStringFromClass([MAPolyline class]) isEqualToString:NSStringFromClass([overlay class])]) {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        polylineView.lineWidth = 10.0;
        polylineView.strokeColor = [UIColor greenColor];
        polylineView.lineJoinType = kMALineJoinMiter;
        polylineView.lineCapType = kMALineCapButt;
        return polylineView;
    }
    if ([NSStringFromClass([MAPolygon class]) isEqualToString:NSStringFromClass([overlay class])]) {
        MAPolygonView *polygonView = [[MAPolygonView alloc] initWithPolygon:overlay];
        polygonView.lineWidth = 4.0;
        polygonView.strokeColor = [UIColor greenColor];
        polygonView.fillColor = [UIColor redColor];
        polygonView.lineJoinType = kMALineJoinRound;
        polygonView.lineCapType = kMALineCapArrow;
        return polygonView;
    }
    if ([overlay isKindOfClass:[MACircle class]]) {
        MACircleView *circleView = [[MACircleView alloc] initWithCircle:overlay];
        circleView.lineWidth = 20;
        circleView.lineCapType = kMALineCapArrow;
        circleView.lineJoinType = kMALineJoinMiter;
        circleView.fillColor = [UIColor colorWithRed:0.500 green:0.000 blue:0.500 alpha:0.190];
        circleView.lineDash = YES;
        return circleView;
    }
    if ([overlay isMemberOfClass:[MAGeodesicPolyline class]]) {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        polylineView.lineWidth = 3;
        polylineView.strokeColor = [UIColor yellowColor];
        return polylineView;
    }
    if ([overlay isMemberOfClass:[MAGroundOverlay class]]) {
        MAGroundOverlayView *groundOverLayView = [[MAGroundOverlayView alloc] initWithGroundOverlay:overlay];
        return groundOverLayView;
    }

    if ([overlay isMemberOfClass:[MATileOverlay class]]) {
        MATileOverlayView *tileOverlayView = [[MATileOverlayView alloc] initWithTileOverlay:overlay];
        return tileOverlayView;
    }
    if ([overlay isMemberOfClass:[MAHeatMapTileOverlay class]]) {
        MATileOverlayView *tileOverlayView = [[MATileOverlayView alloc] initWithTileOverlay:overlay];
        return tileOverlayView;
        
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
