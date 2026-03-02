-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 AT (Awareness and Training)
-- 10 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'at-1', 'Partial', 'AT policy establishes AI training and awareness requirements', 'Include AI literacy requirements in awareness and training policy', ARRAY['policy_documents']),
  ('GOVERN 3.2', 'at-2', 'Strong', 'Literacy training directly supports AI awareness across the organization', 'Include AI risk awareness, responsible AI use, and AI limitations in security literacy training', ARRAY['training_records', 'training_materials']),
  ('GOVERN 2.1', 'at-2', 'Partial', 'Literacy training supports AI-informed organizational culture', 'Build organizational awareness of AI capabilities and limitations', ARRAY['training_records']),
  ('GOVERN 3.2', 'at-3', 'Strong', 'Role-based training directly supports AI competency development', 'Develop AI-specific training for roles that develop, deploy, or oversee AI systems', ARRAY['training_records', 'training_materials']),
  ('GOVERN 2.2', 'at-3', 'Strong', 'Role-based training builds AI governance competencies', 'Train AI governance roles on risk management, bias detection, and ethical AI practices', ARRAY['training_records']),
  ('GOVERN 3.2', 'at-4', 'Partial', 'Training records support AI competency tracking', 'Track completion of AI-specific training requirements', ARRAY['training_records']),
  ('GOVERN 5.1', 'at-5', 'Partial', 'Security group contacts support AI community engagement', 'Engage with AI safety and governance professional organizations', ARRAY['meeting_records']),
  ('GOVERN 5.2', 'at-5', 'Partial', 'Association contacts support AI standards awareness', 'Stay current on AI governance standards and best practices', ARRAY['meeting_records']),
  ('GOVERN 3.2', 'at-6', 'Partial', 'Training feedback improves AI training effectiveness', 'Collect and act on feedback from AI training programs', ARRAY['training_records', 'feedback_records']),
  ('MEASURE 4.1', 'at-6', 'Partial', 'Training feedback supports AI program measurement', 'Use training feedback to assess AI awareness program effectiveness', ARRAY['feedback_records'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
