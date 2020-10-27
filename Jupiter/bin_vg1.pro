iread=0

if iread eq 1 then begin


files=file_search('VGIRIS_0001_peer_review/DATA/JUPITER_VG1/*_LSB.DAT')

;READ IN VOYAGER 1 NESR SPECTRUM
nwaven=file_lines('/home/l/lnf2/projects/IRIS/IRISdata/PDS/jupiter/VGIRIS_0001_peer_review/CALIB/JUPITER_VG1_NESR.TAB')
tmp=fltarr(2,nwaven)
openr,1,'/home/l/lnf2/projects/IRIS/IRISdata/PDS/jupiter/VGIRIS_0001_peer_review/CALIB/JUPITER_VG1_NESR.TAB'
readf,1,tmp
close,1
nesr = tmp(1,*)


   
mRecord = {                $
 FDS_COUNT                  : 0L , $      
 SPARE                      : FLTARR(2) , $ 
 PICTURE_BODY               : 0L , $  
 CENTRAL_BODY               : 0L , $  
 SPARE1                      : 0L , $  
 Q5_LATITUDE                : 0.0, $  
 Q5_LONGITUDE               : 0.0, $  
 EMISS_ANGLE                : 0.0, $  
 DIST_SC_PB                 : 0.0, $  
 PB_SUBSC_LAT               : 0.0, $  
 PB_SUBSC_LON               : 0.0, $  
 SC_PHASE_ANG               : 0.0, $  
 PB_SEMI_DIAM               : 0.0, $  
 RAD_NORM                   : FLTARR(8), $  
 RAD_HIGH                   : FLTARR(8), $  
 LOCAL_TIME_HR              : 0.0, $  
 SCET_YR                    : 0L, $  
 SCET_DAY                   : 0L, $  
 SCET_HR                    : 0L, $  
 SCET_MIN                   : 0L, $  
 SCET_SEC                   : 0L, $  
 ERT_YR                     : 0L, $  
 ERT_DAY                    : 0L, $  
 ERT_HR                     : 0L, $  
 ERT_MIN                    : 0L, $  
 ERT_SEC                    : 0L, $  
 DIST_CB_SUN                : 0.0, $  
 DIST_SC_CB                 : 0.0, $  
 DIST_PB_SUN                : 0.0, $  
 DIST_SC_PBTP               : 0.0, $  
 SC_ALT                     : 0.0, $  
 Q1_LATITUDE                : 0.0, $  
 Q1_LONGITUDE               : 0.0, $  
 Q2_LATITUDE                : 0.0, $  
 Q2_LONGITUDE               : 0.0, $  
 Q3_LATITUDE                : 0.0, $  
 Q3_LONGITUDE               : 0.0, $  
 Q4_LATITUDE                : 0.0, $  
 Q4_LONGITUDE               : 0.0, $  
 Q6_LATITUDE                : 0.0, $  
 Q6_LONGITUDE               : 0.0, $  
 Q7_LATITUDE                : 0.0, $  
 Q7_LONGITUDE               : 0.0, $  
 Q8_LATITUDE                : 0.0, $  
 Q8_LONGITUDE               : 0.0, $  
 Q9_LATITUDE                : 0.0, $  
 Q9_LONGITUDE               : 0.0, $  
 Q5_LATITUDE_750            : 0.0, $  
 Q5_LONGITUDE_750           : 0.0, $  
 OPTIC_AXIS                 : 0.0, $  
 SUB_SOLAR_LAT              : 0.0, $  
 SUB_SOLAR_LON              : 0.0, $  
 SOL_ZENITH_ANG             : 0.0, $  
 Q5_PHASE                   : 0.0, $  
 SOL_AZIMUTH_ANG            : 0.0, $  
 EMISS_ANGLE_750            : 0.0, $  
 AVG_BTEMP_22MU             : 0.0, $  
 AVG_BTEMP_5MU              : 0.0, $  
 IR_DET_TEMP                : 0.0, $  
 RADIOM_TEMP                : 0.0, $  
 BEAMSP_TEMP                : 0.0, $  
 MIC_MOT_TEMP               : 0.0, $  
 RAD_SUR_TEMP               : 0.0, $  
 PRI_CTR_TEMP               : 0.0, $  
 PRI_EDG_TEMP               : 0.0, $  
 SEC_MIR_TEMP               : 0.0, $  
 ELECT_TEMP                 : 0.0, $  
 REJECT_CODE                : 0L, $  
 COLD_CAL                   : 0L, $  
 PHASE_RESID                : 0.0, $  
 INT_VIS                    : 0.0, $  
 INT_5MU                    : 0.0, $  
 INT_IR                     : 0.0, $  
 SPARE3                      : FLTARR(3), $  
 THERMAL_RADIANCE_SPECTRUM  : FLTARR(2751), $
 Q1_RING_RADIUS             : 0.0, $  
 Q1_RING_HOUR_ANGLE         : 0.0, $  
 Q2_RING_RADIUS             : 0.0, $  
 Q2_RING_HOUR_ANGLE         : 0.0, $  
 Q3_RING_RADIUS             : 0.0, $  
 Q3_RING_HOUR_ANGLE         : 0.0, $  
 Q4_RING_RADIUS             : 0.0, $  
 Q4_RING_HOUR_ANGLE         : 0.0, $  
 Q5_RING_RADIUS             : 0.0, $  
 Q5_RING_HOUR_ANGLE         : 0.0, $  
 Q6_RING_RADIUS             : 0.0, $  
 Q6_RING_HOUR_ANGLE         : 0.0, $  
 Q7_RING_RADIUS             : 0.0, $  
 Q7_RING_HOUR_ANGLE         : 0.0, $  
 Q8_RING_RADIUS             : 0.0, $  
 Q8_RING_HOUR_ANGLE         : 0.0, $  
 Q9_RING_RADIUS             : 0.0, $  
 Q9_RING_HOUR_ANGLE         : 0.0 }
 
   
