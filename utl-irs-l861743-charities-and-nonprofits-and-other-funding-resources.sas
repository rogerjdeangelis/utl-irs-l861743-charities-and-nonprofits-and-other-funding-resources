%let pgm=utl-irs-l861743-charities-and-nonprofits-and-other-funding-resources;

IRS l861743 charities and nonprofits and other funding resources

%stop_submission;

github
https://tinyurl.com/55mne2f
https://github.com/rogerjdeangelis/utl-irs-l861743-charities-and-nonprofits-and-other-funding-resources
R package
https://github.com/Nonprofit-Open-Data-Collective/irs-exempt-org-business-master-file

https://github.com/Nonprofit-Open-Data-Collective

  Resources

   1 IRS non-profits                       (download from onedrive https://tinyurl.com/3cpr5mtz0
   2 download dnr_bill_melinda.xlsx        (download from this repo)
   3 download dnr_vetted_nonprofits.xlsx   (download from this repo)
   4 download dnr_wikifoundations_sfx.xlsx (download from this repo)
   5 download dnr_vettedfoundations.xlsx   (download from this repo)


Fundraising Resources

    dnr_eos.exe                       1,861,743 IRS charities non-profits
       https://tinyurl.com/3cpr5mtz
       https://1drv.ms/u/c/bb0f3c4c9b1dc58b/Ed8xi5OYNqNDtpFajpqcI0cBAhT_8HssN8jZDSvoTxNmOw?e=FEUbTY
       dnr_irsmjrmnr_cntlin.sas7bdat  682 format to convert IRS codes to descriptions
    dnr_bill_melinda.xlsx             35,576 organizations
    dnr_vetted_nonprofits.xlsx        8,660 vetted IRS charities non-profits
    dnr_wikifoundations_sfx.xlsx      811 wiki non-profits
    dnr_vettedfoundations.clsx        185 vetted foundations

https://www.irs.gov/charities-non-profits/exempt-organizations-business-master-file-extract-eo-bmf
https://en.wikipedia.org/wiki/List_of_charitable_foundations
https://en.wikipedia.org/wiki/List_of_philanthropists
https://en.wikipedia.org/w/index.php?title=list_of_charitable_foundations


    /*
     _ __  _ __ ___   ___ ___  ___ ___
    | `_ \| `__/ _ \ / __/ _ \/ __/ __|
    | |_) | | | (_) | (_|  __/\__ \__ \
    | .__/|_|  \___/ \___\___||___/___/
    |_|
    */

    libname library "d:/dnr";
    libname dnr "d:/dnr";

    proc format lib=dnr.formats;
     value $org2type

    '01'='01 Government Instrumentality'
    '02'='02 Title-Holding Corporation'
    '03'='03 Charitable, Educational, Religious, Scientific Organization'
    '04'='04 Civic League, Social Welfare Organization'
    '05'='05 Labor, Agricultural, Horticultural Organization'
    '06'='06 Business League, Chamber of Commerce'
    '07'='07 Social Club'
    '08'='08 Fraternal Beneficiary Society'
    '09'='09 Voluntary Employees Beneficiary Association'
    '10'='10 Domestic Fraternal Society'
    '11'='11 Teachers Retirement Fund Association'
    '12'='12 Benevolent Life Insurance Association'
    '13'='13 Cemetery Company'
    '14'='14 Credit Union, Mutual Reserve Fund'
    '15'='15 Mutual Insurance Company'
    '16'='16 Corporation to Finance Crop Operations'
    '17'='17 Supplemental Unemployment Benefit Trust'
    '18'='18 Employee-Funded Pension Trust'
    '19'='19 War Veterans Organization'
    '20'='20 Legal Service Organization'
    '21'='21 Black Lung Benefit Trust'
    '22'='22 Multiemployer Pension Plan'
    '23'='23 Veterans Organization (formed before 1880)'
    '24'='24 Trust Described in Section 4049 of ERISA'
    '25'='25 Title Holding Corporation for Pensions'
    '26'='26 State-Sponsored High-Risk Health Coverage Organization'
    '27'='27 State-Sponsored Workers Compensation Reinsurance Organization'
    '40'='40 Religious or Apostolic Organization'
    '50'='50 Cooperative Hospital Service Organization'
    '60'='60 Cooperative Service Organization of Operating Educational Organizations'
    '70'='70 Child Care Organization'
    '71'='71 Charitable Risk Pool'
    '81'='81 Qualified State Tuition Program'
     other ="Other"
    ;
    run;quit;

    proc format lib=dnr.formats;
     value $org2des
    '1'='1 Corporation'
    '2'='2 Trust'
    '3'='3 Cooperative'
    '4'='4 Association'
    '5'='5 Other'
    other='Other'
    ;
    run;quit;

    /*----                                                                   ----*/
    /*---- FOUNDATIONS                                                       ----*/
    /*----                                                                   ----*/

    proc format lib=dnr.formats;
     value $fund2des
    '00'='00 Organizations except 501(c)(3) '
    '02'='02 Private operating foundation exempt from paying excise taxes or investment income'
    '03'='03 Private operating foundation (other) '
    '04'='04 Private nonoperating foundation '
    '09'='09 Suspense '
    '10'='10 Church '
    '11'='11 School '
    '12'='12 Hospital or medical research '
    '13'='13 Ooperates for college and is owned un it 14 Govt. unit '
    '15'='15 Receivessupport from a govt unit or public 16 Organization t '
    '16'='16 Receives < 1/3 investment unrelated business income from contributions '
    '17'='17 Operated solely to benefit organizations described in 10 through. '
    '18'='18 Organization organized and operated to test for public safety '
    other='Other'
    ;
    run;quit;

    proc format lib=dnr.formats;
     value $asset2amt
    '0'='0 0 '
    '1'='1 1 - 9,999 '
    '2'='2 10,000 - 24,999 '
    '3'='3 25,000 - 99,999 '
    '4'='4 100,000 - 499,999 '
    '5'='5 500,000 - 999,999 '
    '6'='6 1,000,000 - 4,999,999 '
    '7'='7 5,000,000 - 9,999,999 '
    '8'='8 10,000,000 - 49,999,999'
    '9'='9 = 50,000,000 '
    'other'='Other'
    ;
    run;quit;

    proc format lib=dnr.formats;
     value $affil2des
    '1'='1 Central - National, Regional '
    '2'='2 Intermediate - No group exemption National, Regional or Geographic State '
    '3'='3 Independent - Independent organization not affiliated with a National or State '
    '6'='6 Central - Parent (group ruling) not a church or 501(c)(1) organization. '
    '7'='7 Intermediate - This code is used if the organization is an group exemption intermediate '
    '8'='8 Central - Code is used if the organization is a parent (group ruling) church '
    '9'='9 Subordinate - Code is used if the organization is a subordinate in a group ruling. '
    other='Other'
    ;
    run;quit;

    proc format lib=dnr.formats;
     value $status
    '01'='01 Unconditional Exemption '
    '02'='02 Conditional Exemption '
    '12'='12 Trust '
    '25'='25 Terminating private foundation status '
    ;
    run;quit;

    data tst;
     x=put('01',$status.);
     put x=;
    run;quit;

    proc format
        cntlin=dnr.dnr_irsmjrmnr_cntlin
       library=dnr.formats;
    run;quit;

    * insert inline format below;

    data tst;
     x=put('W30',$NTEE2MJRMNR.);
     put x=;
    run;quit;

    data dnr.dnr_irsall;

     retain orgtype major minor orgdes
       fund asset status ruling_year;

     informat
       EIN NAME ICO STREET CITY STATE
       ZIP GROUP SUBSECTION AFFILIATION
       CLASSIFICATION RULING
       DEDUCTIBILITY FOUNDATION
       ACTIVITY ORGANIZATION
       STATUS TAX_PERIOD ASSET_CD
       INCOME_CD FILING_REQ_CD
       PF_FILING_REQ_CD ACCT_PD
       ASSET_AMT INCOME_AMT REVENUE_AMT
       NTEE_CD SORT_NAME $200.
       ;

     infile "d:/dnr/dnr_eos.csv"
         dsd delimiter=',' missover;

     input
       EIN NAME ICO STREET CITY STATE
       ZIP GROUP SUBSECTION AFFILIATION
       CLASSIFICATION RULING
       DEDUCTIBILITY FOUNDATION
       ACTIVITY ORGANIZATION
       STATUS TAX_PERIOD ASSET_CD
       INCOME_CD FILING_REQ_CD
       PF_FILING_REQ_CD ACCT_PD
       ASSET_AMT INCOME_AMT REVENUE_AMT
       NTEE_CD SORT_NAME
       ;

      if asset_cd ne 'ASSET_CD';
      status=put(status,$status.);
      major=
      put(substr(strip(ntee_cd),1,1)
         ,?? $NTEE2MJRMNR.);

      minor=put(strip(ntee_cd)
         ,?? $NTEE2MJRMNR.);

      orgtype=put(strip(subsection)
       ,$org2type.);

      orgdes=put(organization,$org2des.);

      if major='OTHER' then major="";
      if minor='OTHER' then minor="";

      fund=put(foundation,$fund2des.);
      asset=put(strip(asset_cd),$asset2amt.);
      affil=put(affiliation,$affil2des.);
      ruling_year=substr(ruling,1,4);


    run;quit;

    /*----                                                                   ----*/
    /*----  reduse varialble lengths to max observed                         ----*/
    /*----                                                                   ----*/

    %utl_optlenpos(dnr.dnr_irsall,dnr.dnr_irsall);


    /*           _               _
      ___  _   _| |_ _ __  _   _| |_
     / _ \| | | | __| `_ \| | | | __|
    | (_) | |_| | |_| |_) | |_| | |_
     \___/ \__,_|\__| .__/ \__,_|\__|
                    |_|
    */

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* Middle Observation(930870 ) dnr.dnr_irsall - Total Obs 1861740                                                         */
    /*                                                                                                                        */
    /*  -- CHARACTER --                                                                                                       */
    /* Variable                        Typ    Value                                                                           */
    /*                                                                                                                        */
    /* ORGTYPE                          C64   03 Charitable, Educational,                                                     */
    /* MAJOR                            C53   E Health Care                                                                   */
    /* MINOR                            C124  E19 Support N.E.C.                                                              */
    /* ORGDES                           C13   1 Corporation                                                                   */
    /* FUND                             C84   15 Receivessupport from a g                                                     */
    /* ASSET                            C25   0 0                                                                             */
    /* STATUS                           C40   01 Unconditional Exemption                                                      */
    /* RULING_YEAR                      C4    2023                                                                            */
    /* EIN                              C9    921271491                                                                       */
    /* NAME                             C70   FAITH AND COMMUNITY COMMUNI                                                     */
    /* ICO                              C35   % ROSS BRISBON-HARRIS                                                           */
    /* STREET                           C35   2911 PRESTWICK CIR                                                              */
    /* CITY                             C22   COLUMBIA                                                                        */
    /* STATE                            C2    SC                                                                              */
    /* ZIP                              C10   29223-2035                                                                      */
    /* GROUP                            C4    0000                                                                            */
    /* SUBSECTION                       C2    03                                                                              */
    /* AFFILIATION                      C1    3                                                                               */
    /* CLASSIFICATION                   C4    1000                                                                            */
    /* RULING                           C6    202301                                                                          */
    /* DEDUCTIBILITY                    C1    1                                                                               */
    /* FOUNDATION                       C2    15                                                                              */
    /* ACTIVITY                         C9    000000000                                                                       */
    /* ORGANIZATION                     C1    1                                                                               */
    /* TAX_PERIOD                       C6                                                                                    */
    /* ASSET_CD                         C1    0                                                                               */
    /* INCOME_CD                        C1    0                                                                               */
    /* FILING_REQ_CD                    C2    02                                                                              */
    /* PF_FILING_REQ_CD                 C1    0                                                                               */
    /* ACCT_PD                          C2    01                                                                              */
    /* ASSET_AMT                        C12                                                                                   */
    /* INCOME_AMT                       C12                                                                                   */
    /* REVENUE_AMT                      C11                                                                                   */
    /* NTEE_CD                          C4    E19                                                                             */
    /* SORT_NAME                        C35                                                                                   */
    /* AFFIL                            C89   3 Independent - Independent                                                     */
    /* TOTOBS                           C16   1,861,740                                                                       */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

/*____             _   _           _                                      __ _ _
|___ /  __   _____| |_| |_ ___  __| |  _ __   ___  _ __  _ __  _ __ ___  / _(_) |_ ___
  |_ \  \ \ / / _ \ __| __/ _ \/ _` | | `_ \ / _ \| `_ \| `_ \| `__/ _ \| |_| | __/ __|
 ___) |  \ V /  __/ |_| ||  __/ (_| | | | | | (_) | | | | |_) | | | (_) |  _| | |_\__ \
|____/    \_/ \___|\__|\__\___|\__,_| |_| |_|\___/|_| |_| .__/|_|  \___/|_| |_|\__|___/
                                                        |_|
     _                     _                 _
  __| | _____      ___ __ | | ___   __ _  __| |
 / _` |/ _ \ \ /\ / / `_ \| |/ _ \ / _` |/ _` |
| (_| | (_) \ V  V /| | | | | (_) | (_| | (_| |
 \__,_|\___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|

*/

dnr_vetted_nonprofits.xlsx

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  dnr_vetted_nonprofits.xlsx                                                                                            */
/*                                                                                                                        */
/*  Principal.Name.of.Organization: chr  "100 BLACK MEN OF DENVER, INC." "14ER GOLF" "16WAYS FOUNDATION, INC."            */
/*  Dbas                    : chr  "100 BMOD; DENVER 100; 100 BLACK MEN" NA NA NA ...                                     */
/*  Ntee.Level1             : chr  "CIVIL RIGHTS,SOCIAL ACTION,&\nADVOCACY" "PHILANTHROPY,VOLUNTARISM,&\n                 */
/*  Ntee.Level2             : chr  "COMMUNITY\nIMPROVEMENT,CAPACITY\nBUILDING" NA NA NA ...                               */
/*  Ntee.level3             : chr  "YOUTH DEVELOPMENT" NA NA NA ...                                                       */
/*  Principal.Address.1     : chr  "238 MCAFEE CIR" "9972 PRAIRIE\nFALCON LANE" "18766 BRIGHTON\nDRIVE" "                 */
/*  Principal.Address.2     : chr  NA NA NA NA ...                                                                        */
/*  Principal.City          : chr  "ERIE" "HIGHLANDS\nRANCH" "MACOMB" "LONE TREE" ...                                     */
/*  Principal.County        : chr  "WELD COUNTY" "DOUGLAS COUNTY" "MACOMB" "ARAPAHOE\nCOUNTY" ...                         */
/*  Principal.State         : chr  "CO" "CO" "MI" "CO" ...                                                                */
/*  Principal.Zip           : chr  "80516" "80130" "48042" "80124" ...                                                    */
/*  Registration.Number     : num  2.02e+10 2.02e+10 2.01e+10 2.01e+10 2.01e+10 ...                                       */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*  _              _ _    _  __                       _       _   _
| || |   __      _(_) | _(_)/ _| ___  _   _ _ __   __| | __ _| |_(_) ___  _ __  ___
| || |_  \ \ /\ / / | |/ / | |_ / _ \| | | | `_ \ / _` |/ _` | __| |/ _ \| `_ \/ __|
|__   _|  \ V  V /| |   <| |  _| (_) | |_| | | | | (_| | (_| | |_| | (_) | | | \__ \
   |_|     \_/\_/ |_|_|\_\_|_|  \___/ \__,_|_| |_|\__,_|\__,_|\__|_|\___/|_| |_|___/
     _                     _                 _
  __| | _____      ___ __ | | ___   __ _  __| |
 / _` |/ _ \ \ /\ / / `_ \| |/ _ \ / _` |/ _` |
| (_| | (_) \ V  V /| | | | | (_) | (_| | (_| |
 \__,_|\___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|
*/

 dnr_wikifoundations_sfx.xlsx

 Just a list of fundation company names
/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/
/**************************************************************************************************************************/
/*                                                                                                                        */
/*   810 dnr_wikifoundations_sfx.xlsx                                                                                     */
/*                                                                                                                        */
/*   $ COMPANY_NAME: chr  "THE ROCKEFELLER FOUNDATION" "FORD FOUNDATION" "MAYFIELD FUND"                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___              _   _           _    __                       _       _   _
| ___|  __   _____| |_| |_ ___  __| |  / _| ___  _   _ _ __   __| | __ _| |_(_) ___  _ __  ___
|___ \  \ \ / / _ \ __| __/ _ \/ _` | | |_ / _ \| | | | `_ \ / _` |/ _` | __| |/ _ \| `_ \/ __|
 ___) |  \ V /  __/ |_| ||  __/ (_| | |  _| (_) | |_| | | | | (_| | (_| | |_| | (_) | | | \__ \
|____/    \_/ \___|\__|\__\___|\__,_| |_|  \___/ \__,_|_| |_|\__,_|\__,_|\__|_|\___/|_| |_|___/
     _                     _                 _
  __| | _____      ___ __ | | ___   __ _  __| |
 / _` |/ _ \ \ /\ / / `_ \| |/ _ \ / _` |/ _` |
| (_| | (_) \ V  V /| | | | | (_) | (_| | (_| |
 \__,_|\___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|
*/

d:/dnr/dnr_vettedfoundations.xlsx

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  185 d:/dnr/dnr_vettedfoundations.xlsx                                                                                 */
/*                                                                                                                        */
/*  $ COMPANY_NAME   : chr  "THE ROCKEFELLER FOUNDATION" "FORD FOUNDATION" "MAYFIELD FUND"                                */
/*  $ ADDRESS_LINE1  : chr  "420 5TH AVE" "320 E 43RD ST" "2800 SAND HILL RD, STE 250"                                    */
/*  $ CITY           : chr  "NEW YORK" "NEW YORK" "MENLO PARK" "CHICAGO" ...                                              */
/*  $ POSTAL_CODE    : chr  "10018" "10017" "94025" "60603-5285" ...                                                      */
/*  $ COUNTRY        : chr  "UNITED STATES" "UNITED STATES" "UNITED STATES" "UNITED STATES" ...                           */
/*  $ PHONE_NUMBER   : chr  "212-869-8500" "212-573-5000" "650-854-5560" "312-726-8000" ...                               */
/*  $ TOLLFREE_NUMBER: chr  NA NA NA NA ...                                                                               */
/*  $ WEBSITE        : chr  "http://www.rockfound.org" "http://www.fordfound.org"                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/





