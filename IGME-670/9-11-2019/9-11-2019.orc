instr S1
  asig = vco2(ampdbfs(-12), cps2pch(7.00,12))
  
  asig = zdf_ladder(asig, expon(10000, p3, 60), .5) ;;filters out higher notes
  
  out(asig, asig)
  
endin

schedule("S1", 0, 5)