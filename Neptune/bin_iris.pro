sfilename='vg2_nep.dat'

zread_irisdata,sfilename,data,ntotal,planet


lat_width=10
lat_step=5
emm_width=20.0
emm_step=10.0
emmax=70
mincount=1141600
latS=-90
nave_min=1

openw,99,'observations.dat'
printf,99,'Lat	   Lon	   Emission	#Ave'

set_plot,'ps'
device,filename='spectra.eps',encapsulated=0,/color,xsize=16,ysize=24
!p.font=0
!p.multi=[0,2,3]
!p.charsize=1.5
nlats=1+180./lat_step
nemm=1+ceil(emmax/emm_step)
;nemm=1
;for ilat=4,4 do begin

for ilat=0,nlats-1 do begin
	igeom=0
	;for iemm=0,nemm-1 do begin
		;if iemm eq 0 then begin
            nemm=1
			flat=fltarr(nemm)
			flon=fltarr(nemm)
			emm_angles=fltarr(nemm)
			sol_zenith_angles=fltarr(nemm)
			sol_azimuth_angles=fltarr(nemm)
			nave=fltarr(nemm)
			wave=fltarr(nemm,data[0].npt)
			spec=fltarr(nemm,data[0].npt)
			error=fltarr(nemm,data[0].npt)
		;endif
			
		mlat=latS+ilat*lat_step
		lat1=mlat-lat_width/2.
		lat2=mlat+lat_width/2.
            
            
		;memm=iemm*emm_step
		;emm1=memm-emm_width/2.
		;emm2=memm+emm_width/2.
		
		
		keep=where(data.q5_latitude ge lat1 and $
			data.q5_latitude le lat2 and $
			data.emiss_angle le 70. and $
			;data.emiss_angle le emm2 and $
			;data.count ge 1136227 and data.count le 1140951 and $
                  data.count ge 1141600 and $
                  ;data.pb_semi_diam le 1.6 and $
			data.picture_body eq 0 and $
			data.central_body eq planet and $
			data.reject_code eq 0 and $
			abs(data.q1_latitude) le 90.0 and $
			abs(data.q2_latitude) le 90.0 and $
			abs(data.q3_latitude) le 90.0 and $
			abs(data.q4_latitude) le 90.0 and $
			abs(data.q6_latitude) le 90.0 and $
			abs(data.q7_latitude) le 90.0 and $
			abs(data.q8_latitude) le 90.0 and $
			abs(data.q9_latitude) le 90.0)
			
			
			
			
			
		
		if keep[0] eq 0 or n_elements(keep) lt nave_min then print,lat1,lat2,emm1,emm2
		
		if keep[0] ge 0 and n_elements(keep) ge nave_min then begin
            
                  memm=mean(data[keep].emiss_angle)
                  emm1=memm-emm_width/2.
                  emm2=memm+emm_width/2.
                  
		keep=where(data.q5_latitude ge lat1 and $
			data.q5_latitude le lat2 and $
			data.emiss_angle ge emm1 and $
			data.emiss_angle le emm2 and $
                  data.count ge 1141600 and $
                  ;data.pb_semi_diam le 1.6 and $
			data.picture_body eq 0 and $
			data.central_body eq planet and $
			data.reject_code eq 0 and $
		;	data.pb_semi_diam le 4 and $
			abs(data.q1_latitude) le 90.0 and $
			abs(data.q2_latitude) le 90.0 and $
			abs(data.q3_latitude) le 90.0 and $
			abs(data.q4_latitude) le 90.0 and $
			abs(data.q6_latitude) le 90.0 and $
			abs(data.q7_latitude) le 90.0 and $
			abs(data.q8_latitude) le 90.0 and $
			abs(data.q9_latitude) le 90.0)                  
            
			print,lat1,lat2,emm1,emm2,' -> Binned'
			flat[igeom]=mean(data[keep].q5_latitude)
			flon[igeom]=mean(data[keep].q5_longitude)
			emm_angles[igeom]=mean(data[keep].emiss_angle)
			sol_azimuth_angles[igeom]=mean(data[keep].sol_azimuth_ang)
			sol_zenith_angles[igeom]=mean(data[keep].sol_zenith_ang)

			nconv=data[0].npt
			for iconv=0,nconv-1 do wave(igeom,iconv)=data[0].wn0 + iconv*data[0].dwn
			
                  nave(igeom)=n_elements(keep)
			zdata=data[keep]
                  wk=where(wave[igeom,*] ge 300 and wave[igeom,*] le 400)
                  spx=fltarr(nave(igeom))
                  err=fltarr(nave(igeom))
                  for a=0,nave(igeom)-1 do begin
                    spx[a]=mean(abs(zdata[a].radiance(wk)))
                    err[a]=stddev(abs(zdata[a].radiance(wk)))
                  endfor
                  err=stddev(spx)
                  mspx=mean(spx)
                  k1=where(spx ge 0 and spx le mspx+err and spx ge mspx-err)
                  zdata=zdata[k1]  
                  
                  
                  
			for iconv=0,nconv-1 do begin
                  
                        ;zdata=data[keep]
                        ;err=stddev(data[keep].radiance[iconv])
                        ;spx=mean(data[keep].radiance[iconv])
                        ;k2=where(zdata.radiance[iconv] lt spx+2*err)
     				spec(igeom,iconv)=mean(zdata.radiance[iconv])
				error(igeom,iconv)=stddev(zdata.radiance[iconv])/sqrt(n_elements(keep))
			endfor
                  
                  title='IRIS Spectra at '+string(mlat)
                  plot,wave(igeom,*),1e9*spec(igeom,*),title=title,xrange=[200,400],xstyle=1,$
                  xthick=2,ythick=2,yrange=[0,100],ystyle=1,xtitle='Wavenumber [cm!u-1!n]',$
                  ytitle='Radiance [nW/cm!u2!n/sr/cm!u-1!n]'
                  
                  pdata=zdata.radiance
                  n=n_elements(k1)
                  help,pdata
                  for z=0,n_elements(k1)-1 do oplot,wave(igeom,*),1e9*pdata[*,z],color=200
                  oplot,wave(igeom,*),1e9*spec(igeom,*),thick=4
                 ; oplot,wave(igeom,*),spec(igeom,*)+error(igeom,*),thick=4,linestyle=1
                 ; oplot,wave(igeom,*),spec(igeom,*)-error(igeom,*),thick=4,linestyle=1

			igeom=igeom+1	
                    xyouts,300,80,'N='+string(n_elements(k1)),charsize=1.0
                    
                    axis,xaxis=1,xrange=[200,400],xstyle=1,xthick=2,xtickname=replicate(' ',30)
                    axis,xaxis=0,xrange=[200,400],xstyle=1,xthick=2,xtickname=replicate(' ',30)
                    axis,yaxis=0,yrange=[0,100],ystyle=1,ythick=2,ytickname=replicate(' ',30)
                    axis,yaxis=1,yrange=[0,100],ystyle=1,ythick=2,ytickname=replicate(' ',30)

		endif
		
	;endfor
	;igeom=1
      ngeom=igeom
	
	if ngeom gt 0 then begin
	
	flat=flat[0:ngeom-1]
	flon=flon[0:ngeom-1]
	emm_angles=emm_angles[0:ngeom-1]
	sol_zenith_angles=sol_zenith_angles[0:ngeom-1]
	sol_azimuth_angles=sol_azimuth_angles[0:ngeom-1]

	wave=wave[0:ngeom-1,*]
	spec=spec[0:ngeom-1,*]
	error=error[0:ngeom-1,*]
	
	for igeom=0,ngeom-1 do printf,99,flat(igeom),flon(igeom),$
		emm_angles(igeom),nave(igeom)

	
	file=strcompress('spectra_NSmaps2/iris.'+string(mlat)+'.spx',/remove_all)
	print,'Output...',file
	openw,lun,file,/get_lun
	fwhm=4.3
	xlat=mean(flat)
	xlon=mean(flon)
	nav=1
	angles=fltarr(6,ngeom)
	angles[0,*]=flat
	angles[1,*]=flon
	angles[2,*]=sol_zenith_angles
	angles[3,*]=emm_angles
	angles[4,*]=sol_azimuth_angles
	angles[5,*]=replicate(1.0,ngeom)
      nconv1=replicate(nconv,ngeom)
	zwritespx,lun,fwhm,xlat,xlon,ngeom,nconv1,nav,wave,angles,spec,error
	free_lun,lun
	
	endif
endfor
device,/close
close,/all
end
