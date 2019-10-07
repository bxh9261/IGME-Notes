;; Author: Steven Yi
;; Class 5.1 Example Code

;; COMPLEX FM (More than 2 operators)

;; ============================================================================
;; Example FM_PCIM
;; 4 Operator FM Synthesis, Parallel Carriers, Independent Modulators
;;  
;; M1 --> C1
;; M2 --> C2
;; 
;; Essentially two Simple FM (2 operator) setups. We can work with this to 
;; build spectrums much like we did with Subtractive synthesis using two 
;; vco2's. Each operator stack (pair of operators) will generate a spectrum, 
;; then we work on their relationthips to each other (the carrier's 
;; frequencies and amplitudes) to build up the total spectrum
;; ============================================================================
instr FM_PCIM

  ifreq = p4         ;; fundamental frequency set by user 
  iamp = p5          ;; overall amplitude 

  ;; FIRST OPERATOR PAIR
  ;; MODULATOR 1
  iratio_mod1 = 1      ;; ratio of modulator 2 
  imod_freq1 = ifreq * iratio_mod1
  index_mod1 = 8 
  imod_amp1 = index_mod1 * imod_freq1   ;; depth of modulation for modulator

  ;; CARRIER 1 
  iratio1 = 1      ;; ratio of carrier 1 
  icar_freq1 = ifreq * iratio1  
  icar_amp1 = 1 

  ;; SECOND OPERATOR PAIR
  ;; MODULATOR 1
  iratio_mod2 = 1      ;; ratio of modulator 2
  imod_freq2 = ifreq * iratio_mod2
  index_mod2 = 8 
  imod_amp2 = index_mod2 * imod_freq2   ;; depth of modulation for modulator

  ;; CARRIER 2 
  iratio2 = 8      ;; ratio of carrier 2 
  icar_freq2 = ifreq * iratio2  
  icar_amp2 = 0.2 

  ;; SIGNAL GENERATION
  amod1 = oscili(imod_amp1, imod_freq1)
  acar1 = oscili(icar_amp1, icar_freq1 + amod1) ;; modulating the carrier's frequency

  amod2 = oscili(imod_amp2, imod_freq2)
  acar2 = oscili(icar_amp2, icar_freq2 + amod2)  ;; modulating the carrier's frequency
  ;; acar2 = oscili(0, icar_freq2 + amod)  ;; Can use zero to turn off output and hear just the other operator  

  asig = acar1 + acar2  ;; add the two carriers as they are both "sounding" operators 
  asig = acar2

  asig *= 1 / (icar_amp1 + icar_amp2) ;; adjust amplitude to range +-1.0 

  ;; SIGNAL PROCESSING
  asig *= linen:a(iamp, .01, p3, .01) 

  out(asig, asig)            
endin

schedule("FM_PCIM", 0, 2, cpspch(8.00), ampdbfs(-12))



;; ============================================================================
;; Example FM_PCIM2
;; Equivalent to FM_PCIM but uses Csound's foscili simple FM oscillator
;; ============================================================================
instr FM_PCIM2

  ifreq = p4         ;; fundamental frequency set by user 
  iamp = p5          ;; overall amplitude 
 
  ;; ares = foscili(xamp, kcps, xcar, xmod, kndx)
  ;; Note: Manual says foscili requires an ifn argument, this was changed 
  ;; and the manual is out of date
  acar1 = foscili(1, ifreq, 1, 1, 8) 
  acar2 = foscili(0.2, ifreq, 8, 1, 8) 

  asig = acar1 + acar2
  asig *= 0.5 

  ;; SIGNAL PROCESSING
  asig *= linen:a(iamp, .01, p3, .01) 

  out(asig, asig)            

endin

schedule("FM_PCIM2", 0, 2, cpspch(8.00), ampdbfs(-12))


;; ============================================================================
;; Example FM_Par_Car 
;; 3 Operator FM Synthesis, Parallel Carrier 
;;  
;; M --> C1
;;   \-> C2
;; 
;; Modulator signal output is used to modulate the frequency of two carriers
;; We program this similarly to having two simple FM setups, but the sidebands
;; are going to be 
;; ============================================================================

