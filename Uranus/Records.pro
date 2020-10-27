;Records.pro:

;-----------------------------------------------------------------------------
; Name:
;     Records
;
; Purpose:
;     Define the Voyager IRIS record structures.
;
; History:
;     Original written by Karen Horrocks, Raytheon ITSS, 1999; based on
;         software written by Carolyn Martin, SSAI, 1994.
;
;-----------------------------------------------------------------------------

; record structure of vg1_jup.dat and vg2_jup.dat data files; these files are
; part of the PDS data set VG1/VG2-J-IRIS-3-RDR-V1.0.

mJupiterRecord = {               $
     count:                   0L, $
     end_count:               0L, $
     n_avg:                   0L, $
     picture_body:            0L, $
     central_body:            0L, $
     sc_id:                   0L, $
     q5_latitude:            0.0, $
     q5_longitude:           0.0, $
     emiss_angle:            0.0, $
     dist_sc_pb:             0.0, $
     pb_subsc_lat:           0.0, $
     pb_subsc_lon:           0.0, $
     sc_phase_ang:           0.0, $
     pb_semi_diam:           0.0, $
     rad_norm:         fltarr(8), $
     rad_high:         fltarr(8), $
     local_time_hr:          0.0, $
     scet:             lonarr(5), $
     ert:              lonarr(5), $
     dist_cb_sun:            0.0, $
     dist_sc_cb:             0.0, $
     dist_pb_sun:            0.0, $
     dist_sc_pbtp:           0.0, $
     sc_alt:                 0.0, $
     q1_latitude:            0.0, $
     q1_longitude:           0.0, $
     q2_latitude:            0.0, $
     q2_longitude:           0.0, $
     q3_latitude:            0.0, $
     q3_longitude:           0.0, $
     q4_latitude:            0.0, $
     q4_longitude:           0.0, $
     q6_latitude:            0.0, $
     q6_longitude:           0.0, $
     q7_latitude:            0.0, $
     q7_longitude:           0.0, $
     q8_latitude:            0.0, $
     q8_longitude:           0.0, $
     q9_latitude:            0.0, $
     q9_longitude:           0.0, $
     q5_latitude_750:        0.0, $
     q5_longitude_750:       0.0, $
     optic_axis:             0.0, $
     sub_solar_lat:          0.0, $
     sub_solar_lon:          0.0, $
     sol_zenith_ang:         0.0, $
     q5_phase:               0.0, $
     sol_azimuth_ang:        0.0, $
     emiss_angle_750:        0.0, $
     avg_btemp_22mu:         0.0, $
     avg_btemp_5mu:          0.0, $
     ir_det_temp:            0.0, $
     radiom_temp:            0.0, $
     beamsp_temp:            0.0, $
     mic_mot_temp:           0.0, $
     rad_sur_temp:           0.0, $
     pri_ctr_temp:           0.0, $
     pri_edg_temp:           0.0, $
     sec_mir_temp:           0.0, $
     elect_temp:             0.0, $
     reject_code:             0L, $
     cold_cal:                0L, $
     phase_resid:            0.0, $
     int_vis:                0.0, $
     int_5mu:                0.0, $
     int_ir:                 0.0, $
     wn0:                    0.0, $
     dwn:                    0.0, $
     npt:                     0L, $
     radiance:      fltarr(1093) }

; record structure of vg1_sat.dat and vg2_sat.dat data files; these files are
; part of the PDS data set VG1/VG2-S-IRIS-3-RDR-V1.0.

