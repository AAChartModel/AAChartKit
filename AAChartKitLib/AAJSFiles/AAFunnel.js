<!---->
<!--  Created by An An on 17/1/16.-->
<!--  Copyright © 2017年 An An. All rights reserved.-->
<!--  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code-->
<!---->

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

/*
 Highcharts JS v5.0.6 (2016-12-07)
 Highcharts funnel module
 
 (c) 2010-2016 Torstein Honsi
 
 License: www.highcharts.com/license
 */
(function(c){"object"===typeof module&&module.exports?module.exports=c:c(Highcharts)})(function(c){(function(c){var n=c.seriesType,z=c.seriesTypes,F=c.noop,G=c.each;n("funnel","pie",{animation:!1,center:["50%","50%"],width:"90%",neckWidth:"30%",height:"100%",neckHeight:"25%",reversed:!1,size:!0,dataLabels:{connectorWidth:1},states:{select:{color:"#cccccc",borderColor:"#000000",shadow:!1}}},{animate:F,translate:function(){var b=function(a,b){return/%$/.test(a)?b*parseInt(a,10)/100:parseInt(a,10)},
                                                                                                                                                                       c=0,e=this.chart,d=this.options,r=d.reversed,H=d.ignoreHiddenPoint,t=e.plotWidth,e=e.plotHeight,p=0,n=d.center,f=b(n[0],t),q=b(n[1],e),z=b(d.width,t),h,v,k=b(d.height,e),w=b(d.neckWidth,t),D=b(d.neckHeight,e),x=q-k/2+k-D,b=this.data,A,B,I="left"===d.dataLabels.position?1:0,C,l,E,u,g,y,m;this.getWidthAt=v=function(a){var b=q-k/2;return a>x||k===D?w:w+(z-w)*(1-(a-b)/(k-D))};this.getX=function(a,b){return f+(b?-1:1)*(v(r?2*q-a:a)/2+d.dataLabels.distance)};this.center=[f,q,k];this.centerX=f;G(b,function(a){H&&
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     !1===a.visible||(c+=a.y)});G(b,function(a){m=null;B=c?a.y/c:0;l=q-k/2+p*k;g=l+B*k;h=v(l);C=f-h/2;E=C+h;h=v(g);u=f-h/2;y=u+h;l>x?(C=u=f-w/2,E=y=f+w/2):g>x&&(m=g,h=v(x),u=f-h/2,y=u+h,g=x);r&&(l=2*q-l,g=2*q-g,m=m?2*q-m:null);A=["M",C,l,"L",E,l,y,g];m&&A.push(y,m,u,m);A.push(u,g,"Z");a.shapeType="path";a.shapeArgs={d:A};a.percentage=100*B;a.plotX=f;a.plotY=(l+(m||g))/2;a.tooltipPos=[f,a.plotY];a.slice=F;a.half=I;H&&!1===a.visible||(p+=B)})},drawPoints:z.column.prototype.drawPoints,sortByAngle:function(b){b.sort(function(b,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               c){return b.plotY-c.plotY})},drawDataLabels:function(){var b=this.data,c=this.options.dataLabels.distance,e,d,r,n=b.length,t,p;for(this.center[2]-=2*c;n--;)r=b[n],d=(e=r.half)?1:-1,p=r.plotY,t=this.getX(p,e),r.labelPos=[0,p,t+(c-5)*d,p,t+c*d,p,e?"right":"left",0];z.pie.prototype.drawDataLabels.call(this)}});n("pyramid","funnel",{neckWidth:"0%",neckHeight:"0%",reversed:!0})})(c)});
