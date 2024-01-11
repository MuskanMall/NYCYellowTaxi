{"payload":{"allShortcutsEnabled":true,"fileTree":{"Code/Sql Scripts":{"items":[{"name":"cctables.sql","path":"Code/Sql Scripts/cctables.sql","contentType":"file"},{"name":"data_cleaning.sql","path":"Code/Sql Scripts/data_cleaning.sql","contentType":"file"},{"name":"index.sql","path":"Code/Sql Scripts/index.sql","contentType":"file"},{"name":"psql_queries.sql","path":"Code/Sql Scripts/psql_queries.sql","contentType":"file"},{"name":"run_sql.py","path":"Code/Sql Scripts/run_sql.py","contentType":"file"},{"name":"updtables.sql","path":"Code/Sql Scripts/updtables.sql","contentType":"file"}],"totalCount":6},"Code":{"items":[{"name":"Python Scripts","path":"Code/Python Scripts","contentType":"directory"},{"name":"Sql Scripts","path":"Code/Sql Scripts","contentType":"directory"},{"name":"ind_queries","path":"Code/ind_queries","contentType":"directory"}],"totalCount":3},"":{"items":[{"name":"Code","path":"Code","contentType":"directory"},{"name":"README.md","path":"README.md","contentType":"file"}],"totalCount":2}},"fileTreeProcessingTime":11.05608,"foldersToFetch":[],"reducedMotionEnabled":"system","repo":{"id":741247390,"defaultBranch":"main","name":"NYC-Taxi_Cab_Analysis","ownerLogin":"Anirudhrn98","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2024-01-09T18:03:49.000-08:00","ownerAvatar":"https://avatars.githubusercontent.com/u/72567603?v=4","public":true,"private":false,"isOrgOwned":false},"symbolsExpanded":true,"treeExpanded":true,"refInfo":{"name":"main","listCacheKey":"v0:1704853796.0","canEdit":true,"refType":"branch","currentOid":"2b29e49a960bc47dc4b29e323b2ee876a04d53c4"},"path":"Code/Sql Scripts/cctables.sql","currentUser":{"id":78860473,"login":"MuskanMall","userEmail":"muskanmall22@gmail.com"},"blob":{"rawLines":["-- Method of copying all the data into created tables where the correct data","-- types and keys/references and schema will be defined after the COPY commands","","","CREATE TABLE IF NOT EXISTS Main_Table (","  vendorID VARCHAR,","  tpep_pickup_datetime VARCHAR,","  tpep_dropOff_datetime VARCHAR,","  passenger_count VARCHAR,","  trip_distance VARCHAR,","  pickup_longitude VARCHAR,","  pickup_latitude VARCHAR,","  rateCodeID VARCHAR,","  store_and_fwd_flag VARCHAR,","  dropoff_longitude VARCHAR,","  dropoff_latitude VARCHAR,","  payment_type VARCHAR,","  fare_amount VARCHAR,","  extra VARCHAR,","  mta_tax VARCHAR,","  tip_amount VARCHAR,","  tolls_amount VARCHAR,","  improvement_surcharge VARCHAR,","  total_amount VARCHAR",");","","","","","CREATE TABLE IF NOT EXISTS Taxi (","   tripID INTEGER,","  txID SERIAL,","  vendorID VARCHAR,","  pickupDateTime VARCHAR,","  dropoffDateTime VARCHAR,","  passengerCount VARCHAR,","  storeAndFwd VARCHAR,","   PRIMARY KEY(txID, tripID)",");","","","ALTER TABLE taxi","   ADD CONSTRAINT u_txid UNIQUE (txID);","","","CREATE TABLE IF NOT EXISTS Trip (","  tripID INTEGER PRIMARY KEY,","  tripDistance VARCHAR,","  pickupLongitude VARCHAR,","  pickupLatitude VARCHAR,","  dropoffLongitude VARCHAR,","  dropoffLatitude VARCHAR",");","","","CREATE TABLE IF NOT EXISTS Payment (","  paymentID SERIAL,","  tripID INTEGER,","  paymentType VARCHAR,","  rateCodeID VARCHAR,","  fareAmount VARCHAR,","  extra VARCHAR,","  mtaTax VARCHAR,","  surcharge VARCHAR,","  tipAmount VARCHAR,","  tollsAmount VARCHAR,","  totalAmount VARCHAR,","  PRIMARY KEY(paymentID, tripID)",");","","","CREATE TABLE IF NOT EXISTS Vendor (","  vendorID SERIAL PRIMARY KEY,","  vendorName VARCHAR",");","","","CREATE TABLE IF NOT EXISTS Taxi_Trip(","  txID INTEGER,","  tripID INTEGER,","  PRIMARY KEY (txID, tripID)",");","","","","","CREATE TABLE IF NOT EXISTS Type (","  typeID SERIAL PRIMARY KEY,","  paymentName VARCHAR",");","","","CREATE TABLE IF NOT EXISTS Rate (","  rateCodeID SERIAL PRIMARY KEY,","  rateName VARCHAR",");","","","","COPY Main_Table FROM '/Users/darian/Desktop/School/RITCS/BigData/grp4/phase1_local/taxidata/yellow_tripdata_2016-01.csv' ","DELIMITER ',' ","CSV HEADER;","","COPY Main_Table FROM '/Users/darian/Desktop/School/RITCS/BigData/grp4/phase1_local/taxidata/yellow_tripdata_2016-02.csv' ","DELIMITER ',' ","CSV HEADER;","","COPY Main_Table FROM '/Users/darian/Desktop/School/RITCS/BigData/grp4/phase1_local/taxidata/yellow_tripdata_2016-03.csv' ","DELIMITER ',' ","CSV HEADER;","","ALTER TABLE Main_Table","ADD COLUMN id SERIAL; -- completed in 2 m 14 s 320 ms"],"stylingDirectives":[[{"start":0,"end":76,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[{"start":0,"end":79,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":11,"end":18,"cssClass":"pl-k"}],[{"start":23,"end":30,"cssClass":"pl-k"}],[{"start":24,"end":31,"cssClass":"pl-k"}],[{"start":18,"end":25,"cssClass":"pl-k"}],[{"start":16,"end":23,"cssClass":"pl-k"}],[{"start":19,"end":26,"cssClass":"pl-k"}],[{"start":18,"end":25,"cssClass":"pl-k"}],[{"start":13,"end":20,"cssClass":"pl-k"}],[{"start":21,"end":28,"cssClass":"pl-k"}],[{"start":20,"end":27,"cssClass":"pl-k"}],[{"start":19,"end":26,"cssClass":"pl-k"}],[{"start":15,"end":22,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[{"start":8,"end":15,"cssClass":"pl-k"}],[{"start":10,"end":17,"cssClass":"pl-k"}],[{"start":13,"end":20,"cssClass":"pl-k"}],[{"start":15,"end":22,"cssClass":"pl-k"}],[{"start":24,"end":31,"cssClass":"pl-k"}],[{"start":15,"end":22,"cssClass":"pl-k"}],[],[],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":10,"end":17,"cssClass":"pl-k"}],[{"start":7,"end":13,"cssClass":"pl-k"}],[{"start":11,"end":18,"cssClass":"pl-k"}],[{"start":17,"end":24,"cssClass":"pl-k"}],[{"start":18,"end":25,"cssClass":"pl-k"}],[{"start":17,"end":24,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[{"start":3,"end":14,"cssClass":"pl-k"}],[],[],[],[{"start":0,"end":5,"cssClass":"pl-k"},{"start":6,"end":11,"cssClass":"pl-k"}],[{"start":7,"end":17,"cssClass":"pl-k"}],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":9,"end":16,"cssClass":"pl-k"},{"start":17,"end":28,"cssClass":"pl-k"}],[{"start":15,"end":22,"cssClass":"pl-k"}],[{"start":18,"end":25,"cssClass":"pl-k"}],[{"start":17,"end":24,"cssClass":"pl-k"}],[{"start":19,"end":26,"cssClass":"pl-k"}],[{"start":18,"end":25,"cssClass":"pl-k"}],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":12,"end":18,"cssClass":"pl-k"}],[{"start":9,"end":16,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[{"start":13,"end":20,"cssClass":"pl-k"}],[{"start":13,"end":20,"cssClass":"pl-k"}],[{"start":8,"end":15,"cssClass":"pl-k"}],[{"start":9,"end":16,"cssClass":"pl-k"}],[{"start":12,"end":19,"cssClass":"pl-k"}],[{"start":12,"end":19,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[{"start":2,"end":13,"cssClass":"pl-k"}],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":11,"end":17,"cssClass":"pl-k"},{"start":18,"end":29,"cssClass":"pl-k"}],[{"start":13,"end":20,"cssClass":"pl-k"}],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":7,"end":14,"cssClass":"pl-k"}],[{"start":9,"end":16,"cssClass":"pl-k"}],[{"start":2,"end":13,"cssClass":"pl-k"}],[],[],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":9,"end":15,"cssClass":"pl-k"},{"start":16,"end":27,"cssClass":"pl-k"}],[{"start":14,"end":21,"cssClass":"pl-k"}],[],[],[],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":12,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-en"}],[{"start":13,"end":19,"cssClass":"pl-k"},{"start":20,"end":31,"cssClass":"pl-k"}],[{"start":11,"end":18,"cssClass":"pl-k"}],[],[],[],[],[{"start":16,"end":20,"cssClass":"pl-k"},{"start":21,"end":120,"cssClass":"pl-s"},{"start":21,"end":22,"cssClass":"pl-pds"},{"start":119,"end":120,"cssClass":"pl-pds"}],[{"start":10,"end":13,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":12,"end":13,"cssClass":"pl-pds"}],[],[],[{"start":16,"end":20,"cssClass":"pl-k"},{"start":21,"end":120,"cssClass":"pl-s"},{"start":21,"end":22,"cssClass":"pl-pds"},{"start":119,"end":120,"cssClass":"pl-pds"}],[{"start":10,"end":13,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":12,"end":13,"cssClass":"pl-pds"}],[],[],[{"start":16,"end":20,"cssClass":"pl-k"},{"start":21,"end":120,"cssClass":"pl-s"},{"start":21,"end":22,"cssClass":"pl-pds"},{"start":119,"end":120,"cssClass":"pl-pds"}],[{"start":10,"end":13,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":12,"end":13,"cssClass":"pl-pds"}],[],[],[{"start":0,"end":5,"cssClass":"pl-k"},{"start":6,"end":11,"cssClass":"pl-k"}],[{"start":14,"end":20,"cssClass":"pl-k"},{"start":22,"end":53,"cssClass":"pl-c"},{"start":22,"end":24,"cssClass":"pl-c"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":false,"repoAlertsPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/security/dependabot","repoSecurityAndAnalysisPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/settings/security_analysis","repoOwnerIsOrg":false,"currentUserCanAdminRepo":false},"displayName":"cctables.sql","displayUrl":"https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis/blob/main/Code/Sql%20Scripts/cctables.sql?raw=true","headerInfo":{"blobSize":"2.33 KB","deleteInfo":{"deleteTooltip":"Fork this repository and delete the file"},"editInfo":{"editTooltip":"Fork this repository and edit the file"},"ghDesktopPath":"x-github-client://openRepo/https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis?branch=main&filepath=Code%2FSql%20Scripts%2Fcctables.sql","gitLfsPath":null,"onBranch":true,"shortPath":"93d976d","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2FAnirudhrn98%2FNYC-Taxi_Cab_Analysis%2Fblob%2Fmain%2FCode%2FSql%2520Scripts%2Fcctables.sql","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"113","truncatedSloc":"85"},"mode":"file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"SQL","languageID":333,"large":false,"loggedIn":true,"newDiscussionPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/discussions/new","newIssuePath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/issues/new","planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/blob/main/Code/Sql%20Scripts/cctables.sql","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","dismissStackNoticePath":"/settings/dismiss-notice/publish_stack_from_file","releasePath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/releases/new?marketplace=true","showPublishActionBanner":false,"showPublishStackBanner":false},"rawBlobUrl":"https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis/raw/main/Code/Sql%20Scripts/cctables.sql","renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"Anirudhrn98","repoName":"NYC-Taxi_Cab_Analysis","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","showDependabotConfigurationBanner":false,"actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timed_out":false,"not_analyzed":true,"symbols":[]}},"copilotInfo":{"documentationUrl":"https://docs.github.com/copilot/overview-of-github-copilot/about-github-copilot-for-individuals","notices":{"codeViewPopover":{"dismissed":false,"dismissPath":"/settings/dismiss-notice/code_view_copilot_popover"}},"userAccess":{"accessAllowed":false,"hasSubscriptionEnded":false,"orgHasCFBAccess":false,"userHasCFIAccess":false,"userHasOrgs":false,"userIsOrgAdmin":false,"userIsOrgMember":false,"business":null,"featureRequestInfo":null}},"copilotAccessAllowed":false,"csrf_tokens":{"/Anirudhrn98/NYC-Taxi_Cab_Analysis/branches":{"post":"iH6eCcjtJXB9-aNSk39rl7TEHjQZ63VCJuQkWIcFn6vz3rzKec-5BlRLXp7qqlGb5Xq-75MRut6SFp4Or9jY4A"},"/repos/preferences":{"post":"VDWJXPGh4HR2RkW5qwdVUCNs9IkU2jValadjCnvC9SsYknT3ZVnone9VcPJcPFo52SaAstRzR62wyku6Th1jdQ"}}},"title":"NYC-Taxi_Cab_Analysis/Code/Sql Scripts/cctables.sql at main · Anirudhrn98/NYC-Taxi_Cab_Analysis"}