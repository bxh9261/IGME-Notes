;https://live.csound.com

instr S1
  iamp = p5
  ifreq = p4
  
  ;;aenv = expon(1, p3, .001)
  
  a1 = oscili(iamp, ifreq)
  a1 += oscili(iamp * 0.5, ifreq * 2)
  a1 += oscili(iamp * 0.25, ifreq * 3)
  a1 += oscili(iamp * 0.125, ifreq * 4)
  a1 += oscili(iamp * 0.0625, ifreq * 5)
  a1 += oscili(iamp * 0.03, ifreq * 6)
 
  
  ;;a1 *= aenv
  
  out(asig, asig)
endin

schedule("S1", 0, 1.5, 420, 0.5)
schedule("S1", 0, 3, 69, 0.5)