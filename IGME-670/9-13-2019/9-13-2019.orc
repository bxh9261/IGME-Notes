instr S1
  
  ifreq = p4
  iamp = p5
  
  asig = vco2(iamp, ifreq * (1 + int(5 * phasor:k(1))))
  
  a1 = reson(asig, ifreq, 20)
  a2 = reson(asig, ifreq * 2, 20)
  
  asig = a1 + a2
  
  asig *= iamp * 0.125
  
  asig = limit:a(asig, -1, 1)
  
  out(asig, asig)
  
endin

schedule("S1", )

instr S3
  ifreq = cpsmidinn(48)
  asig = random:a(-1,1)
  asig += vco2(1, ifreq)
  
  anoise = random:a(-1,1) * 0.3
  asig += anoise * expon(1, 0.05, 0.001)
  
  asig = zdf_ladder(asig, expon(8000, p3, 30), 0.5)
  ;;asig = zdf_ladder(asig, expon(8000, 0.1, 30), 0.5)
  
  asig = mode(anoise, ifreq, 100)
  asig += mode(anoide, ifreq * 2, 100)
  asig += mode(anoise, ifreq * 3, 200)
  
  
  asig *= 0.25
  out(asig, asig)
endin

schedule("S3", 0, 1)

;;console down below