
tabfiles=file_search('VGIRIS_0002_peer_review/DATA/SATURN_VG1/C*TAB')

nfiles=n_elements(tabfiles)

;   FDS_COUNT         =fltarr(n)
;   PICTURE_BODY      =fltarr(n)
;   CENTRAL_BODY      =fltarr(n)
;   Q5_LATITUDE       =fltarr(n)
;   Q5_LONGITUDE      =fltarr(n)
;   EMISS_ANGLE       =fltarr(n)
;   DIST_SC_PB        =fltarr(n)
;   PB_SUBSC_LAT      =fltarr(n)
;   PB_SUBSC_LON      =fltarr(n)
;   SC_PHASE_ANG      =fltarr(n)
;   PB_SEMI_DIAM      =fltarr(n)
;   LOCAL_TIME_HR     =fltarr(n)
;   SCET_YR           =fltarr(n)
;   SCET_DAY          =fltarr(n)
;   SCET_HR           =fltarr(n)
;   SCET_MIN          =fltarr(n)
;   SCET_SEC          =fltarr(n)
;   ERT_YR            =fltarr(n)
;   ERT_DAY           =fltarr(n)
;   ERT_HR            =fltarr(n)
;   ERT_MIN           =fltarr(n)
;   ERT_SEC           =fltarr(n)
;   DIST_CB_SUN       =fltarr(n)
;   DIST_SC_CB        =fltarr(n)
;   DIST_PB_SUN       =fltarr(n)
;   DIST_SC_PBTP      =fltarr(n)
;   SC_ALT            =fltarr(n)
;   Q1_LATITUDE       =fltarr(n)
;   Q1_LONGITUDE      =fltarr(n)
;   Q2_LATITUDE       =fltarr(n)
;   Q2_LONGITUDE      =fltarr(n)
;   Q3_LATITUDE       =fltarr(n)
;   Q3_LONGITUDE      =fltarr(n)
;   Q4_LATITUDE       =fltarr(n)
;   Q4_LONGITUDE      =fltarr(n)
;   Q6_LATITUDE       =fltarr(n)
;   Q6_LONGITUDE      =fltarr(n)
;   Q7_LATITUDE       =fltarr(n)
;   Q7_LONGITUDE      =fltarr(n)
;   Q8_LATITUDE       =fltarr(n)
;   Q8_LONGITUDE      =fltarr(n)
;   Q9_LATITUDE       =fltarr(n)
;   Q9_LONGITUDE      =fltarr(n)
;   Q5_LATITUDE_750   =fltarr(n)
;   Q5_LONGITUDE_750  =fltarr(n)
;   OPTIC_AXIS        =fltarr(n)
;   SUB_SOLAR_LAT     =fltarr(n)
;   SUB_SOLAR_LON     =fltarr(n)
;   SOL_ZENITH_ANG    =fltarr(n)
;   Q5_PHASE          =fltarr(n)
;   SOL_AZIMUTH_ANG   =fltarr(n)
;   Q1_RING_RADIUS    =fltarr(n)
;   Q1_RING_HOUR_ANGLE=fltarr(n)
;   Q2_RING_RADIUS    =fltarr(n)
;   Q2_RING_HOUR_ANGLE=fltarr(n)
;   Q3_RING_RADIUS    =fltarr(n)
;   Q3_RING_HOUR_ANGLE=fltarr(n)
;   Q4_RING_RADIUS    =fltarr(n)
;   Q4_RING_HOUR_ANGLE=fltarr(n)
;   Q5_RING_RADIUS    =fltarr(n)
;   Q5_RING_HOUR_ANGLE=fltarr(n)
;   Q6_RING_RADIUS    =fltarr(n)
;   Q6_RING_HOUR_ANGLE=fltarr(n)
;   Q7_RING_RADIUS    =fltarr(n)
;   Q7_RING_HOUR_ANGLE=fltarr(n)
;   Q8_RING_RADIUS    =fltarr(n)
;   Q8_RING_HOUR_ANGLE=fltarr(n)
;   Q9_RING_RADIUS    =fltarr(n)
;   Q9_RING_HOUR_ANGLE=fltarr(n)


