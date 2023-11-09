ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_ancestor_concept_id FOREIGN KEY (ancestor_concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);
ALTER TABLE {VOCABULARY_SCHEMA}.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_descendant_concept_id FOREIGN KEY (descendant_concept_id) REFERENCES {VOCABULARY_SCHEMA}.CONCEPT (CONCEPT_ID);