instr FM_Par_Car
  ifreq = p4         ;; fundamental frequency set by user 
  iamp = p5          ;; overall amplitude 

  ;; MODULATOR
  iratio_mod = 2      ;; ratio of modulator  
  imod_freq = ifreq * iratio_mod  
  ;;imod_freq = 4.4       ;; using a fixed value is possible, 
                        ;; most often used in FM programming with low 
                        ;; frequencies to get vibrato
  index_mod = 8 
  imod_amp = index_mod * imod_freq   ;; depth of modulation for modulator

  ;; CARRIER 1 
  iratio1 = 1      ;; ratio of carrier 1 to fundamental
  icar_freq1 = ifreq * iratio1  
  icar_amp1 = 1 

  ;; CARRIER 2 
  iratio2 = 2      ;; ratio of carrier 2 to fundamental
  icar_freq2 = ifreq * iratio2  
  icar_amp2 = 0.25

  ;; SIGNAL GENERATION
  amod = oscili(imod_amp, imod_freq)
  acar1 = oscili(icar_amp1, icar_freq1 + amod)    ;; modulating the carrier's frequency
  acar2 = oscili(icar_amp2, icar_freq2 + amod)  ;; modulating the carrier's frequency
  ;; acar2 = oscili(0, icar_freq2 + amod)  ;; Can use zero to turn off output and hear just the other operator  

  asig = acar1 + acar2  ;; add the two carriers as they are both "sounding" operators 

  asig *= 1 / (icar_amp1 + icar_amp2) ;; adjust amplitude to range +-1.0 

  ;; SIGNAL PROCESSING
  asig *= linen:a(iamp, .01, p3, .01) 

  out(asig, asig)            
endin

;; Clarinet-like sound, perhaps nicer than just doing Simple FM with C:M 1:2 
schedule("FM_Par_Car", 0, 2, cpspch(8.00), ampdbfs(-12))


;; ============================================================================
;; Example FM_Par_Mod
;; 3 Operator FM Synthesis, Parallel Modulator 
;;  
;; (M1 + M2) -> C
;; 
;; Results in very complex spectrum. The result is we get sidebands for C:M1, 
;; then sidebands for each one of the side bands according to M2. In the 
;; patch below, we make the carrier 5 times the fundamental. The first 
;; modulator has ratio 1 and index of 4, so it will have lower sidebands that
;; fill out the spectrum back down to the fundamental. The second modulator
;; then repeats that spectrum every 2 times the carrier (10:5 ratio). The 
;; actual amplitudes of each region of sound is computable by Bessel Functions.
;; ============================================================================

instr FM_Par_Mod
  ifreq = p4         ;; fundamental frequency set by user 
  iamp = p5          ;; overall amplitude 

  icarfreq = ifreq * 5 ;; carrier frequency set to 5 times fundamental 

  iratio1 = 1      ;; ratio of modulator 1 
  imod_freq1 = ifreq * iratio1  
  index1 = 4 
  imod_amp1 = index1 * imod_freq1

  iratio2 = 10      ;; ratio of modulator 2 
  imod_freq2 = ifreq * iratio2  
  index2 = 0.5 
  imod_amp2 = index2 * imod_freq2

  ;; SIGNAL GENERATION
  amod1 = oscili(imod_amp1, imod_freq1)
  amod2 = oscili(imod_amp2, imod_freq2)
  acar = oscili(iamp, icarfreq + amod1 + amod2)  ;; modulating the carrier's frequency

  asig = acar

  ;; SIGNAL PROCESSING
  asig *= linen:a(1, .01, p3, .01) 

  out(asig, asig)            
endin

;; Saxaphone-like sound
schedule("FM_Par_Mod", 0, 2, cpspch(8.00), ampdbfs(-12))



;; ============================================================================
;; Example FM_Cascade
;; 3 Operator FM Synthesis 
;; Modulator modulates a Modulator that modulates a Carrier (Cascade)
;; 
;; M1 -> M2 -> C
;; 
;; M2 -> c is like a 2 operator pair, producing a complex spectrum with
;; a number of sines as components of the signal. M1 -> [M2 -> C] then is like 
;; Simple FM but with a complex signal. For every component in [M2 -> C], we
;; get sidebands generated from M1. 
;;
;; This is similar to Parallel Modulators except from the Bessel Function 
;; calculations, we find:
;; 
;; 1. Amplitude of carrier is affected only by the index of the preceding 
;;    modulator (M2 here)
;; 2. Have more energy in the higher-order components (the sideband frequencies 
;;    that surround the [M2 -> C] frequencies) when compared to parallel 
;;    modulators
;; 3. We do not get sidebands around the carrier frequency
;;
;; Reference: Chowning, "FM Theory and Applications"
;; ============================================================================

instr FM_Cascade
  ifreq = p4        
  iamp = p5         

  icarfreq = ifreq  * 5 

  iratio1 = 5      ;; ratio of modulator 1 
  imod_freq1 =  ifreq * iratio1    
  index1 = 1
  imod_amp1 = index1 * imod_freq1
  
  iratio2 = 1      ;; ratio of modulator 2 
  imod_freq2 = ifreq * iratio2  
  index2 = 4 
  imod_amp2 = index2 * imod_freq2


  ;; SIGNAL GENERATION
  amod1 = oscili(imod_amp1, imod_freq1)
  amod2 = oscili(imod_amp2, imod_freq2 + amod1)
  acar = oscili(iamp, ifreq + amod2)   

  asig = acar

  ;; SIGNAL PROCESSING
  asig *= linen:a(1, 0.02, p3, 0.02) 

  out(asig, asig)            
endin

schedule("FM_Cascade", 0, 2, cpspch(8.00), ampdbfs(-12))

