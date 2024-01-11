{"payload":{"allShortcutsEnabled":true,"fileTree":{"Code/Sql Scripts":{"items":[{"name":"cctables.sql","path":"Code/Sql Scripts/cctables.sql","contentType":"file"},{"name":"data_cleaning.sql","path":"Code/Sql Scripts/data_cleaning.sql","contentType":"file"},{"name":"index.sql","path":"Code/Sql Scripts/index.sql","contentType":"file"},{"name":"psql_queries.sql","path":"Code/Sql Scripts/psql_queries.sql","contentType":"file"},{"name":"run_sql.py","path":"Code/Sql Scripts/run_sql.py","contentType":"file"},{"name":"updtables.sql","path":"Code/Sql Scripts/updtables.sql","contentType":"file"}],"totalCount":6},"Code":{"items":[{"name":"Python Scripts","path":"Code/Python Scripts","contentType":"directory"},{"name":"Sql Scripts","path":"Code/Sql Scripts","contentType":"directory"},{"name":"ind_queries","path":"Code/ind_queries","contentType":"directory"}],"totalCount":3},"":{"items":[{"name":"Code","path":"Code","contentType":"directory"},{"name":"README.md","path":"README.md","contentType":"file"}],"totalCount":2}},"fileTreeProcessingTime":7.629828,"foldersToFetch":[],"reducedMotionEnabled":"system","repo":{"id":741247390,"defaultBranch":"main","name":"NYC-Taxi_Cab_Analysis","ownerLogin":"Anirudhrn98","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2024-01-09T18:03:49.000-08:00","ownerAvatar":"https://avatars.githubusercontent.com/u/72567603?v=4","public":true,"private":false,"isOrgOwned":false},"symbolsExpanded":true,"treeExpanded":true,"refInfo":{"name":"main","listCacheKey":"v0:1704853796.0","canEdit":true,"refType":"branch","currentOid":"2b29e49a960bc47dc4b29e323b2ee876a04d53c4"},"path":"Code/Sql Scripts/updtables.sql","currentUser":{"id":78860473,"login":"MuskanMall","userEmail":"muskanmall22@gmail.com"},"blob":{"rawLines":["INSERT INTO type(paymentname)","VALUES('Credit Card'),","    ('Cash'),","    ('No Charge'),","    ('Dispute'),","    ('Unknown'),","    ('Voided Trip'); -- 6 rows affected in 2 ms","","","INSERT INTO Rate (rateName)","VALUES ('Standard Rate'),","    ('JFK'),","    ('Newark'),","    ('Nassau or Westchester'),","    ('Negotiated Fare'),","    ('Group Ride'); -- 6 rows affected in 2 ms","","","INSERT INTO Rate (rateCodeID, rateName)","VALUES (99, 'UNKNOWN_RATE_NAME'); --1 row affected in 3 ms","","","INSERT INTO Vendor (vendorName)","VALUES ('Creative Mobile Technologies'),","    ('VeriFone Inc.'); -- 2 rows affected in 3 ms","","","INSERT INTO Taxi (tripid, vendorID, pickupDateTime, dropOffDateTime, passengerCount, storeAndFwd)","SELECT","  id,"," vendorID,"," tpep_pickup_datetime,"," tpep_dropoff_datetime,"," passenger_count,"," store_and_fwd_flag","FROM main_table; -- 34,499,859 rows affected in 1 m 0 s 310 ms","","","-- Add relevant data to trip table","INSERT INTO Trip (tripid, tripDistance, pickupLongitude, pickupLatitude, dropoffLongitude, dropoffLatitude)","SELECT","  id,"," trip_distance,"," pickup_longitude,"," pickup_latitude,"," dropoff_longitude,"," dropoff_latitude","FROM main_table; -- 34,499,859 rows affected in 30 s 867 ms","","","INSERT INTO taxi_trip(txid, tripid)","  SELECT taxi.txid, trip.tripid","FROM taxi JOIN trip ON taxi.txid = trip.tripid;-- 34,499,859 rows affected in 1 m 19 s 52 ms","","","INSERT INTO payment(tripID, paymentType, rateCodeID, fareAmount, extra, mtaTax, tipAmount, tollsAmount, surcharge, totalAmount)","SELECT id,","     payment_type,","     ratecodeid,","     fare_amount,","     extra,","     mta_tax,","     tip_amount,","     tolls_amount,","     improvement_surcharge,","     total_amount","FROM main_table; -- 34,499,859 rows affected in 2 m 1 s 486 ms","","","--  ALTERING TABLE TAXI TO CORRECT DATA TYPES AND ADDING FOREIGN KEYS","ALTER TABLE Taxi","ALTER COLUMN vendorID TYPE INTEGER USING (vendorID::INTEGER),","ALTER COLUMN pickupDateTime TYPE TIMESTAMP USING (pickupDateTime::TIMESTAMP),","ALTER COLUMN dropoffDateTime TYPE TIMESTAMP USING (dropoffDateTime::TIMESTAMP),","ALTER COLUMN passengerCount TYPE INTEGER USING (passengerCount::INTEGER),","ALTER COLUMN storeAndFwd TYPE BOOLEAN USING (storeAndFwd::BOOLEAN),","ADD CONSTRAINT fk_vendor","FOREIGN KEY (vendorID)"," REFERENCES Vendor (vendorID)"," ON DELETE CASCADE; -- completed in 1 m 0 s 842 ms","","","--  ADDING FOREIGN KEYS TO TAXI_TRIP","ALTER TABLE Taxi_Trip","ADD CONSTRAINT fk_taxi","FOREIGN KEY (txID)"," REFERENCES Taxi (txID)"," ON DELETE CASCADE,","ADD CONSTRAINT fk_trip","FOREIGN KEY (tripID)"," REFERENCES Trip (tripID)"," ON DELETE CASCADE;-- completed in 46 s 528 ms","","","-- ALLOWS FOREIGN KEY REFERENCE","ALTER TABLE Payment ADD UNIQUE(tripID); -- completed in 16 s 858 ms","","","--  ALTERING TABLE TRIP TO CORRECT DATA TYPES AND ADDING FOREIGN KEYS","ALTER TABLE Trip","ALTER COLUMN tripDistance TYPE NUMERIC USING (tripDistance::NUMERIC),","ALTER COLUMN pickupLongitude TYPE NUMERIC USING (pickupLongitude::NUMERIC),","ALTER COLUMN pickupLatitude TYPE NUMERIC USING (pickupLatitude::NUMERIC),","ALTER COLUMN dropoffLongitude TYPE NUMERIC USING (dropoffLongitude::NUMERIC),","ALTER COLUMN dropoffLatitude TYPE NUMERIC USING (dropoffLatitude::NUMERIC),","ADD CONSTRAINT fk_trip2pay","FOREIGN KEY (tripID)"," REFERENCES Payment (tripID)"," ON DELETE CASCADE; -- completed in 1 m 59 s 988 ms","","","-- --  ALTERING TABLE PAYMENT TO CORRECT DATA TYPES AND ADDING FOREIGN KEYS","ALTER TABLE Payment","ALTER COLUMN paymentType TYPE INTEGER USING (paymentType::INTEGER),","ALTER COLUMN rateCodeID TYPE INTEGER USING (rateCodeID::INTEGER),","ALTER COLUMN fareAmount TYPE NUMERIC USING (fareAmount::NUMERIC),","ALTER COLUMN extra TYPE NUMERIC USING (extra::NUMERIC),","ALTER COLUMN mtaTax TYPE NUMERIC USING (mtaTax::NUMERIC),","ALTER COLUMN surcharge TYPE NUMERIC USING (surcharge::NUMERIC),","ALTER COLUMN tipAmount TYPE NUMERIC USING (tipAmount::NUMERIC),","ALTER COLUMN tollsAmount TYPE NUMERIC USING (tollsAmount::NUMERIC),","ALTER COLUMN totalAmount TYPE NUMERIC USING (totalAmount::NUMERIC),","ADD CONSTRAINT ck_type","CHECK (paymentType >= 1 AND paymentType <= 6),","ADD CONSTRAINT ck_rid","CHECK (rateCodeID >= 1 AND rateCodeID <= 6 OR rateCodeID = 99),","ADD CONSTRAINT fk_payType","FOREIGN KEY (paymentType)"," REFERENCES Type (typeID)"," ON DELETE CASCADE,","ADD CONSTRAINT fk_rateCode","FOREIGN KEY (rateCodeID)"," REFERENCES Rate (rateCodeID)"," ON DELETE CASCADE; -- completed in 1 m 53 s 23 ms","","","DROP TABLE Main_Table; -- completed in 318 ms"],"stylingDirectives":[[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":7,"end":20,"cssClass":"pl-s"},{"start":7,"end":8,"cssClass":"pl-pds"},{"start":19,"end":20,"cssClass":"pl-pds"}],[{"start":5,"end":11,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":10,"end":11,"cssClass":"pl-pds"}],[{"start":5,"end":16,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":15,"end":16,"cssClass":"pl-pds"}],[{"start":5,"end":14,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":13,"end":14,"cssClass":"pl-pds"}],[{"start":5,"end":14,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":13,"end":14,"cssClass":"pl-pds"}],[{"start":5,"end":18,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":17,"end":18,"cssClass":"pl-pds"},{"start":21,"end":47,"cssClass":"pl-c"},{"start":21,"end":23,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":8,"end":23,"cssClass":"pl-s"},{"start":8,"end":9,"cssClass":"pl-pds"},{"start":22,"end":23,"cssClass":"pl-pds"}],[{"start":5,"end":10,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":9,"end":10,"cssClass":"pl-pds"}],[{"start":5,"end":13,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":12,"end":13,"cssClass":"pl-pds"}],[{"start":5,"end":28,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":27,"end":28,"cssClass":"pl-pds"}],[{"start":5,"end":22,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":21,"end":22,"cssClass":"pl-pds"}],[{"start":5,"end":17,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":16,"end":17,"cssClass":"pl-pds"},{"start":20,"end":46,"cssClass":"pl-c"},{"start":20,"end":22,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":8,"end":10,"cssClass":"pl-c1"},{"start":12,"end":31,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":30,"end":31,"cssClass":"pl-pds"},{"start":34,"end":58,"cssClass":"pl-c"},{"start":34,"end":36,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"},{"start":8,"end":38,"cssClass":"pl-s"},{"start":8,"end":9,"cssClass":"pl-pds"},{"start":37,"end":38,"cssClass":"pl-pds"}],[{"start":5,"end":20,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":19,"end":20,"cssClass":"pl-pds"},{"start":23,"end":49,"cssClass":"pl-c"},{"start":23,"end":25,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"}],[],[],[],[],[],[],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":17,"end":62,"cssClass":"pl-c"},{"start":17,"end":19,"cssClass":"pl-c"}],[],[],[{"start":0,"end":34,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":0,"end":6,"cssClass":"pl-k"}],[],[],[],[],[],[],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":17,"end":59,"cssClass":"pl-c"},{"start":17,"end":19,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":2,"end":8,"cssClass":"pl-k"},{"start":9,"end":13,"cssClass":"pl-c1"},{"start":14,"end":18,"cssClass":"pl-c1"},{"start":20,"end":24,"cssClass":"pl-c1"},{"start":25,"end":31,"cssClass":"pl-c1"}],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":10,"end":14,"cssClass":"pl-k"},{"start":20,"end":22,"cssClass":"pl-k"},{"start":23,"end":27,"cssClass":"pl-c1"},{"start":28,"end":32,"cssClass":"pl-c1"},{"start":33,"end":34,"cssClass":"pl-k"},{"start":35,"end":39,"cssClass":"pl-c1"},{"start":40,"end":46,"cssClass":"pl-c1"},{"start":47,"end":92,"cssClass":"pl-c"},{"start":47,"end":49,"cssClass":"pl-c"}],[],[],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":6,"cssClass":"pl-k"}],[],[],[],[],[],[],[],[],[],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":17,"end":62,"cssClass":"pl-c"},{"start":17,"end":19,"cssClass":"pl-c"}],[],[],[{"start":0,"end":69,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":27,"end":34,"cssClass":"pl-k"},{"start":52,"end":59,"cssClass":"pl-k"}],[{"start":33,"end":42,"cssClass":"pl-k"},{"start":66,"end":75,"cssClass":"pl-k"}],[{"start":34,"end":43,"cssClass":"pl-k"},{"start":68,"end":77,"cssClass":"pl-k"}],[{"start":33,"end":40,"cssClass":"pl-k"},{"start":64,"end":71,"cssClass":"pl-k"}],[{"start":30,"end":37,"cssClass":"pl-k"},{"start":58,"end":65,"cssClass":"pl-k"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"},{"start":20,"end":50,"cssClass":"pl-c"},{"start":20,"end":22,"cssClass":"pl-c"}],[],[],[{"start":0,"end":36,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"},{"start":19,"end":46,"cssClass":"pl-c"},{"start":19,"end":21,"cssClass":"pl-c"}],[],[],[{"start":0,"end":31,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[{"start":40,"end":67,"cssClass":"pl-c"},{"start":40,"end":42,"cssClass":"pl-c"}],[],[],[{"start":0,"end":69,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":31,"end":38,"cssClass":"pl-k"},{"start":60,"end":67,"cssClass":"pl-k"}],[{"start":34,"end":41,"cssClass":"pl-k"},{"start":66,"end":73,"cssClass":"pl-k"}],[{"start":33,"end":40,"cssClass":"pl-k"},{"start":64,"end":71,"cssClass":"pl-k"}],[{"start":35,"end":42,"cssClass":"pl-k"},{"start":68,"end":75,"cssClass":"pl-k"}],[{"start":34,"end":41,"cssClass":"pl-k"},{"start":66,"end":73,"cssClass":"pl-k"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"},{"start":20,"end":51,"cssClass":"pl-c"},{"start":20,"end":22,"cssClass":"pl-c"}],[],[],[{"start":0,"end":75,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":30,"end":37,"cssClass":"pl-k"},{"start":58,"end":65,"cssClass":"pl-k"}],[{"start":29,"end":36,"cssClass":"pl-k"},{"start":56,"end":63,"cssClass":"pl-k"}],[{"start":29,"end":36,"cssClass":"pl-k"},{"start":56,"end":63,"cssClass":"pl-k"}],[{"start":24,"end":31,"cssClass":"pl-k"},{"start":46,"end":53,"cssClass":"pl-k"}],[{"start":25,"end":32,"cssClass":"pl-k"},{"start":48,"end":55,"cssClass":"pl-k"}],[{"start":28,"end":35,"cssClass":"pl-k"},{"start":54,"end":61,"cssClass":"pl-k"}],[{"start":28,"end":35,"cssClass":"pl-k"},{"start":54,"end":61,"cssClass":"pl-k"}],[{"start":30,"end":37,"cssClass":"pl-k"},{"start":58,"end":65,"cssClass":"pl-k"}],[{"start":30,"end":37,"cssClass":"pl-k"},{"start":58,"end":65,"cssClass":"pl-k"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":5,"cssClass":"pl-k"},{"start":19,"end":21,"cssClass":"pl-k"},{"start":22,"end":23,"cssClass":"pl-c1"},{"start":24,"end":27,"cssClass":"pl-k"},{"start":40,"end":42,"cssClass":"pl-k"},{"start":43,"end":44,"cssClass":"pl-c1"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":5,"cssClass":"pl-k"},{"start":18,"end":20,"cssClass":"pl-k"},{"start":21,"end":22,"cssClass":"pl-c1"},{"start":23,"end":26,"cssClass":"pl-k"},{"start":38,"end":40,"cssClass":"pl-k"},{"start":41,"end":42,"cssClass":"pl-c1"},{"start":43,"end":45,"cssClass":"pl-k"},{"start":57,"end":58,"cssClass":"pl-k"},{"start":59,"end":61,"cssClass":"pl-c1"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"}],[{"start":4,"end":14,"cssClass":"pl-k"}],[{"start":0,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":11,"cssClass":"pl-k"}],[{"start":1,"end":18,"cssClass":"pl-k"},{"start":20,"end":50,"cssClass":"pl-c"},{"start":20,"end":22,"cssClass":"pl-c"}],[],[],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":5,"end":10,"cssClass":"pl-k"},{"start":23,"end":45,"cssClass":"pl-c"},{"start":23,"end":25,"cssClass":"pl-c"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":false,"repoAlertsPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/security/dependabot","repoSecurityAndAnalysisPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/settings/security_analysis","repoOwnerIsOrg":false,"currentUserCanAdminRepo":false},"displayName":"updtables.sql","displayUrl":"https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis/blob/main/Code/Sql%20Scripts/updtables.sql?raw=true","headerInfo":{"blobSize":"4.24 KB","deleteInfo":{"deleteTooltip":"Fork this repository and delete the file"},"editInfo":{"editTooltip":"Fork this repository and edit the file"},"ghDesktopPath":"x-github-client://openRepo/https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis?branch=main&filepath=Code%2FSql%20Scripts%2Fupdtables.sql","gitLfsPath":null,"onBranch":true,"shortPath":"5977e84","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2FAnirudhrn98%2FNYC-Taxi_Cab_Analysis%2Fblob%2Fmain%2FCode%2FSql%2520Scripts%2Fupdtables.sql","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"137","truncatedSloc":"111"},"mode":"file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"SQL","languageID":333,"large":false,"loggedIn":true,"newDiscussionPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/discussions/new","newIssuePath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/issues/new","planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/blob/main/Code/Sql%20Scripts/updtables.sql","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","dismissStackNoticePath":"/settings/dismiss-notice/publish_stack_from_file","releasePath":"/Anirudhrn98/NYC-Taxi_Cab_Analysis/releases/new?marketplace=true","showPublishActionBanner":false,"showPublishStackBanner":false},"rawBlobUrl":"https://github.com/Anirudhrn98/NYC-Taxi_Cab_Analysis/raw/main/Code/Sql%20Scripts/updtables.sql","renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"Anirudhrn98","repoName":"NYC-Taxi_Cab_Analysis","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","showDependabotConfigurationBanner":false,"actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timed_out":false,"not_analyzed":true,"symbols":[]}},"copilotInfo":{"documentationUrl":"https://docs.github.com/copilot/overview-of-github-copilot/about-github-copilot-for-individuals","notices":{"codeViewPopover":{"dismissed":false,"dismissPath":"/settings/dismiss-notice/code_view_copilot_popover"}},"userAccess":{"accessAllowed":false,"hasSubscriptionEnded":false,"orgHasCFBAccess":false,"userHasCFIAccess":false,"userHasOrgs":false,"userIsOrgAdmin":false,"userIsOrgMember":false,"business":null,"featureRequestInfo":null}},"copilotAccessAllowed":false,"csrf_tokens":{"/Anirudhrn98/NYC-Taxi_Cab_Analysis/branches":{"post":"ykrjnZiVf5G4gt7FPNVf8PSyddE1zDD2M-Nk12XDZpKx6sFeKbfj55EwIwlFAGX8pQzVCr82_2qHEd6BTR4h2Q"},"/repos/preferences":{"post":"W8jAASiILCMQoOofYwDgvrfTqGUxpNkUzJXX3yIhLoYXbz2qvHAkyomz31SUO-_XTZncXvENq-Pp-P9vF_642A"}}},"title":"NYC-Taxi_Cab_Analysis/Code/Sql Scripts/updtables.sql at main · Anirudhrn98/NYC-Taxi_Cab_Analysis"}