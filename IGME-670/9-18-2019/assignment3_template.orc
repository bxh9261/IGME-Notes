;; Assignment 3
;; Author: PUT YOUR NAME HERE

;; PART I
;; Convert this instrument to permit defining the C:M ratio from the event 
;; rather than have it hardcoded in the instrument. These parameters are to 
;; given as p6 and p7 for the carrier and modulator. You will need to update 
;; iratio to use those values. Be careful about what is the numerator and what is
;; is the denominator.

instr MySimpleFM
  ifreq = p4        
  iamp = p5         

  iratio = 2/1    ;; ratio of modulator to carrier frequency
  icarfreq = p4   ;; carrier frequency set to value given by user
  imodfreq = icarfreq * iratio  ;; derived value for modulator frequency

  index = 1   ;; controls amount of energy in sidebands 
              ;; try using different values (e.g., 2,5,10)
  imod_amp = index * imodfreq

  ;; SIGNAL GENERATION
  amod = oscili(imod_amp, imodfreq)  ;; "Operator 1"
  acar = oscili(iamp, ifreq + amod)  ;; "Operator 2" 

  asig = acar

  ;; SIGNAL PROCESSING
  asig *= linen:a(1, .01, p3, .01) ;; uses linen version with a-rate output

  out(asig, asig)            
endin

;; PART II
;; Create 15 notes (schedule calls) below, each one second apart in starting
;; time and with .5 duration (follow the pattern for p2 and p3). Then modify
;; the notes to provide a carrier and modulator ratio value in p6 and p7 
;; according to the Normal Form as shown in Barry Truax's "Tutorial for 
;; Frequency Modulation Synthesis" in section "Normal Form of the C:M Ratio" :  
;;
;; https://www.sfu.ca/~truax/fmtut.html
;;
;; Use each one of the ratios shown there in order:
;;
;; 1:1 1:2 4:9 3:7 2:5 3:8 1:3 2:7 1:4 2:9 1:5 1:6 1:7 1:8 1:9
;; 
;; When selecting all schedule calls and evaluating, it should sound exactly 
;; like the example audio provided.

schedule("MySimpleFM", 0, 0.5, cpspch(8.00), ampdbfs(-12), ...)
schedule("MySimpleFM", 1, 0.5, cpspch(8.00), ampdbfs(-12), ...)
schedule("MySimpleFM", 2, 0.5, cpspch(8.00), ampdbfs(-12), ...)
