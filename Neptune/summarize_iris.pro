sfilename='vg2_nep.dat'

zread_irisdata,sfilename,data,ntotal,planet







 openw,10,'iris.summary'
 ifile=0
 print,' file no.  fdsc     dist/Rn     lat      lon      mu   ave rad.(0:300)'
 printf,10,' file no.  fdsc     dist/Rn     lat      lon      mu   ave rad.(0:300)'
 
 
 for i=0,ntotal-1 do begin
 
 

 fdsc=data[i].count
 radiance = 1.e7*data[i].radiance
 ea=data[i].emiss_angle
 mu=cos(!pi*ea/180.)
 wavenumbers = findgen(data[0].npt) * data[0].dwn + data[0].wn0
 q5lon = data[i].q5_longitude
 q5lat = data[i].q5_latitude
 dist=data[i].dist_sc_cb/24553.
 
 printf,10,ifile,fdsc,dist,q5lat,q5lon,mu,total(radiance(0:300))/301.,$
  format='(1x,i6,1x,i8,2x,f8.3,2x,f8.2,2x,f8.2,2x,f6.3,2x,e10.3)'
 print,ifile,fdsc,dist,q5lat,q5lon,mu,total(radiance(0:300))/301.,data[i].central_body,$
  format='(1x,i6,1x,i8,2x,f8.3,2x,f8.2,2x,f8.2,2x,f6.3,2x,e10.3)'

 endfor

 close,10
 
 set_plot,'ps'
 device,filename='neptune_irisdata.eps',/encapsulated,xsize=9,ysize=18
 !p.font=0
 
 
 ;k=where(data.count ge 1136227 and data.count le 1140951 and data.pb_semi_diam le 1.6 ) -> NS maps 1 
 ;k=where(data.count ge 1141050 and data.count le 1141155) -> Centre to limb scan
 ;k=where(data.count ge 1141600 and data.count le 1144200 -> NS maps 2
 
 k=where(data.count ge 1133200 and data.count le 1144200 and $
            ;    data.pb_semi_diam le 1.6 and $
                  data.picture_body eq 0 and $
			data.central_body eq planet and $
			data.reject_code eq 0 and $
			data.emiss_angle le 80 and $
               ;   data.q5_latitude le -15.0 and $
               ;   data.q5_latitude ge -30.0 and $
			abs(data.q1_latitude) le 90.0 and $
			abs(data.q2_latitude) le 90.0 and $
			abs(data.q3_latitude) le 90.0 and $
			abs(data.q4_latitude) le 90.0 and $
			abs(data.q6_latitude) le 90.0 and $
			abs(data.q7_latitude) le 90.0 and $
			abs(data.q8_latitude) le 90.0 and $
			abs(data.q9_latitude) le 90.0)
			

!p.font=0
!p.multi=[0,1,3]			
charsize=1.1
pcircle
			
plot,data(k).q5_latitude,data(k).emiss_angle,psym=8,xrange=[90,-90],xstyle=1,title='(a) Emission Angles',xtitle='Latitude',xtickinterval=10,ytitle='Emission Angle',charsize=charsize,xthick=2,ythick=2,symsize=0.4

oplot,[90,-90],[90,90],linestyle=2

;plot,data(k).count,data(k).dist_sc_cb,psym=1,title='Distance to Object',$
;ytitle='Distance (km)',xtitle='Count'

;plot,data(k).count,data(k).pb_semi_diam,psym=1,title='Target Body ;Semi-Diameter',$
;ytitle='ngular semi-diameter (degrees)',xtitle='Count'

plot,data(k).q5_latitude,data(k).pb_semi_diam,psym=8,title='(b) Target Body Semi-Diameter',yrange=[0,4],$
ytitle='Angular semi-diameter (degrees)',xtitle='Latitude',xtickinterval=10,$
xrange=[90,-90],xstyle=1,charsize=charsize,xthick=2,ythick=2,symsize=0.4


plot,data(k).q5_latitude,data(k).dist_sc_cb/1e6,psym=8,title='(c) Distance to Object',$
ytitle='Distance (10!u6!n km)',xtitle='Latitude',xtickinterval=10,$
xrange=[90,-90],xstyle=1,charsize=charsize,xthick=2,ythick=2,symsize=0.4



device,/close
end
