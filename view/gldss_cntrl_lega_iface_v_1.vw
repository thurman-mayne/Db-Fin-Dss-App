CREATE OR REPLACE FORCE VIEW DSS_APP.GLDSS_CNTRL_LEGA_IFACE_V_1 AS
SELECT  SUBSTR(PERAKT,1,4)  PERAKT
      , BOL
      , VKOD
      , MSTR_ACCT_ID
      , CASE
          WHEN TRIM(UPPER(VKOD)) = 'SEK' THEN 0
          WHEN TRIM(UPPER(VKOD)) = 'USD' THEN SUM(NVL(BELOPP,0))
          ELSE 0
        END                                     BELOPP_BASE_CURRENCY_AMT
      , CASE
          WHEN TRIM(UPPER(VKOD)) = 'SEK' THEN SUM(NVL(BELOPP,0))
          ELSE 0
        END                                     BELOPP_LOCAL_CURRENCY_AMT
FROM  (
        SELECT  PERAKT
              , BOL
              , VKOD
              , MSTR_ACCT_ID
              , BELOPP
        FROM GLDSS_CNTRL_LEGA_IFC_V_2_ETYP
        UNION ALL
        SELECT  PERAKT
              , BOL
              , VKOD
              , MSTR_ACCT_ID
              , BELOPP
        FROM GLDSS_CNTRL_LEGA_IFC_V_2_BTYP
      )
GROUP BY PERAKT
       , BOL
       , VKOD
       , MSTR_ACCT_ID;

