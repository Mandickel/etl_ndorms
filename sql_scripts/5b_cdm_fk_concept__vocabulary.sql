ALTER TABLE {VOCABULARY_SCHEMA}.concept ADD CONSTRAINT fpk_concept_vocabulary_id FOREIGN KEY (vocabulary_id) REFERENCES {VOCABULARY_SCHEMA}.vocabulary (vocabulary_id);