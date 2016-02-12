CREATE OR REPLACE FORCE VIEW DSS_APP.GLDSS_CNTRL_LE_IFACE_V AS
SELECT  PERAKT
      , 'LE'                            BOL
      , MSTR_ACCT_ID
      , SUM(BELOPP_BASE_CURRENCY_AMT)   BELOPP_BASE_CURRENCY_AMT
      , SUM(BELOPP_LOCAL_CURRENCY_AMT)  BELOPP_LOCAL_CURRENCY_AMT
FROM (
        -- select all the Elimination sub-companies and force them
        -- all back to Eliminations
        SELECT  PERAKT
              , BOL
              , MSTR_ACCT_ID
              , BELOPP_BASE_CURRENCY_AMT
              , BELOPP_LOCAL_CURRENCY_AMT
        FROM GLDSS_CNTRL_LEADJ_IFACE_V_1
        --
        UNION ALL
        --
        SELECT  PERAKT
              , BOL
              , MSTR_ACCT_ID
              , BELOPP_BASE_CURRENCY_AMT
              , BELOPP_LOCAL_CURRENCY_AMT
        FROM GLDSS_CNTRL_LEGA_IFACE_V_1
        --
        UNION ALL
        --
        SELECT  PERAKT
              , BOL
              , MSTR_ACCT_ID
              , BELOPP_BASE_CURRENCY_AMT
              , BELOPP_LOCAL_CURRENCY_AMT
        FROM GLDSS_CNTRL_TCSIGA_IFACE_V_1
        --
        UNION ALL
        --
        SELECT  PERAKT
              , BOL
              , MSTR_ACCT_ID
              , BELOPP_BASE_CURRENCY_AMT
              , BELOPP_LOCAL_CURRENCY_AMT
        FROM GLDSS_CNTRL_LE_OTH_IFACE_V_1
     )
GROUP BY PERAKT
       , 'LE'
       , MSTR_ACCT_ID
;

