pro readrec, ilun, wave, spec, pbod, cbod, q5lat, q5lon, emiss, phase,$
sol_zenith,ireject,ical,ivis,r5um,rir,distpb,distcb,fdsc,minlat,maxlat,minlon,maxlon,sc_lat

;1	1 FDS_COUNT   		VAX_INTEGER
;
;4	13 PICTURE_BODY 	VAX_INTEGER
;5	17 CENTRAL_BODY 	VAX_INTEGER
;
;7	25 Q5_LATITUDE 		VAX_REAL
;8	29 Q5_LONGITUDE 	VAX_REAL
;9	33 EMISS_ANGLE 		VAX_REAL
;10	37 DIST_SC_PB 		VAX_REAL
;11	41 PB_SUBSC_LAT 	VAX_REAL
;12	45 PB_SUBSC_LON 	VAX_REAL
;13	49 SC_PHASE_ANG 	VAX_REAL
;14	53   PB_SEMI_DIAM 	VAX_REAL
;15-22	57 - 88 RAD_NORM(8) 	VAX_REAL
;23-30  89 - 120 RAD_HIGH(8) 	VAX_REAL
;31	121  LOCAL_TIME_HR 	VAX_REAL
;32-36	125 - 144 SPC_TIME(5)	VAX_INTEGER
;37-41	145 - 164 ERT_TIME(5) 	VAX_INTEGER
;42	165 DIST_CB_SUN 	VAX_REAL
;43	169 DIST_SC_CB 		VAX_REAL
;44	173 DIST_PB_SUN 	VAX_REAL
;45	177 DIST_SC_PBTP 	VAX_REAL
;46	181 SC_ALT  		VAX_REAL
;47	185 Q1_LATITUDE 	VAX_REAL
;48	189 Q1_LONGITUDE 	VAX_REAL
;49	193 Q2_LATITUDE 	VAX_REAL
;50	197 Q2_LONGITUDE 	VAX_REAL
;51	201 Q3_LATITUDE 	VAX_REAL
;52	205 Q3_LONGITUDE 	VAX_REAL
;53	209 Q4_LATITUDE 	VAX_REAL
;54	213 Q4_LONGITUDE 	VAX_REAL
;55	217 Q6_LATITUDE 	VAX_REAL
;56	221 Q6_LONGITUDE 	VAX_REAL
;57	225 Q7_LATITUDE 	VAX_REAL
;58	229 Q7_LONGITUDE 	VAX_REAL
;59	233 Q8_LATITUDE 	VAX_REAL
;60	237 Q8_LONGITUDE 	VAX_REAL
;61	241 Q9_LATITUDE 	VAX_REAL
;62	245 Q9_LONGITUDE 	VAX_REAL
;63	249 Q5_LATITUDE_750 	VAX_REAL
;64	253 Q5_LONGITUDE_750 	VAX_REAL
;65	257 OPTIC_AXIS 		VAX_REAL
;66	261 SUB_SOLAR_LAT 	VAX_REAL
;67	265 SUB_SOLAR_LON 	VAX_REAL
;68	269 SOL_ZENITH_ANG 	VAX_REAL
;69	273 Q5_PHASE 		VAX_REAL
;70	277 SOL_AZIMUTH_ANG 	VAX_REAL
;71	281 EMISS_ANGLE_750 	VAX_REAL
;72	285 AVG_BTEMP_22MU 	VAX_REAL 
;73	289 AVG_BTEMP_5MU 	VAX_REAL
;74	293 IR_DET_TEMP 	VAX_REAL
;75	297 RADIOM_TEMP 	VAX_REAL
;76	301 BEAMSP_TEMP 	VAX_REAL
;77	305 MIC_MOT_TEMP 	VAX_REAL
;78	309 RAD_SUR_TEMP 	VAX_REAL
;79	313 PRI_CTR_TEMP 	VAX_REAL
;80	317 PRI_EDG_TEMP  	VAX_REAL
;81	321 SEC_MIR_TEMP 	VAX_REAL
;82	325 ELECT_TEMP 		VAX_REAL
;83	329 REJECT_CODE 	VAX_INTEGER
;84	333 COLD_CAL 		VAX_INTEGER
;85	337 PHASE_RESID 	VAX_REAL
;86	341 INT_VIS 		VAX_REAL
;87	345 INT_5MU  		VAX_REAL
;88	349 INT_IR 		VAX_REAL
;89	353 VMIN 		VAX_REAL
;90	357 DELV 		VAX_REAL
;91	361 NPOINT 		VAX_INTEGER

iblock = lonarr(91)
rblock = fltarr(91)
iblock(*)=0
rblock(*)=0.0

itmp = lonarr(6)
readu,ilun,itmp
iblock(0:5) = itmp

rtmp = fltarr(25)
readu,ilun,rtmp
rblock(6:30) = rtmp

itmp = lonarr(10)
readu,ilun,itmp
iblock(31:40) = itmp

rtmp = fltarr(41)
readu,ilun,rtmp
rblock(41:81)=rtmp

itmp = lonarr(2)
readu,ilun,itmp
iblock(82:83)=itmp

rtmp = fltarr(6)
readu,ilun,rtmp
rblock(84:89)=rtmp

i = long(1)
readu,ilun,i
iblock(90)=i

iblock = conv_vax_unix(iblock)
rblock = conv_vax_unix(rblock)

; print,iblock(0:5)
; print,rblock(6:30)
; print,iblock(31:40)
; print,rblock(41:81)
; print,iblock(82:83)
; print,rblock(84:89)
; print,iblock(90)

npoint = iblock(90)
vmin = rblock(88)
delv = rblock(89)
spec = fltarr(npoint)
wave = vmin+delv*findgen(npoint)

readu,ilun,spec

spec = conv_vax_unix(spec)


pbod = iblock(3)
cbod = iblock(4) 
q5lat = rblock(6)
q5lon = rblock(7)
emiss = rblock(8)
phase = rblock(68)
sol_zenith = rblock(67)
ireject = iblock(82)
ical = iblock(83)
ivis = rblock(85)
r5um = rblock(86)
rir = rblock(87)
fdsc = iblock(0)
distpb = rblock(9)
distcb = rblock(42)
q5_lat_750=rblock(62)
q5_long_750=rblock(63)
sc_lat=rblock(10)

els=[46,48,50,52,54,56,58,60]
minlat=min(rblock(els))
maxlat=max(rblock(els))
els=[46,48,50,52,54,56,58,60]+1
minlon=min(rblock(els))
maxlon=max(rblock(els))


return

end
