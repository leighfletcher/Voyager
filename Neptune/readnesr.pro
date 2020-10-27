pro readnesr,wave,spec

openr,1,'vg2nesr.dat',4




readrec, 1, wave, spec, pbod, cbod, q5lat, q5lon, emiss, phase,$
   sol_zenith,ireject,ical,ivis,r5um,rir,distpb,distcb,fdsc

; print,'plan body, central bod',pbod,cbod
; print,'latitude, longitude = ',q5lat,q5lon
; print,'Incident,emission,phase : ',sol_zenith,emiss,phase
; print,'ireject, ical : ',ireject,ical
; print,'Radiance at vis, 5um, integrated IR : ',ivis,r5um,rir 

; plot,wave,spec,yrange=[0,2.5e-6],xtitle='Wavenumber (cm-1)',$
; ytitle='Radiance'


close,1

end
