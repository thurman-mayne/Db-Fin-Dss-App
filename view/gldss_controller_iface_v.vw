CREATE OR REPLACE FORCE VIEW DSS_APP.GLDSS_CONTROLLER_IFACE_V
AS 
SELECT  -- elfa 
        CASE WHEN PERAKT > '1412' THEN -- After Calendar Shift
            CASE -- Move Period 13 to first period of next year
                 WHEN SUBSTR(PERAKT,3,2) >= '12' -- End of Year
                    THEN (SUBSTR(PERAKT,1,2) + 1) || '01' 
                 ELSE TO_CHAR(PERAKT + 01) 
             END 
        ELSE PERAKT -- Prior to Calendar Shift
        END                     AS                 PERAKT
      , BOL
      , MSTR_ACCT_ID
      , BELOPP_BASE_CURRENCY_AMT
      , BELOPP_LOCAL_CURRENCY_AMT
FROM GLDSS_CNTRL_FL1GR_IFACE_V
union all 
SELECT -- elfa and TCS eliminations 
        CASE WHEN PERAKT > '1412' THEN -- After Calendar Shift
            CASE -- Move Period 13 to first period of next year
                 WHEN SUBSTR(PERAKT,3,2) >= '12' -- End of Year
                    THEN (SUBSTR(PERAKT,1,2) + 1) || '01' 
                 ELSE TO_CHAR(PERAKT + 01) 
             END 
        ELSE PERAKT -- Prior to Calendar Shift
        END                     AS                 PERAKT
      , BOL
      , MSTR_ACCT_ID
      , BELOPP_BASE_CURRENCY_AMT
      , BELOPP_LOCAL_CURRENCY_AMT
FROM GLDSS_CNTRL_LE_IFACE_V
union all 
SELECT -- internal TCS eliminations 
        CASE WHEN PERAKT > '1412' THEN -- After Calendar Shift
            CASE -- Move Period 13 to first period of next year
                 WHEN SUBSTR(PERAKT,3,2) >= '12' -- End of Year
                    THEN (SUBSTR(PERAKT,1,2) + 1) || '01' 
                 ELSE TO_CHAR(PERAKT + 01) 
             END 
        ELSE PERAKT -- Prior to Calendar Shift
        END                     AS                 PERAKT
      , BOL
      , MSTR_ACCT_ID
      , BELOPP_BASE_CURRENCY_AMT
      , BELOPP_LOCAL_CURRENCY_AMT
FROM GLDSS_CNTRL_TCSGA_IFACE_V
union all 
SELECT -- Tax Adjustments(in USD)
        CASE WHEN PERAKT > '1412' THEN -- After Calendar Shift
            CASE -- Move Period 13 to first period of next year
                 WHEN SUBSTR(PERAKT,3,2) >= '12' -- End of Year
                    THEN (SUBSTR(PERAKT,1,2) + 1) || '01' 
                 ELSE TO_CHAR(PERAKT + 01) 
             END 
        ELSE PERAKT -- Prior to Calendar Shift
        END                     AS                 PERAKT
      , BOL
      , MSTR_ACCT_ID
      , BELOPP_BASE_CURRENCY_AMT
      , BELOPP_LOCAL_CURRENCY_AMT
FROM GLDSS_CNTRL_TCSIMA_IFACE_V;
