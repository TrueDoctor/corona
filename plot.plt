set grid xtics mxtics ytics mytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500
set samples 300, 300
set style data lines
set ytics  norangelimit logscale autofreq
set title "COVID 19 Spread Germany" 
set xlabel "Time" 
set ylabel "Number of cases, deaths and recoveries"
set y2label "lethality %"
set logscale y 10
maxy = 1000000
maxy2 = 30

factor = (log10(maxy)) * (100/maxy2)

set yrange [1:maxy]
set y2range [0:maxy2]
set y2tics scale default
set xdata time
set timefmt "%Y-%m-%d"

plot 'data' u 1:2 w p lc rgb "blue" t "active cases", \
     'data' u 1:2 smooth sbezier lc "blue" notitle, \
     'data' u 1:3 w p lc rgb "orange" t "total cases", \
     'data' u 1:3 smooth sbezier lc "orange" notitle, \
     'data' u 1:4 w p lc rgb "cyan" t "interpolated cases", \
     'data' u 1:4 smooth sbezier lc "cyan" notitle, \
     'data' u 1:5 w p lc rgb "black" t "deaths", \
     'data' u 1:5 smooth sbezier lc "black" notitle, \
     'data' u 1:6 w p lc rgb "green" t "recoveries", \
     'data' u 1:6 smooth frequency lc "green" notitle, \
     'data' u 1:(10**$7 * 10**($7 * factor - $7)) w p lc rgb "red" t "lethality", \
     'data' u 1:(10**$7 * 10**($7 * factor - $7)) smooth sbezier lc "red" notitle;

pause mouse close