;OPENR, unit, file, /GET_LUN
;str = ''
;count = 0ll
;WHILE ~ EOF(unit) DO BEGIN
;READU, unit, str
;count = count + 1
;ENDWHILE
;nrecords=count

nrecords=600
nfiles=n_elements(files)
data=replicate(mRecord,nrecords*nfiles)
mderiv=fltarr(nrecords*nfiles)
c=0
cc=1

jd=dblarr(nrecords*nfiles)
for ifile=0,nfiles-1 do begin

    openr,1,files[ifile]
    
    while ~EOF(1) do begin
    ;for i=0,nrecords-1 do begin
        readu, 1, mRecord
        ;print,ifile,cc,c,mRecord.emiss_angle,mRecord.picture_body,mRecord.q5_latitude
        cc=cc+1
        
        fwhm=4.3
        wn0=150.1750
        dnu=1.39051
        nconv=n_elements(mRecord.thermal_radiance_spectrum)
        wave=fltarr(nconv)
        for iconv=0,nconv-1 do wave(iconv)=wn0 + iconv*dnu
        
        maxderiv=max(deriv(wave,(deriv(wave,mRecord.thermal_radiance_spectrum))))
        
        
        
        if ( $
	    
	
           ; total(mRecord.thermal_radiance_spectrum) gt 0. and $
            maxderiv gt 0.0 and maxderiv lt 1e-4 and $
            mRecord.dist_sc_pb lt 4.0e6 and $
            mRecord.picture_body eq 0 and $
            ;    data.pb_semi_diam le 1.6 and $
		mRecord.central_body eq 5 and $
		mRecord.emiss_angle le 70 and $
           ; mRecord.reject_code eq 0 and $
		abs(mRecord.q1_latitude) le 90.0 and $
		abs(mRecord.q2_latitude) le 90.0 and $
		abs(mRecord.q3_latitude) le 90.0 and $
		abs(mRecord.q4_latitude) le 90.0 and $
		abs(mRecord.q6_latitude) le 90.0 and $
		abs(mRecord.q7_latitude) le 90.0 and $
		abs(mRecord.q8_latitude) le 90.0 and $
		abs(mRecord.q5_latitude) le 90.0) then begin
               mderiv[c]=maxderiv 
               data[c]=mRecord

               
               date=fltarr(5)
               date[0]=strcompress('19'+string(mRecord.scet_yr),/remove_all)
               date[1]=mRecord.scet_day
               date[2]=mRecord.scet_hr
               date[3]=mRecord.scet_min
               date[4]=mRecord.scet_sec
        
               jd[c]=date_conv(date,'M')
               c=c+1               
                    
        endif
    endwhile
    
    close,1
    print,c,' ',files[ifile]

endfor

mderiv=mderiv[0:c-1]
data=data[0:c-1]
jd=jd[0:c-1]
help,data

save,filename='vg1.sav',data,jd,mderiv

endif

if iread eq 0 then restore,'vg1.sav'
jd=jd-2400000.5


set_plot,'ps'
device,filename='jupiter_vg1irislat.eps',encapsulated=0
!p.font=0
pcircle
ca_v1=date_conv('1979-03-05 12:00:00','J')
ca_v2=date_conv('1979-07-09 00:00:00','J')

jdmin=date_conv('1979-03-02 19:00:00','J')
jdmax=date_conv('1979-03-03 10:00:00','J')

;z=where(data.fds_count eq 1631305)
;jdmin=jd[z]+2400000.5
;z=where(data.fds_count eq 1645332)
;jdmax=jd[z]+2400000.5

date_label=LABEL_DATE(DATE_FORMAT=['%Y/%N/%D/%H'])


plot,[jdmin,jdmax],[-90,90],/nodata,xs=1,ys=1,$
title='Voyager 1 Latitude Coverage',ytitle='Planetographic Latitude',$
xtitle='Date',$
xtickformat='label_date',xtickunits='time',$
ytickinterval=10.,xthick=2,ythick=2,xminor=12

oplot,jd+2400000.5,data.q5_latitude,psym=8,symsize=0.5


