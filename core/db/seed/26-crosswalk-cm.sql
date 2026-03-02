-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 CM (Configuration Management)
-- 25 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'cm-1', 'Partial', 'CM policy establishes configuration management requirements for AI systems', 'Include AI model versioning and configuration requirements in CM policy', ARRAY['policy_documents']),
  ('GOVERN 1.3', 'cm-1', 'Partial', 'CM procedures support AI system configuration processes', 'Define procedures for AI model deployment and rollback', ARRAY['policy_documents']),
  ('GOVERN 1.3', 'cm-2', 'Strong', 'Baseline configurations directly applicable to AI system configurations', 'Maintain documented baseline configurations for AI model deployments', ARRAY['configuration_records']),
  ('MAP 2.1', 'cm-2', 'Partial', 'Baselines define expected AI system operational parameters', 'Document baseline performance metrics for deployed AI models', ARRAY['configuration_records']),
  ('MANAGE 2.2', 'cm-2', 'Strong', 'Baseline configurations enable detection of unauthorized AI changes', 'Compare current AI model configurations against approved baselines', ARRAY['configuration_records', 'audit_reports']),
  ('GOVERN 4.1', 'cm-3', 'Strong', 'Change control processes govern AI model updates and retraining', 'Require change approval for AI model retraining, fine-tuning, and deployment', ARRAY['change_records']),
  ('MANAGE 1.3', 'cm-3', 'Strong', 'Change control supports managed AI risk responses', 'Track AI model changes through formal change management', ARRAY['change_records']),
  ('MANAGE 2.2', 'cm-3', 'Strong', 'Change control ensures AI modifications are authorized and documented', 'Log all AI model and pipeline configuration changes', ARRAY['change_records', 'audit_reports']),
  ('MAP 3.1', 'cm-4', 'Strong', 'Impact analysis directly applicable to AI system changes', 'Assess impact of AI model changes on downstream systems and stakeholders', ARRAY['impact_assessments']),
  ('MAP 3.2', 'cm-4', 'Strong', 'Impact analysis evaluates risks of AI configuration changes', 'Include bias and fairness impact in AI change analysis', ARRAY['impact_assessments']),
  ('MEASURE 2.6', 'cm-4', 'Partial', 'Impact analysis informs AI measurement recalibration', 'Reassess AI measurement baselines after significant configuration changes', ARRAY['impact_assessments']),
  ('GOVERN 1.4', 'cm-5', 'Partial', 'Access restrictions support AI governance compliance', 'Restrict who can modify AI model configurations and training pipelines', ARRAY['access_control_records']),
  ('MANAGE 2.4', 'cm-5', 'Partial', 'Access restrictions mitigate unauthorized AI model changes', 'Implement role-based access for AI model deployment pipelines', ARRAY['access_control_records']),
  ('MAP 2.1', 'cm-7', 'Partial', 'Least functionality applies to AI system feature scope', 'Limit AI system capabilities to documented intended purposes', ARRAY['architecture_documents']),
  ('MANAGE 2.4', 'cm-7', 'Partial', 'Least functionality reduces AI attack surface', 'Disable unnecessary AI model endpoints and capabilities', ARRAY['configuration_records']),
  ('MAP 1.1', 'cm-8', 'Strong', 'Component inventory directly supports AI system and data inventory', 'Include AI models, training datasets, and inference endpoints in system inventory', ARRAY['data_inventory', 'asset_inventory']),
  ('MAP 1.5', 'cm-8', 'Strong', 'Component inventory supports AI benefit and cost identification', 'Track AI components alongside their operational purpose and resource costs', ARRAY['asset_inventory']),
  ('MAP 5.1', 'cm-8', 'Partial', 'Inventory supports AI system documentation completeness', 'Ensure all AI components are inventoried with version and lineage information', ARRAY['asset_inventory']),
  ('GOVERN 1.3', 'cm-9', 'Strong', 'CM plan directly applicable to AI system configuration governance', 'Include AI model lifecycle management in configuration management plan', ARRAY['policy_documents', 'configuration_records']),
  ('MANAGE 2.2', 'cm-9', 'Partial', 'CM plan establishes AI configuration monitoring approach', 'Define how AI model configurations are tracked and verified', ARRAY['policy_documents']),
  ('MAP 1.1', 'cm-12', 'Partial', 'Information location supports AI data residency awareness', 'Document where AI training data and models are stored and processed', ARRAY['data_inventory']),
  ('MAP 1.5', 'cm-12', 'Partial', 'Information location supports AI data flow understanding', 'Map AI data flows including training, inference, and logging locations', ARRAY['data_inventory']),
  ('MAP 1.1', 'cm-13', 'Strong', 'Data action mapping directly supports AI data lineage and provenance', 'Map data actions across the AI pipeline from collection through inference', ARRAY['data_flow_diagrams', 'data_inventory']),
  ('MAP 1.5', 'cm-13', 'Strong', 'Data action mapping identifies AI data processing impacts', 'Document how AI data processing actions affect individuals and groups', ARRAY['data_flow_diagrams']),
  ('MAP 5.1', 'cm-13', 'Partial', 'Data action mapping supports AI documentation', 'Include AI-specific data actions in system data maps', ARRAY['data_flow_diagrams'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
