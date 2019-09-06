;; Assignment 1
;; Author: Brad Hanel


/* PART 1 - STATIC SPECTRUM */

instr Org1 
  ifreq = p4
  iamp = p5

  asig = oscili(1, ifreq)
  asig += oscili(0.75, ifreq * 2)
  asig += oscili(0.5, ifreq * 3)
  asig += oscili(0.25, ifreq * 4)
  asig += oscili(0.125, ifreq * 5)
  asig += oscili(0.0625, ifreq * 6)
  asig += oscili(0.03125, ifreq * 7)
  asig += oscili(0.015625, ifreq * 8)
  ;; keep following the pattern from above

  ;; multiply by the amplitude given by event parameters
  asig *= iamp

  ;; uncomment and fill in arguments for linen
  asig *= linen(1, 0.1, p3, 0.1)

  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; feel free to try different frequency and amplitude values!
schedule("Org1", 0, 2, 261, 1)

instr Org2 
endin

schedule("Org2", 0, 2, 220, 0.5)

instr Org3 
endin

schedule("Org3", 0, 2, 220, 0.5)


/* PART 2 - DYNAMIC SPECTRUM */

instr Dyn1
  ifreq = p4
  iamp = p5

  a1 = oscili(1, ifreq)
  a2 = oscili(0.5, ifreq * 2)
  ;; keep following the pattern from above

  ;; Envelopes
  aenv1 = adsr:a(0.1, 0.1, 1, 0.1)


  ;; Assemble output signal
  asig = (a1 + a2) * aenv1  ;; follow this pattern for a3-a8

  ;; multiply by the amplitude given by event parameters
  asig *= iamp

  asig = limit:a(asig, -1, 1)
  out(asig, asig)

endin
schedule("Dyn1", 0, 2, 220, 0.5)


instr Bell
  ifreq = p4
  iamp = p5

  asig = oscili(expon(1, p3, .001), ifreq)
  asig += oscili(expon(0.5, p3, .001), ifreq * 1.77)
  ;; keep following the pattern from above

  ;; multiply by the amplitude given by event parameters
  asig *= iamp

  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

schedule("Bell", 0, 2, 220, 0.5)


/* PART 3 - ANALYSIS-BASED SOUND */

instr Guitar
  ifreq = p4
  iamp = p5

  iend = ampdbfs(-90)

  asig = oscili(expon(ampdbfs(-28.6), p3, iend), ifreq)          ;; C4
  asig += oscili(expon(ampdbfs(-28.5), p3 * 0.95, iend), ifreq * 2)   ;; C5
  ;; keep following the pattern from above

  ;; multiply by the amplitude given by event parameters
  asig *= iamp * 8

  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

schedule("Guitar", 0, 2, cps2pch(8.00, 12), 0.5)