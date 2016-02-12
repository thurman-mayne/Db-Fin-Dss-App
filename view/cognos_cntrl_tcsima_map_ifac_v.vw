CREATE OR REPLACE FORCE VIEW DSS_APP.COGNOS_CNTRL_TCSIMA_MAP_IFAC_V AS
SELECT  -- Pull the elfa company mappings from the IFACE table
        --
        TCS_CONTROLLER
      , MSTR_ACCT_ID
      , MAX(CONV_FACTOR)   CONV_FACTOR
FROM COGNOS_CNTRL_MAPPING_IFACE
WHERE SUBSTR(MSTR_ACCT_ID,1,2) NOT IN ('EL','EA','EG') -- Exclude the eliminations accounts
GROUP BY TCS_CONTROLLER
       , MSTR_ACCT_ID
;
