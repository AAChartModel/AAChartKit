Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '5.0.4'
    s.summary      = '📈📊🚀🚀🚀An elegant modern declarative data visualization chart framework for iOS, iPadOS and macOS. Extremely powerful, supports line, spline, area, areaspline, column, bar, pie, scatter, angular gauges, arearange, areasplinerange, columnrange, bubble, box plot, error bars, funnel, waterfall and polar chart types. 极其精美而又强大的跨平台数据可视化图表框架,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.description  = <<-DESC
***
## Features
* 🎂  **Environment friendly**. Support `iOS `、`iPadOS`  and `macOS`. Totally support `Objective-C` language, and there are more types version such as  `Swift` language version [AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift) 、 `Java` language version [AAChartCore](https://github.com/AAChartModel/AAChartCore) 、`Kotlin` language version [AAInfographics](https://github.com/AAChartModel/AAChartCore-Kotlin) . To get more details you can see the [source code links list](https://github.com/AAChartModel/AAChartKit#source-code).

* 🚀  **Powerful and easy to use**. It supports `column chart`, `bar chart`, `area chart`, `areaspline chart`, `line chart`, `spline chart`, `radar chart`, `polar chart`, `pie chart`, `bubble chart`, `pyramid chart`, `funnel chart`, `columnrange chart`, `arearange chart`, `mixed chart` and other graphics. Support for more chart types is planned.

* 📝  **Modern Declarative Syntax**. Unlike previous imperative programming techniques, drawing any custom chart in AAChartKit, you don't need to care about the inner implementation details which is annoying && boring. *Describe what you want, you will get what you described*.

* 🎮  **Interactive and animated**. The charts `animation` effect is exquisite, delicate, smooth and beautiful.

* ⛓  **Chain programming**.  Supports `chain programming syntax` like *Masonry* .

* 🦋  **Minimalist**. `AAChartView + AAChartModel = Chart`. The AAChartKit follows a minimalist formula: Chart view + Chart model = The chart you want, just like the powerful and beautiful charts lib [AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift).

* 🖱 **Interaction event callback**. Support for monitoring [user click events and single finger move over events](#support-user-click-events-and-move-over-events), which can be used to achieve double charts linked-working and even multiple charts linkage, as well as other more complex custom user interaction effects.


***
                   DESC
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit'
    s.license      = { :type => "MIT", :file => 'LICENSE' }
    s.authors      = {'An An' => '2236368544@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.social_media_url = 'https://github.com/AAChartModel'
    s.source_files = 'AAChartKitLib/**/*.{h,m}'
    s.resource_bundles    = { 'AAChartKitLib' => 'AAChartKitLib/AAJSFiles.bundle' }
    s.prefix_header_contents = '#import "AAGlobalMacro.h"'
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '8.0'
  end
