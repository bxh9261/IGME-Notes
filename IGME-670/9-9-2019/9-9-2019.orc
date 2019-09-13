;;3/2 relationship is a fifth
 
instr P1 

  ifeq = p4
  iamp = p5
  
  asig = vco2(iamp, ifreq, 12)
  
  ;;asig = zdf_ladder(asig, 500, 0.5) ;;static
  ;;asig = zdf_ladder(asig, expon(100, p3, 8000), .5) ;;dynamic with ladder filter
  asig = zdf_2pole(asig, expon(100, p3, 8000), .5) ;;dynamic with 2pole filter
  
  ;;asig *= expon(1, p3, .001)
  
  out(asig, asig)

endin

schedule("P1", 0, 2, cpspch(7.00), 0.5)
schedule("P1", 0, 2, cpspch(8.07,24), 0.5)
  
  ;; look up cpspch (pitch), cpsoct (octave), cpsmidinn (MIDI note number), vco2 (saw)