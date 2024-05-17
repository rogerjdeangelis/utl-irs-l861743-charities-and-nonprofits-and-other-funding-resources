# utl-irs-l861743-charities-and-nonprofits-and-other-funding-resources
IRS l861743 charities and nonprofits and other funding resources 
     
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

    /*               _     _
     _ __  _ __ ___ | |__ | | ___ _ __ ___
    | `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
    | |_) | | | (_) | |_) | |  __/ | | | | |
    | .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
    |_|
    */

    /***************************************************************************************************************************/
    /*                               |                                     |                                                   */
    /*          INPUT                |             PROCESS                 |                   OUTPUT                          */
    /*                               |                                     |                                                   */
    /*                               |                                     |                                                   */
    /* You need to createa folder    | libname library "d:/dnr";           | Middle Observation(930,871 ) table=dnr.dnr_irsall */
    /* I use d:/dnr                  |                                     |  - Total Obs 1,861,743                            */
    /*                               | proc format                         |                                                   */
    /* you need to download          |     cntlin=dnr.dnr_irsmjrmnr_cntlin | ORGTYPE          $64   03 Charitable, Educational */
    /* and unzip dnr_eos.exe         |    library=dnr.formats;             | MAJOR            $53   L Housing & Shelter        */
    /*                               | run;quit;                           | MINOR            $124  L80 Housing Support        */
    /* dnr_eos.exe                   |                                     | EIN              $9    921270514                  */
    /*   self extracting             | * insert inline format below;       | NAME             $70   HEALING HEROES PURPOSES OF */
    /*   comma delimited IRS         |                                     | ICO              $35                              */
    /*   charities and non-profits   | data tst;                           | STREET           $35   5103 FAIRVISTA DR          */
    /*                               |  x=put('W30',$NTEE2MJRMNR.);        | CITY             $22   CHARLOTTE                  */
    /* dnr_irsmjrmnr_cntlin.sas7bdat |  put x=;                            | STATE            $5    NC                         */
    /*   format cntlin dataset       | run;quit;                           | ZIP              $10   28269-0637                 */
    /*                               |                                     | GROUP            $5    0000                       */
    /* Inline format $org2type       | data dnr.dnr_irsall;                | SUBSECTION       $10   03                         */
    /* see below                     |                                     | AFFILIATION      $11   3                          */
    /*                               |  retain orgtype major minor;        | CLASSIFICATION   $14   1000                       */
    /*                               |                                     | RULING           $6    202308                     */
    /*                               |  informat                           | DEDUCTIBILITY    $13   1                          */
    /*                               |    EIN NAME ICO STREET CITY STATE   | FOUNDATION       $10   15                         */
    /*                               |    ZIP GROUP SUBSECTION AFFILIATION | ACTIVITY         $9    000000000                  */
    /*                               |    CLASSIFICATION RULING            | ORGANIZATION     $12   1                          */
    /*                               |    DEDUCTIBILITY FOUNDATION         | STATUS           $6    01                         */
    /*                               |    ACTIVITY ORGANIZATION            | TAX_PERIOD       $10   202312                     */
    /*                               |    STATUS TAX_PERIOD ASSET_CD       | ASSET_CD         $8    0                          */
    /*                               |    INCOME_CD FILING_REQ_CD          | INCOME_CD        $9    0                          */
    /*                               |    PF_FILING_REQ_CD ACCT_PD         | FILING_REQ_CD    $13   02                         */
    /*                               |    ASSET_AMT INCOME_AMT REVENUE_AMT | PF_FILING_REQ_CD $16   0                          */
    /*                               |    NTEE_CD SORT_NAME $200.          | ACCT_PD          $7    12                         */
    /*                               |    ;                                | ASSET_AMT        $12   0                          */
    /*                               |                                     | INCOME_AMT       $12   0                          */
    /*                               |  infile "d:/dnr/dnr_eos.csv"        | REVENUE_AMT      $11   0                          */
    /*                               |      dsd delimiter=',' missover;    | NTEE_CD          $7    L80                        */
    /*                               |                                     | SORT_NAME        $35                              */
    /*                               |  input                              |                                                   */
    /*                               |    EIN NAME ICO STREET CITY STATE   |                                                   */
    /*                               |    ZIP GROUP SUBSECTION AFFILIATION |                                                   */
    /*                               |    CLASSIFICATION RULING            |                                                   */
    /*                               |    DEDUCTIBILITY FOUNDATION         |                                                   */
    /*                               |    ACTIVITY ORGANIZATION            |                                                   */
    /*                               |    STATUS TAX_PERIOD ASSET_CD       |                                                   */
    /*                               |    INCOME_CD FILING_REQ_CD          |                                                   */
    /*                               |    PF_FILING_REQ_CD ACCT_PD         |                                                   */
    /*                               |    ASSET_AMT INCOME_AMT REVENUE_AMT |                                                   */
    /*                               |    NTEE_CD SORT_NAME                |                                                   */
    /*                               |    ;                                |                                                   */
    /*                               |                                     |                                                   */
    /*                               |   major=                            |                                                   */
    /*                               |   put(substr(strip(ntee_cd),1,1)    |                                                   */
    /*                               |      ,?? $NTEE2MJRMNR.);            |                                                   */
    /*                               |                                     |                                                   */
    /*                               |   minor=put(strip(ntee_cd)          |                                                   */
    /*                               |      ,?? $NTEE2MJRMNR.);            |                                                   */
    /*                               |                                     |                                                   */
    /*                               |   orgtype=put(strip(subsection)     |                                                   */
    /*                               |    ,$org2type.);                    |                                                   */
    /*                               |                                     |                                                   */
    /*                               |   if major='OTHER' then major="";   |                                                   */
    /*                               |   if minor='OTHER' then minor="";   |                                                   */
    /*                               |                                     |                                                   */
    /*                               | run;quit;                           |                                                   */
    /*                               |                                     |                                                   */
    /***************************************************************************************************************************/

    /*   _                                               __ _ _
    / | (_)_ __ ___   _ __   ___  _ __  _ __  _ __ ___  / _(_) |_ ___
    | | | | `__/ __| | `_ \ / _ \| `_ \| `_ \| `__/ _ \| |_| | __/ __|
    | | | | |  \__ \ | | | | (_) | | | | |_) | | | (_) |  _| | |_\__ \
    |_| |_|_|  |___/ |_| |_|\___/|_| |_| .__/|_|  \___/|_| |_|\__|___/
                                       |_|
    */

     you need to download
     and unzip dnr_eos.exe


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

     retain orgtype major minor;

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

      major=
      put(substr(strip(ntee_cd),1,1)
         ,?? $NTEE2MJRMNR.);

      minor=put(strip(ntee_cd)
         ,?? $NTEE2MJRMNR.);

      orgtype=put(strip(subsection)
       ,$org2type.);

      if major='OTHER' then major="";
      if minor='OTHER' then minor="";

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
    /*   TABLE=DNR.DNR_IRSALL                                                                                                 */
    /*                                                                                                                        */
    /*   ORGTYPE                                                        MAJOR                                                 */
    /*                                                                                                                        */
    /*   Other                                                          N Recreation & Sports                                 */
    /*   03 Charitable, Educational, Religious, Scientific Organization                                                       */
    /*   03 Charitable, Educational, Religious, Scientific Organization                                                       */
    /*   03 Charitable, Educational, Religious, Scientific Organization X Religion-Related                                    */
    /*   03 Charitable, Educational, Religious, Scientific Organization X Religion-Related                                    */
    /*   03 Charitable, Educational, Religious, Scientific Organization X Religion-Related                                    */
    /*   03 Charitable, Educational, Religious, Scientific Organization X Religion-Related                                    */
    /*   03 Charitable, Educational, Religious, Scientific Organization X Religion-Related                                    */
    /*                                                                                                                        */
    /*   MINOR                             EIN        NAME                                                                    */
    /*                                                                                                                        */
    /*                                     EIN        NAME                                                                    */
    /*                                     000019818  PALMER SECOND BAPTIST CHURCH                                            */
    /*                                     000029215  ST GEORGE CATHEDRAL                                                     */
    /*   X21 Protestant                    000587764  IGLESIA BETHESDA INC                                                    */
    /*   X21 Protestant                    000635913  MINISTERIO APOSTOLICO JESUCRISTO ES EL SENOR INC                        */
    /*   X20 Christianity                  000765634  MERCY CHAPEL INTERNATIONAL                                              */
    /*   X20 Christianity                  000841363  AGAPE HOUSE OF PRAYER                                                   */
    /*   X20 Christianity                  000852649  BETHANY PRESBYTERIAN CHURCH                                             */
    /*                                                                                                                        */
    /*   ICO                           STREET                                CITY           STATE   ZIP                       */
    /*                                                                                                                        */
    /*   ICO                           STREET                                CITY           STATE   ZIP                       */
    /*                                 1050 THORNDIKE ST                     PALMER         MA      01069-1507                */
    /*                                 523 E BROADWAY                        SOUTH BOSTON   MA      02127-4415                */
    /*                                 13 CUMMINGHAM ST                      LOWELL         MA      01852-0000                */
    /*                                 454 ESSEX ST                          LAWRENCE       MA      01840-1242                */
    /*                                 75 MORTON VILLAGE DR APT 408          MATTAPAN       MA      02126-2433                */
    /*                                 39 GOODALE RD STE 2                   MATTAPAN       MA      02126-1527                */
    /*                                 32 HARVARD ST                         BROOKLINE      MA      02445-7994                */
    /*                                                                                                                        */
    /*   GROUP SUBSECTION AFFILIATION CLASSIFICATION RULING DEDUCTIBILITY FOUNDATION ACTIVITY  ORGANIZATION                   */
    /*                                                                                                                        */
    /*   GROUP SUBSECTION AFFILIATION CLASSIFICATION RULING DEDUCTIBILITY FOUNDATION ACTIVITY  ORGANIZATION                   */
    /*   3125  03         9           7000           195504 1             10         001000000 5                              */
    /*   2365  03         9           7000           197210 1             10         001000000 1                              */
    /*   0000  03         3           7000           200401 1             10         000000000 1                              */
    /*   0000  03         3           7000           200401 1             10         000000000 1                              */
    /*   0000  03         3           7000           200404 1             10         000000000 1                              */
    /*   0000  03         3           1700           200412 1             10         000000000 1                              */
    /*   0000  03         3           7000           200504 1             10         000000000 1                              */
    /*                                                                                                                        */
    /*   STATUS  TAX_PERIOD  ASSET_CD  INCOME_CD  FILING_REQ_CD  PF_FILING_REQ_CD  ACCT_PD  ASSET_AMT  INCOME_AMT             */
    /*                                                                                                                        */
    /*   STATUS  TAX_PERIOD  ASSET_CD  INCOME_CD  FILING_REQ_CD  PF_FILING_REQ_CD  ACCT_PD  ASSET_AMT  INCOME_AMT             */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*   01                  0         0          06             0                 12                                         */
    /*                                                                                                                        */
    /*   REVENUE_AMT    NTEE_CD    SORT_NAME                                                                                  */
    /*                                                                                                                        */
    /*   REVENUE_AMT    NTEE_CD    SORT_NAME                                                                                  */
    /*                             3514                                                                                       */
    /*                                                                                                                        */
    /*                  X21                                                                                                   */
    /*                  X21                                                                                                   */
    /*                  X20                                                                                                   */
    /*                  X20                                                                                                   */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*___    _     _ _ _    ___                    _ _           _
    |___ \  | |__ (_) | |  ( _ )    _ __ ___   ___| (_)_ __   __| | __ _
      __) | | `_ \| | | |  / _ \/\ | `_ ` _ \ / _ \ | | `_ \ / _` |/ _` |
     / __/  | |_) | | | | | (_>  < | | | | | |  __/ | | | | | (_| | (_| |
    |_____| |_.__/|_|_|_|  \___/\/ |_| |_| |_|\___|_|_|_| |_|\__,_|\__,_|
         _                     _                 _
      __| | _____      ___ __ | | ___   __ _  __| |
     / _` |/ _ \ \ /\ / / `_ \| |/ _ \ / _` |/ _` |
    | (_| | (_) \ V  V /| | | | | (_) | (_| | (_| |
     \__,_|\___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|

    */

    dnr_bill_melinda.xlsx

    /*           _               _
      ___  _   _| |_ _ __  _   _| |_
     / _ \| | | | __| `_ \| | | | __|
    | (_) | |_| | |_| |_) | |_| | |_
     \___/ \__,_|\__| .__/ \__,_|\__|
                    |_|
    */

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* DNR_BILL_MELINDA.XLSX total obs=35,576                                                                                 */
    /*                                                                                                                        */
    /*  GRANT_ID     GRANTEE                                                                                                  */
    /*                                                                                                                        */
    /* INV-002690    World Health Organization                                                                                */
    /* INV-003934    Smithsonian Institution                                                                                  */
    /* INV-004622    Praedicare Inc                                                                                           */
    /* INV-015740    Africa Resource Center for Excellence in Supply Chain Management LTD/GTE                                 */
    /* INV-016370    International Centre for Diarrhoeal Disease Research, Bangladesh                                         */
    /* INV-019358    Central Square Foundation                                                                                */
    /* INV-022216    University of Pretoria                                                                                   */
    /* INV-023227    Language and Learning Foundation                                                                         */
    /* INV-023287    Family Health International                                                                              */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /* PURPOSE                                                                                                                */
    /*                                                                                                                        */
    /* to reduce cholera's disease burden in both epidemic and endemic settings through use of evidence-based p               */
    /* to endow the museum?s permanent collection of objects documenting African American life, history and cul               */
    /* to evaluate novel TB drug combinations in the in vitro hollow fiber system for TB to inform our understa               */
    /* to strengthen supply chain systems performance across targeted Nigerian states                                         */
    /* to develop shelf-stable, locally-sourced, microbiome-directed, ready-to-use therapeutic foods (MD-RUTFs)               */
    /* to strengthen efforts to improve the quality of education for students from low-income backgrounds in In               */
    /* to support novel imaging and metabolic biomarker discovery in birth asphyxia, and the use of this inform               */
    /* to support the development of public goods for the teaching and learning of  foundational literacy and n               */
    /* to provide strategic technical assistance to national and state governments and various stakeholders as                */
    /*                                                                                                                        */
    /*                                         DATE_      DURATION__     AMOUNT_                                              */
    /* DIVISION                              COMMITTED      MONTHS_     COMMITTED                                             */
    /*                                                                                                                        */
    /* Global Health                           22312          16          1078614                                             */
    /* Executive                               22312          59          1500000                                             */
    /* Global Health                           22312          15           631733                                             */
    /* Gender Equality|Global Development      22312          60          6090984                                             */
    /* Gender Equality                         22312          49          3495385                                             */
    /* Global Growth & Opportunity             22312          50         14740691                                             */
    /* Gender Equality                         22312          20           192903                                             */
    /* Global Growth & Opportunity             22312          74          4992896                                             */
    /* Gender Equality                         22312          29          3948227                                             */
    /*                                                                                                                        */
    /*                                                                                        GRANTEE_                        */
    /* GRANTEE_WEBSITE                            GRANTEE_CITY     GRANTEE_STATE              COUNTRY                         */
    /*                                                                                                                        */
    /* http://www.who.int                         Geneva                                      Switzerland                     */
    /* http://www.si.edu/                         Washington       District of Columbia       United States                   */
    /* http://www.praedicarelabs.com              Dallas           Texas                      United States                   */
    /*                                            Abuja            Federal Capital Territory  Nigeria                         */
    /* http://www.icddrb.org                      Dhaka                                       Bangladesh                      */
    /* http://centralsquarefoundation.org/        New Delhi        Delhi                      India                           */
    /* http://www.up.ac.za                        Pretoria         Gauteng                    South Africa                    */
    /* https://languageandlearningfoundation.org  New Delhi        Delhi                      India                           */
    /* http://www.fhi360.org                      Durham           North Carolina             United States                   */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /* REGION_SERVED               TOPIC                                                                                      */
    /*                                                                                                                        */
    /* GLOBAL                      "Enterics                                                                                  */
    /* AMERICA                     Community Engagement Grantmaking                                                           */
    /* AMERICA                     Tuberculosis                                                                               */
    /* AFRICA                      Family Planning|Global Health and Development Public Awareness and Analysis                */
    /* ASIA                        Maternal, Newborn, Child Nutrition and Health                                              */
    /* ASIA                        Global Education                                                                           */
    /* GLOBAL                      Maternal, Newborn, Child Nutrition and Health                                              */
    /* ASIA                        Global Education                                                                           */
    /* ASIA                        "Matern                                                                                    */
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





