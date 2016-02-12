CREATE OR REPLACE FORCE VIEW DSS_APP.GLDSS_CNTRL_LEGA_IFC_V_2_BTYP AS
SELECT  PERAKT
      , BOL
      , VKOD
      , KONTO
      , MSTR_ACCT_ID
      , SUM(BELOPP)    BELOPP
FROM (
        -- FY2013
        --
        SELECT  TRIM(A.PERAKT)          PERAKT
              , TRIM(UPPER(A.BOL))      BOL
              , TRIM(UPPER(A.VKOD))     VKOD
              , TRIM(UPPER(A.KONTO))    KONTO
              , TRIM(UPPER(A.BTYP))     BTYP
              , TRIM(UPPER(A.ETYP))     ETYP
              , A.BELOPP *
                B.CONV_FACTOR           BELOPP
              , B.MSTR_ACCT_ID
        FROM  XDB13 A
            , COGNOS_CNTRL_ELIM_MAP_IFACE_V B
        WHERE TRIM(UPPER(A.KONTO)) = B.TCS_CONTROLLER
          AND TRIM(UPPER(BOL)) = 'LEGA'
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NOT NULL
          AND TRIM(UPPER(A.ETYP)) IS NULL
        --
        UNION ALL
        --
        -- FY2014
        --
        SELECT  TRIM(A.PERAKT)          PERAKT
              , TRIM(UPPER(A.BOL))      BOL
              , TRIM(UPPER(A.VKOD))     VKOD
              , TRIM(UPPER(A.KONTO))    KONTO
              , TRIM(UPPER(A.BTYP))     BTYP
              , TRIM(UPPER(A.ETYP))     ETYP
              , A.BELOPP *
                B.CONV_FACTOR           BELOPP
              , B.MSTR_ACCT_ID
        FROM  XDB14 A
            , COGNOS_CNTRL_ELIM_MAP_IFACE_V B
        WHERE TRIM(UPPER(A.KONTO)) = B.TCS_CONTROLLER
          AND TRIM(UPPER(BOL)) = 'LEGA'
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NOT NULL
          AND TRIM(UPPER(A.ETYP)) IS NULL
        --
        UNION ALL
        --
        -- FY2015
        --
        SELECT  TRIM(A.PERAKT)          PERAKT
              , TRIM(UPPER(A.BOL))      BOL
              , TRIM(UPPER(A.VKOD))     VKOD
              , TRIM(UPPER(A.KONTO))    KONTO
              , TRIM(UPPER(A.BTYP))     BTYP
              , TRIM(UPPER(A.ETYP))     ETYP
              , A.BELOPP *
                B.CONV_FACTOR           BELOPP
              , B.MSTR_ACCT_ID
        FROM  XDB15 A
            , COGNOS_CNTRL_ELIM_MAP_IFACE_V B
        WHERE TRIM(UPPER(A.KONTO)) = B.TCS_CONTROLLER
          AND TRIM(UPPER(BOL)) = 'LEGA'
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NOT NULL
          AND TRIM(UPPER(A.ETYP)) IS NULL
      )
GROUP BY PERAKT
       , BOL
       , VKOD
       , KONTO
       , MSTR_ACCT_ID
;

