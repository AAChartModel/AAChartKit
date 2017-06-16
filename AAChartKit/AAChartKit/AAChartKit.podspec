Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '2.0.7'
    s.summary      = '
An elegant and friendly chart library for iOS developer
***
## Features:
1. Support `iOS 6`、`ARC` & `Objective C`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
***

'
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit'
    s.license      = 'MIT'
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.source_files = 'AAChartKit', 'AAChartKit/*.{h,m}'
    s.requires_arc = true
 end
