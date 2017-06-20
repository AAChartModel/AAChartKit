Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '2.1.4'
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
    s.license      = { :type => "MIT", :file => 'LICENSE' }
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '7.0'
    s.prefix_header_contents = '#import "AAGlobalMacro.h"'
    s.prefix_header_file = 'AAChartKit/PrefixHeader.pch'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.social_media_url = 'https://github.com/AAChartModel'
    s.source_files = 'AAChartKitLib/**/*.{h,m}'
    s.resource_bundles    = { 'AAChartKitLib' => 'AAChartKitLib/AAJSFiles/**' }
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '7.0'
  end
