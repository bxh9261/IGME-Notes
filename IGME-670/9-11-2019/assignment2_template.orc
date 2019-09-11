;; Assignment 2
;; Author: PUT YOUR NAME HERE


/* PART 1 - One-Oscillator */

instr Osc1_1
  ;; 1. Use vco2 to generate a square wave
  ;; 2. Use zdf_1pole to process as a low-pass filter
  ;; 3. Further multiply by envelope

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
  
endin

;; Try different pch values like 7.00, 7.07, 8.10, etc.
;; the integer part is the octave and the fractional part being 
;; the note number, using .00, .01, .02 ... .11
schedule("Osc1_1", 0, 2, cpspch(8.00), 0.5)

instr Osc1_2 
  ;; 1. Use vco2 to generate a triangle wave
  ;; 2. Use zdf_2pole to process as a low-pass filter
  ;; 3. Further multiply by envelope

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; Try different pch values. This time, we're using cp2pch, which allows
;; changing the number of divisions of the octave. 12 is commonly used here, 
;; to relate to the Twelve-tone Equal Temperament tuning, but it can be 
;; really interesting to explore different tuning systems
schedule("Osc1_2", 0, 2, cps2pch(8.00, 17), 0.5)

instr Osc1_3
  ;; 1. Use vco2 to generate a sawtooth wave
  ;; 2. Use zdf_ladder to process signal 
  ;; 3. Further multiply by envelope

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; Try different MIDI note numbers. 60 is middle-c, equivalent to the 
;; center key on a Piano. With 12 tones per octave, the next C up is 
;; 72, the next C down is 48. 
schedule("Osc1_3", 0, 2, cpsmidinn(60), 0.5)

;; Generate Sine Wave function table
gisine = ftgen(0, 0, 65536, 10, 1) 
instr Osc1_4
  iamp = p5
  ifreq = p4
  inyquist = (sr / 2)  ;; sr is a global variable equal to sample rate
  inum_harmonics = inyquist / ifreq  ;; for use with buzz

  ;; 1. Use buzz opcode for sound source.    
  ;; 2. Use "bank" of butterbp to process buzz, Soprano 'o' formants
  ;; 3. Further multiply by adsr envelope

  ;; limit and output
  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; Experiment with how the instrument sounds with different
;; pitches across octaves: for example, 48, 60, 67, 79, etc.  
schedule("Osc1_4", 0, 2, cpsmidinn(72), 0.5)

/* PART 2 - TWO OSCILLATOR */

instr Osc2_1 
  ifreq = p4
  iamp = p5

  ;; 1. Use 2 vco2 opcodes, saw and square one octave apart, for sound source.    
  ;; 2. Use zdf_ladder to shape sound over time by modulating the cutoff 
  ;; 3. Further multiply by envelope to shape overall amplitude

  asig = limit:a(asig, -1, 1)
  out(asig, asig)

endin

;; write your own schedule call here to execute Osc2_1

instr Osc2_2 
  ifreq = p4
  iamp = p5

  ;; 1. Use 2 vco2 opcodes (both sawtooth), slightly detuned, for sound source.    
  ;; 2. Use zdf_ladder to shape sound over time by modulating the cutoff 
  ;; 3. Further multiply by envelope to shape overall amplitude

  ;; multiply by the amplitude given by event parameters
  asig *= iamp

  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; write your own schedule call here to execute Osc2_2


instr Osc2_3 
  ifreq = p4
  iamp = p5

  ;; 1. Use 2 vco2 opcodes (square and triangle, one octave apart) for sound source.    
  ;; 2. Use zdf_ladder to shape sound over time by modulating the cutoff 
  ;; 3. Further multiply by envelope to shape overall amplitude

  ;; multiply by the amplitude given by event parameters
  asig *= iamp

  asig = limit:a(asig, -1, 1)
  out(asig, asig)
endin

;; write your own schedule call here to execute Osc2_3