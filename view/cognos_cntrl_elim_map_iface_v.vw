CREATE OR REPLACE FORCE VIEW DSS_APP.COGNOS_CNTRL_ELIM_MAP_IFACE_V AS
SELECT  -- Pull the Elimination company mappings from the IFACE table
        --
        TCS_CONTROLLER
      , MSTR_ACCT_ID
      , MAX(CONV_FACTOR)   CONV_FACTOR
FROM COGNOS_CNTRL_MAPPING_IFACE
WHERE SUBSTR(MSTR_ACCT_ID,1,2) IN ('EL','EA')
GROUP BY TCS_CONTROLLER
       , MSTR_ACCT_ID
;