mSaturnRecord = {                $
     count:                   0L, $
     end_count:               0L, $
     n_avg:                   0L, $
     picture_body:            0L, $
     central_body:            0L, $
     sc_id:                   0L, $
     q5_latitude:            0.0, $
     q5_longitude:           0.0, $
     emiss_angle:            0.0, $
     dist_sc_pb:             0.0, $
     pb_subsc_lat:           0.0, $
     pb_subsc_lon:           0.0, $
     sc_phase_ang:           0.0, $
     pb_semi_diam:           0.0, $
     rad_norm:         fltarr(8), $
     rad_high:         fltarr(8), $
     local_time_hr:          0.0, $
     scet:             lonarr(5), $
     ert:              lonarr(5), $
     dist_cb_sun:            0.0, $
     dist_sc_cb:             0.0, $
     dist_pb_sun:            0.0, $
     dist_sc_pbtp:           0.0, $
     sc_alt:                 0.0, $
     q1_latitude:            0.0, $
     q1_longitude:           0.0, $
     q2_latitude:            0.0, $
     q2_longitude:           0.0, $
     q3_latitude:            0.0, $
     q3_longitude:           0.0, $
     q4_latitude:            0.0, $
     q4_longitude:           0.0, $
     q6_latitude:            0.0, $
     q6_longitude:           0.0, $
     q7_latitude:            0.0, $
     q7_longitude:           0.0, $
     q8_latitude:            0.0, $
     q8_longitude:           0.0, $
     q9_latitude:            0.0, $
     q9_longitude:           0.0, $
     q5_latitude_750:        0.0, $
     q5_longitude_750:       0.0, $
     optic_axis:             0.0, $
     sub_solar_lat:          0.0, $
     sub_solar_lon:          0.0, $
     sol_zenith_ang:         0.0, $
     q5_phase:               0.0, $
     sol_azimuth_ang:        0.0, $
     emiss_angle_750:        0.0, $
     avg_btemp_22mu:         0.0, $
     avg_btemp_5mu:          0.0, $
     ir_det_temp:            0.0, $
     radiom_temp:            0.0, $
     beamsp_temp:            0.0, $
     mic_mot_temp:           0.0, $
     rad_sur_temp:           0.0, $
     pri_ctr_temp:           0.0, $
     pri_edg_temp:           0.0, $
     sec_mir_temp:           0.0, $
     elect_temp:             0.0, $
     reject_code:             0L, $
     cold_cal:                0L, $
     phase_resid:            0.0, $
     int_vis:                0.0, $
     int_5mu:                0.0, $
     int_ir:                 0.0, $
     wn0:                    0.0, $
     dwn:                    0.0, $
     npt:                     0L, $
     radiance:      fltarr(1093) }

; record structure of vg2_ura.dat data file; this file is part of the PDS data
; set VG2-U-IRIS-3-RDR-V1.0.

mUranusRecord = {                $
     count:                   0L, $
     end_count:               0L, $
     n_avg:                   0L, $
     picture_body:            0L, $
     central_body:            0L, $
     sc_id:                   0L, $
     q5_latitude:            0.0, $
     q5_longitude:           0.0, $
     emiss_angle:            0.0, $
     dist_sc_pb:             0.0, $
     pb_subsc_lat:           0.0, $
     pb_subsc_lon:           0.0, $
     sc_phase_ang:           0.0, $
     pb_semi_diam:           0.0, $
     rad_norm:         fltarr(8), $
     rad_high:         fltarr(8), $
     local_time_hr:          0.0, $
     scet:             lonarr(5), $
     ert:              lonarr(5), $
     dist_cb_sun:            0.0, $
     dist_sc_cb:             0.0, $
     dist_pb_sun:            0.0, $
     dist_sc_pbtp:           0.0, $
     sc_alt:                 0.0, $
     q1_latitude:            0.0, $
     q1_longitude:           0.0, $
     q2_latitude:            0.0, $
     q2_longitude:           0.0, $
     q3_latitude:            0.0, $
     q3_longitude:           0.0, $
     q4_latitude:            0.0, $
     q4_longitude:           0.0, $
     q6_latitude:            0.0, $
     q6_longitude:           0.0, $
     q7_latitude:            0.0, $
     q7_longitude:           0.0, $
     q8_latitude:            0.0, $
     q8_longitude:           0.0, $
     q9_latitude:            0.0, $
     q9_longitude:           0.0, $
     q5_latitude_750:        0.0, $
     q5_longitude_750:       0.0, $
     optic_axis:             0.0, $
     sub_solar_lat:          0.0, $
     sub_solar_lon:          0.0, $
     sol_zenith_ang:         0.0, $
     q5_phase:               0.0, $
     sol_azimuth_ang:        0.0, $
     emiss_angle_750:        0.0, $
     avg_btemp_22mu:         0.0, $
     avg_btemp_5mu:          0.0, $
     ir_det_temp:            0.0, $
     radiom_temp:            0.0, $
     beamsp_temp:            0.0, $
     mic_mot_temp:           0.0, $
     rad_sur_temp:           0.0, $
     pri_ctr_temp:           0.0, $
     pri_edg_temp:           0.0, $
     sec_mir_temp:           0.0, $
     elect_temp:             0.0, $
     reject_code:             0L, $
     cold_cal:                0L, $
     phase_resid:            0.0, $
     int_vis:                0.0, $
     int_5mu:                0.0, $
     int_ir:                 0.0, $
     wn0:                    0.0, $
     dwn:                    0.0, $
     npt:                     0L, $
     radiance:       fltarr(303) }

