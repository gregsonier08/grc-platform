-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 PS (Personnel Security)
-- 12 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'ps-1', 'Partial', 'PS policy establishes personnel security requirements for AI roles', 'Include AI-specific personnel security requirements in PS policy', ARRAY['policy_documents']),
  ('GOVERN 2.1', 'ps-2', 'Partial', 'Position risk designation supports AI role risk categorization', 'Designate risk levels for roles with AI development and deployment access', ARRAY['role_descriptions']),
  ('GOVERN 2.2', 'ps-2', 'Partial', 'Position risk designation informs AI competency requirements', 'Align AI role risk levels with required competencies and clearances', ARRAY['role_descriptions']),
  ('GOVERN 2.1', 'ps-3', 'Partial', 'Personnel screening supports trustworthy AI workforce', 'Screen personnel with access to AI training data and model development', ARRAY['screening_records']),
  ('GOVERN 2.1', 'ps-4', 'Supportive', 'Personnel termination supports AI access lifecycle management', 'Revoke AI system access promptly upon personnel departure', ARRAY['access_control_records']),
  ('GOVERN 2.1', 'ps-5', 'Supportive', 'Personnel transfer supports AI access updates', 'Update AI system access rights when personnel change roles', ARRAY['access_control_records']),
  ('GOVERN 1.4', 'ps-6', 'Partial', 'Access agreements support AI acceptable use commitments', 'Require signed agreements for AI system access covering responsible use obligations', ARRAY['agreement_records']),
  ('GOVERN 6.1', 'ps-6', 'Partial', 'Access agreements establish AI usage expectations', 'Include AI ethics and responsible use provisions in access agreements', ARRAY['agreement_records']),
  ('GOVERN 2.1', 'ps-7', 'Supportive', 'External personnel security supports AI contractor management', 'Apply AI security requirements to external personnel and contractors', ARRAY['contract_records']),
  ('GOVERN 1.4', 'ps-8', 'Supportive', 'Personnel sanctions support AI policy enforcement', 'Define consequences for AI system misuse and policy violations', ARRAY['policy_documents']),
  ('GOVERN 2.1', 'ps-9', 'Partial', 'Position descriptions support AI role definition', 'Document AI-specific responsibilities and competencies in position descriptions', ARRAY['role_descriptions']),
  ('GOVERN 2.2', 'ps-9', 'Partial', 'Position descriptions define AI competency requirements', 'Specify AI risk management competencies for relevant positions', ARRAY['role_descriptions'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
