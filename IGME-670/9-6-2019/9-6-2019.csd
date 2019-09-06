; Schroeder Bell Sound

instr S1
  asig = oscili(0.5, 440)
  
  out(asig,asig)
endin

schedule("S1", 0, 2)