; record structure of vg2_nep.dat data file; this file is part of the PDS data
; set VG2-N-IRIS-3-RDR-V1.0.

mNeptuneRecord = {               $
     count:                   0L, $
     end_count:               0L, $
     n_avg:                   0L, $
     picture_body:            0L, $
     central_body:            0L, $
     sc_id:                   0L, $
     q5_latitude:            0.0, $
     q5_longitude:           0.0, $
     emiss_angle:            0.0, $
     dist_sc_pb:             0.0, $
     pb_subsc_lat:           0.0, $
     pb_subsc_lon:           0.0, $
     sc_phase_ang:           0.0, $
     pb_semi_diam:           0.0, $
     rad_norm:         fltarr(8), $
     rad_high:         fltarr(8), $
     local_time_hr:          0.0, $
     scet:             lonarr(5), $
     ert:              lonarr(5), $
     dist_cb_sun:            0.0, $
     dist_sc_cb:             0.0, $
     dist_pb_sun:            0.0, $
     dist_sc_pbtp:           0.0, $
     sc_alt:                 0.0, $
     q1_latitude:            0.0, $
     q1_longitude:           0.0, $
     q2_latitude:            0.0, $
     q2_longitude:           0.0, $
     q3_latitude:            0.0, $
     q3_longitude:           0.0, $
     q4_latitude:            0.0, $
     q4_longitude:           0.0, $
     q6_latitude:            0.0, $
     q6_longitude:           0.0, $
     q7_latitude:            0.0, $
     q7_longitude:           0.0, $
     q8_latitude:            0.0, $
     q8_longitude:           0.0, $
     q9_latitude:            0.0, $
     q9_longitude:           0.0, $
     q5_latitude_750:        0.0, $
     q5_longitude_750:       0.0, $
     optic_axis:             0.0, $
     sub_solar_lat:          0.0, $
     sub_solar_lon:          0.0, $
     sol_zenith_ang:         0.0, $
     q5_phase:               0.0, $
     sol_azimuth_ang:        0.0, $
     emiss_angle_750:        0.0, $
     avg_btemp_22mu:         0.0, $
     avg_btemp_5mu:          0.0, $
     ir_det_temp:            0.0, $
     radiom_temp:            0.0, $
     beamsp_temp:            0.0, $
     mic_mot_temp:           0.0, $
     rad_sur_temp:           0.0, $
     pri_ctr_temp:           0.0, $
     pri_edg_temp:           0.0, $
     sec_mir_temp:           0.0, $
     elect_temp:             0.0, $
     reject_code:             0L, $
     cold_cal:                0L, $
     phase_resid:            0.0, $
     int_vis:                0.0, $
     int_5mu:                0.0, $
     int_ir:                 0.0, $
     wn0:                    0.0, $
     dwn:                    0.0, $
     npt:                     0L, $
     radiance:       fltarr(349) }

