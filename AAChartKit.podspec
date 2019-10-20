Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '4.0.0'
    s.summary      = '📈📊🚀🚀🚀An elegant and friendly data visualization chart framework for Apple developers . Extremely powerful ,supports line, spline, area, areaspline, column, bar, pie, scatter, angular gauges, arearange, areasplinerange, columnrange, bubble, box plot, error bars, funnel, waterfall and polar chart types.极其精美而又强大的跨平台数据可视化图表框架,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.description  = <<-DESC
***
## Features:
1. Support `iOS 8+`、`ARC` & `Objective C`.
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
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.social_media_url = 'https://github.com/AAChartModel'
    s.source_files = 'AAChartKitLib/**/*.{h,m}'
    s.resource_bundles    = { 'AAChartKitLib' => 'AAChartKitLib/AAJSFiles.bundle' }
    s.prefix_header_contents = '#import "AAGlobalMacro.h"'
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '8.0'
  end
