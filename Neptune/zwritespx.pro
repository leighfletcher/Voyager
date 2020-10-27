pro zwritespx,ifile,fwhm,xlat,xlon,ngeom,nconv,nav,wave,angles,spec,error

printf,ifile,fwhm,' ',xlat,' ',xlon,' ',fix(ngeom)
;print,fwhm,' ',xlat,' ',xlon,' ',fix(ngeom)


if fwhm eq 0.0 then begin
for igeom=0,ngeom-1 do begin
 printf,ifile,nconv[0]
 
 printf,ifile,nav
 for iav=0,nav-1 do printf,ifile,angles[*,iav+nav*igeom]
 spectrum=fltarr(3,nconv[0])
 spectrum[0,*]=wave(igeom,*)
 spectrum[1,*]=spec(igeom,*)
 spectrum[2,*]=error(igeom,*)

 printf,ifile,spectrum
endfor
endif

if fwhm ne 0.0 then begin
for igeom=0,ngeom-1 do begin
 printf,ifile,nconv[igeom]
 
 printf,ifile,nav
 for iav=0,nav-1 do printf,ifile,angles[*,iav+nav*igeom]
 spectrum=fltarr(3,nconv[igeom])
 spectrum[0,*]=wave(igeom,0:nconv[igeom]-1)
 spectrum[1,*]=spec(igeom,0:nconv[igeom]-1)
 spectrum[2,*]=error(igeom,0:nconv[igeom]-1)

 printf,ifile,spectrum
endfor
endif
return

end
