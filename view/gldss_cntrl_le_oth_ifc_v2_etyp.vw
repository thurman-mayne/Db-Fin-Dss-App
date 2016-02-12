CREATE OR REPLACE FORCE VIEW DSS_APP.GLDSS_CNTRL_LE_OTH_IFC_V2_ETYP AS
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
          -- gather specific entries for other sub-companies
          AND (
                  TRIM(UPPER(BOL))IN ('TCS','TCSINT')     AND TRIM(UPPER(A.ETYP)) ='36'
               OR TRIM(UPPER(BOL))IN ('03','TCS','TCSINT')AND TRIM(UPPER(A.ETYP)) ='1'
              )
          --
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NULL
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
          -- gather specific entries for other sub-companies
          AND (
                  TRIM(UPPER(BOL))IN ('TCS','TCSINT')     AND TRIM(UPPER(A.ETYP)) ='36'
               OR TRIM(UPPER(BOL))IN ('03','TCS','TCSINT')AND TRIM(UPPER(A.ETYP)) ='1'
              )
          --
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NULL
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
          -- gather specific entries for other sub-companies
          AND (
                  TRIM(UPPER(BOL))IN ('TCS','TCSINT')     AND TRIM(UPPER(A.ETYP)) ='36'
               OR TRIM(UPPER(BOL))IN ('03','TCS','TCSINT')AND TRIM(UPPER(A.ETYP)) ='1'
              )
          --
          AND SUBSTR(PERAKT,5,2) = 'AC' -- get only the actual/approved records
          AND TRIM(UPPER(A.BTYP)) IS NULL
      )
GROUP BY PERAKT
       , BOL
       , VKOD
       , KONTO
       , MSTR_ACCT_ID
;

