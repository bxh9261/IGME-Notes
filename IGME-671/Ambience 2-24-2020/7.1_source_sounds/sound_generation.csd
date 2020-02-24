<CsoundSynthesizer>
<CsOptions>
-Wn
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	48000
ksmps	=	1
nchnls	=	1
0dbfs	=	1

instr 1	
  ipch = cpsmidinn(p4)
  asig = vco2(1, ipch) 
  asig += vco2(.5, ipch * 2.0012312313, 10) 

  asig *= linen:a(.77, 0.01, p3, 0.1) 

  asig = zdf_ladder(asig, cpsoct(line(9, p3, 5)), 6)

  Sname = sprintf("synth_%d.wav", p4)
  fout(Sname, 8, asig)

endin

gindx = 0
while (gindx < 25) do
  schedule(1, 0, 4, 48 + gindx)
  gindx += 1
od

</CsInstruments>
; ==============================================
<CsScore>
f0 1
</CsScore>
</CsoundSynthesizer>