;;   set_plot,'ps'
;;   device,filename='saturn_irisdist.eps',/encapsulated
;;   !p.font=0
;;   pcircle
;;
;;   planet=6
;;
;;   plot,[4364000,4428407],[0,1.3e7],/nodata,xs=1,ys=1,$
;;   title='Distance to Target [km]',ytitle='Distance to Target',$
;;   xtitle='FDS Count'
;;
;;
;;   for i=0,nfiles-1 do begin
;;       data=read_csv(tabfiles[i])
;;       FDS_COUNT         = data.field01
;;       PICTURE_BODY      = data.field02
;;       CENTRAL_BODY      = data.field03
;;       Q5_LATITUDE       = data.field04
;;       Q5_LONGITUDE      = data.field05
;;       EMISS_ANGLE       = data.field06
;;       DIST_SC_PB        = data.field07
;;       PB_SUBSC_LAT      = data.field08
;;       PB_SUBSC_LON      = data.field09
;;       SC_PHASE_ANG      = data.field10
;;       PB_SEMI_DIAM      = data.field11
;;       LOCAL_TIME_HR     = data.field12
;;       SCET_YR           = data.field13
;;       SCET_DAY          = data.field14
;;       SCET_HR           = data.field15
;;       SCET_MIN          = data.field16
;;       SCET_SEC          = data.field17
;;       ERT_YR            = data.field18
;;       ERT_DAY           = data.field19
;;       ERT_HR            = data.field20
;;       ERT_MIN           = data.field21
;;       ERT_SEC           = data.field22
;;       DIST_CB_SUN       = data.field23
;;       DIST_SC_CB        = data.field24
;;       DIST_PB_SUN       = data.field25
;;       DIST_SC_PBTP      = data.field26
;;       SC_ALT            = data.field27
;;       Q1_LATITUDE       = data.field28
;;       Q1_LONGITUDE      = data.field29
;;       Q2_LATITUDE       = data.field30
;;       Q2_LONGITUDE      = data.field31
;;       Q3_LATITUDE       = data.field32
;;       Q3_LONGITUDE      = data.field33
;;       Q4_LATITUDE       = data.field34
;;       Q4_LONGITUDE      = data.field35
;;       Q6_LATITUDE       = data.field36
;;       Q6_LONGITUDE      = data.field37
;;       Q7_LATITUDE       = data.field38
;;       Q7_LONGITUDE      = data.field39
;;       Q8_LATITUDE       = data.field40
;;       Q8_LONGITUDE      = data.field41
;;       Q9_LATITUDE       = data.field42
;;       Q9_LONGITUDE      = data.field43
;;       Q5_LATITUDE_750   = data.field44
;;       Q5_LONGITUDE_750  = data.field45
;;       OPTIC_AXIS        = data.field46
;;       SUB_SOLAR_LAT     = data.field47
;;       SUB_SOLAR_LON     = data.field48
;;       SOL_ZENITH_ANG    = data.field49
;;       Q5_PHASE          = data.field50
;;       SOL_AZIMUTH_ANG   = data.field51
;;       Q1_RING_RADIUS    = data.field52
;;       Q1_RING_HOUR_ANGLE= data.field53
;;       Q2_RING_RADIUS    = data.field54
;;       Q2_RING_HOUR_ANGLE= data.field55
;;       Q3_RING_RADIUS    = data.field56
;;       Q3_RING_HOUR_ANGLE= data.field57
;;       Q4_RING_RADIUS    = data.field58
;;       Q4_RING_HOUR_ANGLE= data.field59
;;       Q5_RING_RADIUS    = data.field60
;;       Q5_RING_HOUR_ANGLE= data.field61
;;       Q6_RING_RADIUS    = data.field62
;;       Q6_RING_HOUR_ANGLE= data.field63
;;       Q7_RING_RADIUS    = data.field64
;;       Q7_RING_HOUR_ANGLE= data.field65
;;       Q8_RING_RADIUS    = data.field66
;;       Q8_RING_HOUR_ANGLE= data.field67
;;       Q9_RING_RADIUS    = data.field68
;;       Q9_RING_HOUR_ANGLE= data.field69
;;
;;      ;jd=fltarr(n_elements(fds_count))
;;      ;for j=0,n_elements(fds_count)-1 do begin
;;      ;    date=fltarr(5)
;;      ;    date[0]=scet_yr
;;      ;    date[1]=scet_day
;;      ;    date[2]=scet_hr
;;      ;    date[3]=scet_min
;;      ;    date[4]=scet_sec
;;      ;
;;      ;    jd[j]=date_conv(date,'J')
;;      ;endfor
;;
;;       k=where(picture_body eq 0 and $
;;               ;    data.pb_semi_diam le 1.6 and $
;;                     central_body eq planet and $
;;                     emiss_angle le 80 and $
;;                  ;   data.q5_latitude le -15.0 and $
;;                  ;   data.q5_latitude ge -30.0 and $
;;                     abs(q1_latitude) le 90.0 and $
;;                     abs(q2_latitude) le 90.0 and $
;;                     abs(q3_latitude) le 90.0 and $
;;                     abs(q4_latitude) le 90.0 and $
;;                     abs(q6_latitude) le 90.0 and $
;;                     abs(q7_latitude) le 90.0 and $
;;                     abs(q8_latitude) le 90.0 and $
;;                     abs(q9_latitude) le 90.0)
;;
;;       if k[0] ge 0 then oplot,fds_count,dist_sc_pb,psym=8,symsize=0.5
;;   endfor
;;
;;   device,/close


set_plot,'ps'
device,filename='saturn_irislat_test.eps',/encapsulated
!p.font=0
pcircle
planet=6
ca_v1=date_conv('1980-11-12 00:00:00','J')
ca_v2=date_conv('1981-08-26 00:00:00','J')

date_label=LABEL_DATE(DATE_FORMAT=['%Y/%N/%D'])


