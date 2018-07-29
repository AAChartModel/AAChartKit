Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '3.0.2'
    s.summary      = '📈📊An elegant and friendly chart library for iOS . Powerful,supports line, spline, area, areaspline, column, bar, pie, scatter, angular gauges, arearange, areasplinerange, columnrange, bubble, box plot, error bars, funnel, waterfall and polar chart types.极其精美而又强大的 iOS 图表组件库,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.description  = <<-DESC
***
## Features

1. Support up from `iOS 6`, `ARC` support.
2. Powerful and easy to use. It supports `column chart`, `bar chart`, `area chart`, `areaspline chart`, `line chart`, `spline chart`, `radar chart`, `polar chart`, `pie chart`, `bubble chart`, `pyramid chart`, `funnel chart`, `columnrange chart`, `arearange chart`, `mixed chart` and other graphics. Support for more chart types is planned.
3. The charts are interactive and animated. The `animation` effect is exquisite, delicate, smooth and beautiful.
4. Supports `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`. The AAChartKit follows a minimalist formula: Chart view + Chart model = The chart you want, just like the powerful and beautiful charts lib [AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)
***
                   DESC
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit'
    s.license      = { :type => "MIT", :file => 'LICENSE' }
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.social_media_url = 'https://github.com/AAChartModel'
    s.source_files = 'AAChartKitLib/**/*.{h,m}'
    s.resources    = "AAChartKitLib/AAJSFiles.bundle"
    s.prefix_header_contents = '#import "AAGlobalMacro.h"'
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '7.0'
  end
