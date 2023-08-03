CREATE SCHEMA IF NOT EXISTS {SOURCE_SCHEMA};
CREATE SCHEMA IF NOT EXISTS {SOURCE_NOK_SCHEMA};
CREATE SCHEMA IF NOT EXISTS temp;
CREATE SCHEMA IF NOT EXISTS results;
CREATE SCHEMA IF NOT EXISTS scratch;

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.patient (
	patid bigint,
	pracid int,
	usualgpstaffid bigint,
	gender int,
	yob int,
	mob int,
	emis_ddate date,
	regstartdate date,
	patienttypeid int,
	regenddate date,
	acceptable smallint,
	cprd_ddate date
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.practice (
	pracid int,
	lcd date,
	uts date,
	region int
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.staff (
	staffid bigint,
	pracid int,
	jobcatid int
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.consultation (
	patid bigint,
	consid bigint,
	pracid int,
	consdate date,
	enterdate date,
	staffid bigint,
	conssourceid int,
	cprdconstype int,
	consmedcodeid bigint
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.observation (
	patid bigint,
	consid bigint,
	pracid int,
	obsid bigint,
	obsdate date,
	enterdate date,
	staffid bigint,
	parentobsid bigint,
	medcodeid bigint,
	value real,
	numunitid int,
	obstypeid int,
	numrangelow real,
	numrangehigh real,
	probobsid bigint
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.problem (
	patid bigint,
	obsid bigint,
	pracid int,
	parentprobobsid bigint,
	probenddate date,
	expduration int,
	lastrevdate date,
	lastrevstaffid bigint,
	parentprobrelid int,
	probstatusid int,
	signid int
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.drugissue (
	patid bigint,
	issueid bigint,
	pracid int,
	probobsid bigint,
	drugrecid bigint,
	issuedate date,
	enterdate date,
	staffid bigint,
	prodcodeid bigint,
	dosageid varchar(64),
	quantity real,
	quantunitid smallint,
	duration int,
	estnhscost real
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}.referral (
	patid bigint,
	obsid bigint,
	pracid int,
	refsourceorgid int,
	reftargetorgid int,
	refurgencyid smallint,
	refservicetypeid smallint,
	refmodeid smallint
);

CREATE TABLE IF NOT EXISTS {SOURCE_SCHEMA}._records (
	tbl_name varchar(20) NOT NULL,
	source_records bigint DEFAULT 0,
	source_nok_records bigint DEFAULT 0,
	total_records bigint DEFAULT 0
);