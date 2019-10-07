;;incorrect - series

gisine = ftgen(0, 0, 65536, 10, 1) 
instr Osc1_4
  iamp = p5
  ifreq = p4
  inyquist = (sr / 2)  ;; sr is a global variable equal to sample rate
  inum_harmonics = inyquist / ifreq  ;; for use with buzz

  ;; 1. Use buzz opcode for sound source. 
  asig = buzz(1, p4, inum_harmonics, gisine)
  ;; 2. Use "bank" of butterbp to process buzz, Soprano 'o' formants
  asig = reson(asig, 450, 40) * ampdbfs(0)
  asig = reson(asig, 800, 80) * ampdbfs(-11)
  asig = reson(asig, 2830, 100) * ampdbfs(-22)
  asig = reson(asig, 3800, 120) * ampdbfs(-22)
  asig = reson(asig, 4950, 120) * ampdbfs(-50)
  ;; 3. Further multiply by adsr envelope
  asig *= adsr(p3/4, p3/4, 0.4, p3/4)

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;;correct - parallel

gisine = ftgen(0, 0, 65536, 10, 1) 
instr Osc1_4
  iamp = p5
  ifreq = p4
  inyquist = (sr / 2)  ;; sr is a global variable equal to sample rate
  inum_harmonics = inyquist / ifreq  ;; for use with buzz

  ;; 1. Use buzz opcode for sound source. 
  asig = buzz(1, p4, inum_harmonics, gisine)
  ;; 2. Use "bank" of butterbp to process buzz, Soprano 'o' formants
  a1 = reson(asig, 450, 40) * ampdbfs(0)
  a2 = reson(asig, 800, 80) * ampdbfs(-11)
  a3 = reson(asig, 2830, 100) * ampdbfs(-22)
  a4 = reson(asig, 3800, 120) * ampdbfs(-22)
  a5 = reson(asig, 4950, 120) * ampdbfs(-50)
  asig = a1 + a2 +a3 + a4 + a5
  ;; 3. Further multiply by adsr envelope
  asig *= adsr(p3/4, p3/4, 0.4, p3/4)

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin