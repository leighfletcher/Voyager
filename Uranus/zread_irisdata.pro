pro zread_irisdata,sfilename,data,ntotal,planet


; Include record structure definitions
@Records.pro

; Initialize record structure, record size, and number of records
IF (STRPOS(sfilename, 'vg1_jup.dat') ge 0) THEN BEGIN
    mRecord = mJupiterRecord
    lRecordSize   = 4736
    lRecordNumber = 9098
    planet=5
END ELSE $
IF (STRPOS(sfilename, 'vg2_jup.dat') ge 0) THEN BEGIN
    mRecord = mJupiterRecord
    lRecordSize   = 4736
    lRecordNumber = 11624
    planet=5
END ELSE $
IF (STRPOS(sfilename, 'vg1_sat.dat') ge 0) THEN BEGIN
    mRecord = mSaturnRecord
    lRecordSize   = 4736
    lRecordNumber = 6019
    planet=6
END ELSE $
IF (STRPOS(sfilename, 'vg2_sat.dat') ge 0) THEN BEGIN
    mRecord = mSaturnRecord
    lRecordSize   = 4736
    lRecordNumber = 6210
    planet=6
END ELSE $
IF (STRPOS(sfilename, 'VG2_URA.DAT') ge 0) THEN BEGIN
    mRecord = mUranusRecord
    lRecordSize   = 1576
    lRecordNumber = 6864
    planet=7
END ELSE $
IF (STRPOS(sfilename, 'vg2_nep.dat') ge 0) THEN BEGIN
    mRecord = mNeptuneRecord
    lRecordSize   = 1760
    lRecordNumber = 6247
    planet=8
END ELSE PRINT, 'Not a valid file name.'


OPENR, lun, sfilename, /GET_LUN

data=replicate(mRecord,lRecordNumber)


for i=0,lRecordNumber-1 do begin
readu, lun, mRecord
mRecord = CONV_VAX_UNIX(mRecord)
data[i]=mRecord
endfor
ntotal=lRecordNumber

free_lun,lun
return
end
