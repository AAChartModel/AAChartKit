Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '2.1.1'
    s.summary      = 'An elegant and friendly chart library for iOS developer'
    s.description  = <<-DESC
***
## Features:
1. Support `iOS 6`、`ARC` & `Objective C`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
***
                   DESC
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit'
    s.license      = { :type => "MIT", :file => 'LICENSE.md' }
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.source_files = 'AAChartKitLib', 'AAChartKitLib/**/*.{h,m}'
    s.resource_bundles    = { 'iOS-AAChartKitLib' => 'AAChartKitLib/AAJSFiles/**' }
    s.prefix_header_contents = '#import "AAGlobalMacro.h"'
    s.requires_arc = true
 end
