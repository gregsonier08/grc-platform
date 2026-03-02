-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 PT (PII Processing and Transparency)
-- 16 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'pt-1', 'Partial', 'PT policy establishes PII processing requirements for AI systems', 'Include AI data processing in PII policy and procedures', ARRAY['policy_documents']),
  ('GOVERN 1.4', 'pt-2', 'Strong', 'Authority to process PII directly governs AI data processing legitimacy', 'Verify legal authority for PII processing in AI training and inference', ARRAY['legal_opinions', 'policy_documents']),
  ('MAP 1.1', 'pt-2', 'Partial', 'Processing authority supports AI data inventory management', 'Document authorized PII processing purposes for AI systems', ARRAY['data_inventory']),
  ('MAP 2.1', 'pt-3', 'Direct', 'PII processing purposes directly define authorized AI data use', 'Define specific authorized purposes for PII processing in AI systems', ARRAY['policy_documents', 'data_inventory']),
  ('MAP 2.2', 'pt-3', 'Direct', 'Processing purpose limitations directly constrain AI system scope', 'Restrict AI systems to process PII only for documented purposes', ARRAY['policy_documents']),
  ('MAP 2.3', 'pt-3', 'Strong', 'Processing purposes support AI system design constraints', 'Design AI systems to enforce purpose limitations on PII processing', ARRAY['architecture_documents']),
  ('GOVERN 1.4', 'pt-3', 'Strong', 'Processing purposes support AI compliance with privacy requirements', 'Ensure AI PII processing aligns with organizational privacy policies', ARRAY['policy_documents']),
  ('GOVERN 1.4', 'pt-4', 'Strong', 'Consent mechanisms directly applicable to AI data collection and processing', 'Implement consent mechanisms for PII used in AI training and profiling', ARRAY['consent_records', 'policy_documents']),
  ('MAP 2.2', 'pt-4', 'Strong', 'Consent supports AI system scope definition', 'Define AI data processing scope based on obtained consent', ARRAY['consent_records']),
  ('GOVERN 5.1', 'pt-5', 'Strong', 'Privacy notices directly support AI transparency requirements', 'Include AI-specific data processing descriptions in privacy notices', ARRAY['privacy_notices']),
  ('MAP 2.2', 'pt-5', 'Partial', 'Privacy notices communicate AI system data practices', 'Describe AI automated decision-making in privacy notices', ARRAY['privacy_notices']),
  ('MANAGE 4.3', 'pt-5', 'Strong', 'Privacy notices support AI accountability and transparency', 'Publish clear information about AI system data processing practices', ARRAY['privacy_notices', 'public_reports']),
  ('MAP 1.1', 'pt-6', 'Partial', 'System of records notices support AI data system documentation', 'Document AI systems that maintain records about individuals', ARRAY['policy_documents']),
  ('MAP 1.1', 'pt-7', 'Strong', 'Specific PII categories directly relevant to AI training data classification', 'Classify sensitive PII categories in AI training and inference datasets', ARRAY['data_inventory', 'classification_records']),
  ('MAP 1.2', 'pt-7', 'Strong', 'PII categorization supports AI data sensitivity assessment', 'Apply heightened protections to sensitive PII categories in AI systems', ARRAY['data_inventory']),
  ('GOVERN 1.4', 'pt-7', 'Partial', 'PII categories support AI privacy compliance', 'Ensure AI processing of sensitive PII categories meets regulatory requirements', ARRAY['policy_documents'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
