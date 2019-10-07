<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
0dbfs = 1
nchnls = 2

;; Simple FM Synthesis using C:M of 1:2, index decaying from 1 to 0.1
instr FM
  ifreq = p4
  iamp = p5
  
  imod_freq = ifreq * 2
  
  amod = oscili(expon(1, p3, 0.1) * imod_freq, imod_freq)
 
  acar = oscili(1, ifreq + amod)

  asig = acar * iamp
  
  out(asig, asig)
endin


;; Phase Modulation (PM) Synthesis using C:M of 1:2 
;; index decaying from 1 to 0.1
instr PhaseMod
  ifreq = p4
  iamp = p5
  
  amod = oscili:a(expon(1 , p3, 0.1) , ifreq * 2) / (2 * $M_PI)
  
  aphs = phasor:a(ifreq)
  acar = sin((aphs + amod) * 2 * $M_PI)
  
  asig = acar * iamp
  
  out(asig, asig)
  
endin

;; Feedback Phase Modulation
;; Yamaha's X-series of synthesizers (DX7, TX816, etc.) implemented
;; Phase Modulation and introduced the possiblity of feeding back an 
;; operator's signal back into itself (feedback). In this case, the value
;; fed back is used to modulate the phase value.  This requires ksmps=1 
;; which means the audio block size is 1.  Most digital feedback calculations
;; require the previous sample's calculation. Since Csound is a block-rate 
;; system, we will need to use block sizes of 1 for this to work using 
;; Csound's opcodes, or we have to do our own single-sample processing in a loop. 
instr PhaseModFB
  ifreq = p4
  iamp = p5
  
  kindex = linseg:k(0, p3/2, 0.3, p3/2, 0)

  aphs = phasor:a(ifreq)
  acar init 0
  acar = sin((aphs + acar * kindex) * 2 * $M_PI)
  
  asig = acar * iamp
  
  out(asig, asig)
  
endin

</CsInstruments>
<CsScore>

i "PhaseMod" 0 2 440 0.5
i "FM" 3 2 440 0.5
i "PhaseModFB" 6 2 440 0.5

</CsScore>
</CsoundSynthesizer>