plot,[ca_v1-1.,ca_v1+3.],[-90,90],/nodata,xs=1,ys=1,$
title='Voyager 1 Latitude Coverage',ytitle='Planetographic Latitude',$
xtitle='Date',$
xtickformat='label_date',xtickunits='time',$
ytickinterval=10.,xthick=2,ythick=2,xminor=12

c=0
for i=0,nfiles-1 do begin
    data=read_csv(tabfiles[i])
    FDS_COUNT         = data.field01
    PICTURE_BODY      = data.field02
    CENTRAL_BODY      = data.field03
    Q5_LATITUDE       = data.field04
    Q5_LONGITUDE      = data.field05
    EMISS_ANGLE       = data.field06
    DIST_SC_PB        = data.field07
    PB_SUBSC_LAT      = data.field08
    PB_SUBSC_LON      = data.field09
    SC_PHASE_ANG      = data.field10
    PB_SEMI_DIAM      = data.field11
    LOCAL_TIME_HR     = data.field12
    SCET_YR           = data.field13
    SCET_DAY          = data.field14
    SCET_HR           = data.field15
    SCET_MIN          = data.field16
    SCET_SEC          = data.field17
    ERT_YR            = data.field18
    ERT_DAY           = data.field19
    ERT_HR            = data.field20
    ERT_MIN           = data.field21
    ERT_SEC           = data.field22
    DIST_CB_SUN       = data.field23
    DIST_SC_CB        = data.field24
    DIST_PB_SUN       = data.field25
    DIST_SC_PBTP      = data.field26
    SC_ALT            = data.field27
    Q1_LATITUDE       = data.field28
    Q1_LONGITUDE      = data.field29
    Q2_LATITUDE       = data.field30
    Q2_LONGITUDE      = data.field31
    Q3_LATITUDE       = data.field32
    Q3_LONGITUDE      = data.field33
    Q4_LATITUDE       = data.field34
    Q4_LONGITUDE      = data.field35
    Q6_LATITUDE       = data.field36
    Q6_LONGITUDE      = data.field37
    Q7_LATITUDE       = data.field38
    Q7_LONGITUDE      = data.field39
    Q8_LATITUDE       = data.field40
    Q8_LONGITUDE      = data.field41
    Q9_LATITUDE       = data.field42
    Q9_LONGITUDE      = data.field43
    Q5_LATITUDE_750   = data.field44
    Q5_LONGITUDE_750  = data.field45
    OPTIC_AXIS        = data.field46
    SUB_SOLAR_LAT     = data.field47
    SUB_SOLAR_LON     = data.field48
    SOL_ZENITH_ANG    = data.field49
    Q5_PHASE          = data.field50
    SOL_AZIMUTH_ANG   = data.field51
    Q1_RING_RADIUS    = data.field52
    Q1_RING_HOUR_ANGLE= data.field53
    Q2_RING_RADIUS    = data.field54
    Q2_RING_HOUR_ANGLE= data.field55
    Q3_RING_RADIUS    = data.field56
    Q3_RING_HOUR_ANGLE= data.field57
    Q4_RING_RADIUS    = data.field58
    Q4_RING_HOUR_ANGLE= data.field59
    Q5_RING_RADIUS    = data.field60
    Q5_RING_HOUR_ANGLE= data.field61
    Q6_RING_RADIUS    = data.field62
    Q6_RING_HOUR_ANGLE= data.field63
    Q7_RING_RADIUS    = data.field64
    Q7_RING_HOUR_ANGLE= data.field65
    Q8_RING_RADIUS    = data.field66
    Q8_RING_HOUR_ANGLE= data.field67
    Q9_RING_RADIUS    = data.field68
    Q9_RING_HOUR_ANGLE= data.field69
    
    jd=dblarr(n_elements(fds_count))
    for j=0,n_elements(fds_count)-1 do begin
        date=fltarr(5)
        date[0]=strcompress('19'+string(scet_yr[j]),/remove_all)
        date[1]=scet_day[j]
        date[2]=scet_hr[j]
        date[3]=scet_min[j]
        date[4]=scet_sec[j]
        
        jd[j]=date_conv(date,'M')
        ;print,date,jd[j]
    endfor
        
    k=where(dist_sc_pb lt 2.6e6 and picture_body eq 0 and $
            ;    data.pb_semi_diam le 1.6 and $
			central_body eq planet and $
			emiss_angle le 80 and $
               ;   data.q5_latitude le -15.0 and $
               ;   data.q5_latitude ge -30.0 and $
			abs(q1_latitude) le 90.0 and $
			abs(q2_latitude) le 90.0 and $
			abs(q3_latitude) le 90.0 and $
			abs(q4_latitude) le 90.0 and $
			abs(q6_latitude) le 90.0 and $
			abs(q7_latitude) le 90.0 and $
			abs(q8_latitude) le 90.0 and $
			abs(q5_latitude) le 90.0)
    
    if k[0] ge 0 then oplot,jd+2400000.5,q5_latitude,psym=8,symsize=0.5
    
    
    c=c+n_elements(k)
    if k[0] ge 0 then print,tabfiles[i],c
    
endfor


device,/close
end
