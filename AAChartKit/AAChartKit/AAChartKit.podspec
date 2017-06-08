Pod::Spec.new do |s|
    s.name         = 'AAChartKit'
    s.version      = '2.0.0'
    s.summary      = 'An elegant and friendly chart library for iOS developer'
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit'
    s.license      = 'MIT'
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit.git', :tag => s.version}
    s.source_files = 'AAChartKit', 'AAChartKit/**/*.{h,m}'
    s.requires_arc = true
 end
