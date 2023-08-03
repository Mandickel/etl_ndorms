--OBSERVATION
alter table {SOURCE_SCHEMA}.observation add constraint pk_observation primary key (obsid);
create index idx_observation_patid on {SOURCE_SCHEMA}.observation (patid);
cluster {SOURCE_SCHEMA}.observation using idx_observation_patid;
create index idx_observation_medcodeid on {SOURCE_SCHEMA}.observation (medcodeid);
create index idx_observation_consid on {SOURCE_SCHEMA}.observation (consid);
create index idx_observation_numunitid on {SOURCE_SCHEMA}.observation (numunitid);
create index idx_observation_staffid on {SOURCE_SCHEMA}.observation (staffid);
create index idx_observation_obsdate on {SOURCE_SCHEMA}.observation (obsdate);
