ALTER TABLE {VOCABULARY_SCHEMA}.concept ADD CONSTRAINT fpk_concept_concept_class_id FOREIGN KEY (concept_class_id) REFERENCES {VOCABULARY_SCHEMA}.concept_class (concept_class_id);

ALTER TABLE {VOCABULARY_SCHEMA}.concept ADD CONSTRAINT fpk_concept_domain_id FOREIGN KEY (domain_id) REFERENCES {VOCABULARY_SCHEMA}.DOMAIN (domain_id);

ALTER TABLE {VOCABULARY_SCHEMA}.concept ADD CONSTRAINT fpk_concept_vocabulary_id FOREIGN KEY (vocabulary_id) REFERENCES {VOCABULARY_SCHEMA}.vocabulary (vocabulary_id);

ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_ancestor_concept_id FOREIGN KEY (ancestor_concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);
ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_descendant_concept_id FOREIGN KEY (descendant_concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);

ALTER TABLE {VOCABULARY_SCHEMA}.concept_class ADD CONSTRAINT fpk_concept_class_concept_class_concept_id FOREIGN KEY (concept_class_concept_id) REFERENCES {VOCABULARY_SCHEMA}.concept (concept_id);

ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_concept_id_1 FOREIGN KEY (concept_id_1) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);
ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_concept_id_2 FOREIGN KEY (concept_id_2) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);

ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_relationship_id FOREIGN KEY (relationship_id) REFERENCES {VOCABULARY_SCHEMA}.RELATIONSHIP (RELATIONSHIP_ID);

ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_SYNONYM ADD CONSTRAINT fpk_CONCEPT_SYNONYM_concept_id FOREIGN KEY (concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);
ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_SYNONYM ADD CONSTRAINT fpk_CONCEPT_SYNONYM_language_concept_id FOREIGN KEY (language_concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);

ALTER TABLE {VOCABULARY_SCHEMA}.DOMAIN ADD CONSTRAINT fpk_domain_domain_concept_id FOREIGN KEY (domain_concept_id) REFERENCES {VOCABULARY_SCHEMA}.concept (concept_id);

ALTER TABLE {VOCABULARY_SCHEMA}.VOCABULARY ADD CONSTRAINT fpk_vocabulary_vocabulary_concept_id FOREIGN KEY (vocabulary_concept_id) REFERENCES {VOCABULARY_SCHEMA}.concept (concept_id);