plot,[jdmin,jdmax],[0,90],/nodata,xs=1,ys=1,$
title='Voyager 1 Emission Angle Coverage',ytitle='Planetographic Latitude',$
xtitle='Date',$
xtickformat='label_date',xtickunits='time',$
ytickinterval=10.,xthick=2,ythick=2,xminor=12

oplot,jd+2400000.5,data.emiss_angle,psym=8,symsize=0.5


device,/close




;jdmax=date_conv('1979-03-08 12:00:00','J')


latN=90.
latS=-90.
lat_step=2.5
lat_width=5.0
emm_width=10.0

nlats=1+((latN-latS)/lat_step)

set_plot,'ps'
device,filename='jupiter_v1spx.eps',encapsulated=0
!p.font=0
pcircle
loadct,0

count=0

jd1=jd+2400000.5

for ilat=0,nlats-1 do begin

    lat1=latS+ilat*lat_step-lat_width/2.
    lat2=latS+ilat*lat_step+lat_width/2.
    mlat=latS+ilat*lat_step
    
    k=where(data.q5_latitude ge lat1 and data.q5_latitude le lat2 and jd1 ge jdmin and jd1 le jdmax)
    memm=mean(data[k].emiss_angle)
    emm1=memm-emm_width/2.
    emm2=memm+emm_width/2
    
    
    if n_elements(k) le 1 then goto,next
    print,mlat,memm,n_elements(k)

    nav=1
    ngeom=1
    nconv=n_elements(data[0].thermal_radiance_spectrum)
    wave=fltarr(1,nconv)
    
    fwhm=4.3
    wn0=150.1750
    dnu=1.39051
    for iconv=0,nconv-1 do wave(0,iconv)=wn0 + iconv*dnu
    
    ;maxderiv=max(deriv(wave,(deriv(wave,1e9*spec))))
    wkeep1=value_locate(wave,200.)
    
    k=where(data.q5_latitude ge lat1 and $
        data.q5_latitude le lat2 and $
        data.emiss_angle ge emm1 and $
	  data.emiss_angle le emm2 and $
        data.thermal_radiance_spectrum[wkeep1] ge 5.e-7 and jd1 ge jdmin and jd1 le jdmax)
        
        
    wkeep=value_locate(wave,250.)
    mrad=mean(data[k].thermal_radiance_spectrum[wkeep])
    srad=stddev(data[k].thermal_radiance_spectrum[wkeep])
    srad=0.1*mrad
    
    
    
    k=where(data.q5_latitude ge lat1 and $
        data.q5_latitude le lat2 and $
        data.emiss_angle ge emm1 and $
	  data.emiss_angle le emm2 and $
        data.thermal_radiance_spectrum[wkeep] ge mrad-srad and $
        data.thermal_radiance_spectrum[wkeep] le mrad+srad and $
        data.thermal_radiance_spectrum[wkeep1] ge 5.e-7  and jd1 ge jdmin and jd1 le jdmax)
    
    print,'Step Two: ',mlat,memm,n_elements(k)
    if n_elements(k) le 1 then goto,next
    
    count=count+n_elements(k)
    
    mlat=latS+ilat*lat_step
    file=strcompress('vg1_iris_'+string(mlat)+'.spx',/remove_all)
    openw,1,file
    
    
    
    
    
    xlat=mean(data[k].q5_latitude)
    xlon=mean(data[k].q5_longitude)
    memm=mean(data[k].emiss_angle)
    
    ;print,xlat,memm,n_elements(k)
    
    sol_azimuth_angle=mean(data[k].sol_azimuth_ang)
    sol_zenith_angle=mean(data[k].sol_zenith_ang)
    angles=[xlat,xlon,sol_zenith_angle,memm,sol_azimuth_angle,1.0]
    
    spec=wave

    error=wave
    
    for iconv=0,nconv-1 do spec(0,iconv)=mean(data[k].thermal_radiance_spectrum[iconv])
    for iconv=0,nconv-1 do error(0,iconv)=stddev(data[k].thermal_radiance_spectrum[iconv])
    nesr2=interpol(tmp[1,*],tmp[0,*],wave[0,*])
    error=nesr2/sqrt(n_elements(k))
    
    
    
    ;kk=where(spec[0,*] ne 0.0)
    ;wave=wave[0,kk]
    ;spec=spec[0,kk]
    ;error=error[0,kk]
    ;nconv=n_elements(kk)
    
    
    zwritespx,1,fwhm,xlat,xlon,ngeom,nconv,nav,wave,angles,spec,error
    close,1
    
    plot,wave[0,*],spec[0,*],xr=[200,600],$
    xthick=2,ythick=2,title=xlat
    
    pspec= data[k].thermal_radiance_spectrum
    for j=0,n_elements(k)-1 do begin
        oplot,wave,pspec[*,j],color=170
    endfor
    
    oplot,wave[0,*],spec[0,*],thick=3
    oplot,wave[0,*],spec[0,*]-error[0,*],linestyle=1
    oplot,wave[0,*],spec[0,*]+error[0,*],linestyle=1
    next:
endfor
device,/close
print,count
end
