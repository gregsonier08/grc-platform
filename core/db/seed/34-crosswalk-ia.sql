-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 IA (Identification and Authentication)
-- 11 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'ia-1', 'Partial', 'IA policy establishes authentication requirements for AI systems', 'Include AI system and API authentication requirements in IA policy', ARRAY['policy_documents']),
  ('GOVERN 1.3', 'ia-1', 'Partial', 'IA procedures support AI access authentication processes', 'Define authentication procedures for AI model endpoints and training pipelines', ARRAY['policy_documents']),
  ('MANAGE 2.4', 'ia-2', 'Partial', 'User identification supports AI system access accountability', 'Require authenticated access to AI inference endpoints and management interfaces', ARRAY['access_control_records', 'audit_logs']),
  ('MANAGE 2.4', 'ia-3', 'Partial', 'Device identification supports AI system boundary protection', 'Authenticate devices connecting to AI training and inference infrastructure', ARRAY['configuration_records']),
  ('MANAGE 2.4', 'ia-4', 'Supportive', 'Identifier management supports AI system access tracking', 'Manage unique identifiers for AI system service accounts and API keys', ARRAY['access_control_records']),
  ('MANAGE 2.4', 'ia-5', 'Partial', 'Authenticator management protects AI system credentials', 'Manage API keys, tokens, and credentials for AI services securely', ARRAY['configuration_records']),
  ('MANAGE 2.4', 'ia-8', 'Supportive', 'Non-organizational user identification supports AI multi-tenant access', 'Authenticate external users accessing AI services', ARRAY['access_control_records']),
  ('MANAGE 2.4', 'ia-9', 'Partial', 'Service identification supports AI service-to-service authentication', 'Authenticate AI microservices and model pipeline components', ARRAY['configuration_records']),
  ('MANAGE 2.4', 'ia-11', 'Supportive', 'Re-authentication supports ongoing AI session verification', 'Re-authenticate long-running AI processing sessions', ARRAY['configuration_records']),
  ('GOVERN 1.4', 'ia-12', 'Partial', 'Identity proofing supports AI system user verification', 'Verify identities of users granted access to AI administrative functions', ARRAY['identity_records']),
  ('MANAGE 2.4', 'ia-13', 'Supportive', 'Identity providers support centralized AI access management', 'Integrate AI systems with organizational identity providers', ARRAY['architecture_documents'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
