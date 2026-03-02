-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 SR (Supply Chain Risk Management)
-- 22 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'sr-1', 'Partial', 'SCRM policy establishes AI supply chain risk requirements', 'Include AI model and data supply chain in SCRM policy', ARRAY['policy_documents']),
  ('MAP 3.4', 'sr-2', 'Direct', 'SCRM plan directly addresses AI supply chain risk identification and management', 'Develop AI-specific supply chain risk management plan covering model providers and data sources', ARRAY['risk_management_plans']),
  ('MAP 3.5', 'sr-2', 'Direct', 'SCRM plan directly addresses AI third-party dependencies', 'Document AI supply chain dependencies including foundation models and training data providers', ARRAY['risk_management_plans']),
  ('GOVERN 1.1', 'sr-2', 'Partial', 'SCRM plan contextualizes AI supply chain governance', 'Reference AI supply chain risks in organizational governance framework', ARRAY['risk_management_plans']),
  ('MAP 3.4', 'sr-3', 'Strong', 'Supply chain controls directly manage AI vendor and provider risks', 'Implement controls for AI model provenance, data sourcing, and third-party dependencies', ARRAY['vendor_assessments', 'contract_records']),
  ('MAP 3.5', 'sr-3', 'Strong', 'Supply chain processes verify AI component trustworthiness', 'Establish processes to validate AI model and data supply chain integrity', ARRAY['vendor_assessments']),
  ('MAP 1.1', 'sr-4', 'Direct', 'Provenance directly supports AI model and data lineage tracking', 'Track provenance of AI models, training data, and pre-trained components from origin to deployment', ARRAY['provenance_records', 'data_inventory']),
  ('MAP 1.5', 'sr-4', 'Strong', 'Provenance supports AI impact traceability', 'Trace AI data and model origins to assess potential impacts and biases', ARRAY['provenance_records']),
  ('MAP 5.1', 'sr-4', 'Strong', 'Provenance supports AI system documentation completeness', 'Document complete supply chain lineage for AI system components', ARRAY['provenance_records']),
  ('MAP 3.4', 'sr-5', 'Strong', 'Acquisition strategies directly address AI procurement risks', 'Define acquisition criteria for AI models, services, and training data', ARRAY['acquisition_records']),
  ('GOVERN 1.7', 'sr-5', 'Partial', 'Acquisition strategies support sustainable AI procurement', 'Plan AI acquisitions considering long-term governance requirements', ARRAY['acquisition_records']),
  ('MAP 3.4', 'sr-6', 'Strong', 'Supplier assessments directly evaluate AI vendor risks', 'Assess AI model and data providers for security, bias, and reliability risks', ARRAY['vendor_assessments', 'audit_reports']),
  ('MAP 3.5', 'sr-6', 'Strong', 'Supplier reviews validate AI third-party trustworthiness', 'Conduct periodic reviews of AI service providers and data sources', ARRAY['vendor_assessments']),
  ('MEASURE 2.9', 'sr-6', 'Strong', 'Supplier assessments support AI system evaluation through third-party review', 'Include AI-specific evaluation criteria in supplier assessments', ARRAY['vendor_assessments', 'audit_reports']),
  ('MAP 3.4', 'sr-7', 'Partial', 'Supply chain OPSEC supports AI procurement confidentiality', 'Protect AI acquisition strategies and requirements from disclosure', ARRAY['policy_documents']),
  ('MANAGE 4.2', 'sr-8', 'Partial', 'Notification agreements support AI supply chain incident awareness', 'Require AI vendors to notify of security incidents, model changes, and data breaches', ARRAY['contract_records']),
  ('MANAGE 2.4', 'sr-9', 'Partial', 'Tamper resistance supports AI model integrity', 'Apply tamper detection to AI model artifacts and deployment packages', ARRAY['integrity_reports']),
  ('MAP 3.4', 'sr-10', 'Strong', 'Component inspection directly validates AI system integrity', 'Inspect AI models and components for vulnerabilities and backdoors before deployment', ARRAY['inspection_reports', 'test_reports']),
  ('MAP 3.5', 'sr-10', 'Strong', 'Inspection supports AI third-party component validation', 'Validate third-party AI models and libraries meet security and quality requirements', ARRAY['inspection_reports']),
  ('MAP 3.4', 'sr-11', 'Strong', 'Component authenticity directly applicable to AI model verification', 'Verify authenticity of AI models, libraries, and training data sources', ARRAY['provenance_records', 'integrity_reports']),
  ('MAP 5.1', 'sr-11', 'Partial', 'Authenticity verification supports AI documentation', 'Document AI component authentication methods and results', ARRAY['provenance_records']),
  ('MANAGE 2.4', 'sr-12', 'Partial', 'Component disposal applies to AI model and data decommissioning', 'Securely dispose of retired AI models, training data, and inference logs', ARRAY['disposal_records'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
