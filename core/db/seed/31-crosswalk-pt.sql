-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — PT Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 PT controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- PT-1: Policy and Procedures
('GOVERN 1.1', 'pt-1', 'Partial',
 'PT-1 establishes the PII processing and transparency policy framework that can incorporate AI-specific data handling, consent, and transparency requirements. Addresses the policy layer for privacy but not the full scope of AI risk management policies.',
 'Extend PT-1 policy to explicitly address AI-specific PII processing including training data collection, automated inference on personal data, and AI-generated personal information. Include AI transparency requirements in privacy policy scope.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'pt-1', 'Partial',
 'PT-1 procedures define organizational PII processing practices that support AI risk tolerance through documented privacy thresholds. Addresses privacy process discipline but not the full scope of AI risk tolerance determination.',
 'Define procedures for AI-specific PII processing activities including training data preparation, model evaluation with personal data, and inference result handling. Establish privacy thresholds for AI data processing that align with organizational risk tolerance.',
 ARRAY['Policy documents', 'PT procedure documentation', 'Privacy threshold definitions']),

-- PT-2: Authority to Process Personally Identifiable Information
('GOVERN 1.4', 'pt-2', 'Strong',
 'PT-2 authority to process PII directly governs AI data processing legitimacy by requiring documented legal authority for each category of PII processing. Core compliance control for AI systems that process personal data for training or inference.',
 'Verify legal authority for PII processing in AI training, fine-tuning, evaluation, and inference activities. Document the specific legal basis (consent, legitimate interest, contractual necessity, legal obligation) for each AI data processing purpose.',
 ARRAY['Legal authority documentation', 'Processing basis records', 'Legal opinions']),

('MAP 1.1', 'pt-2', 'Partial',
 'PT-2 processing authority supports understanding of AI data context by requiring organizations to identify and document what PII they are authorized to process in AI systems. Addresses authorization documentation but not the broader deployment context.',
 'Document authorized PII processing purposes for each AI system including what categories of personal data are processed, under what authority, and for what specific AI functions. Maintain an authority-to-process register for AI data activities.',
 ARRAY['Processing authority register', 'AI data inventory', 'Authorization documentation']),

('MEASURE 2.10', 'pt-2', 'Partial',
 'PT-2 processing authority supports AI privacy risk examination by establishing the legal boundaries within which AI PII processing must occur. Processing without proper authority is a primary privacy risk for AI systems.',
 'Assess whether AI data processing activities have proper legal authority as part of privacy risk evaluation. Identify AI processing activities that may exceed authorized purposes or process PII categories not covered by existing authority.',
 ARRAY['Privacy risk assessments', 'Authority gap analysis', 'Compliance evaluation records']),

-- PT-3: Personally Identifiable Information Processing Purposes
('MAP 2.1', 'pt-3', 'Direct',
 'PT-3 processing purposes directly define the authorized uses of personal data in AI systems by requiring documented purpose specifications. Core control for ensuring AI systems process PII only for legitimate, documented purposes.',
 'Define specific authorized purposes for PII processing in AI systems including model training, inference, evaluation, and monitoring. Prohibit repurposing of PII collected for one AI function for use in different AI applications without additional authorization.',
 ARRAY['Purpose specification documents', 'AI processing purpose registry', 'Purpose limitation documentation']),

('MAP 2.2', 'pt-3', 'Direct',
 'PT-3 processing purpose limitations directly constrain AI system scope by restricting what AI systems may do with personal data. Core control for documenting AI system knowledge limits based on authorized data use boundaries.',
 'Restrict AI systems to process PII only for documented and authorized purposes. Define and communicate purpose boundaries to AI system operators and users to prevent scope creep in AI data processing activities.',
 ARRAY['Purpose limitation enforcement records', 'Scope documentation', 'Operator guidance documents']),

('MAP 2.3', 'pt-3', 'Strong',
 'PT-3 processing purposes support AI system TEVV considerations by defining the authorized scope within which AI systems should be tested and evaluated. Provides the purpose constraints that inform AI testing boundaries.',
 'Design AI systems to enforce purpose limitations on PII processing through technical controls such as data access restrictions, purpose-tagged data flows, and automated purpose compliance checking. Test purpose enforcement as part of AI system validation.',
 ARRAY['Purpose enforcement architecture', 'Technical control documentation', 'Validation test results']),

('GOVERN 1.4', 'pt-3', 'Strong',
 'PT-3 processing purposes support transparent AI privacy governance by requiring documented and communicated data use purposes. Ensures AI PII processing decisions are recorded and reviewable for compliance.',
 'Ensure AI PII processing aligns with documented organizational privacy policies and purpose specifications. Maintain audit trails linking AI data processing activities to their authorized purposes for transparency and compliance verification.',
 ARRAY['Purpose compliance audit logs', 'Policy alignment documentation', 'Transparency records']),

-- PT-4: Consent
('GOVERN 1.4', 'pt-4', 'Strong',
 'PT-4 consent mechanisms directly apply to AI data collection and processing by requiring informed individual authorization before PII is used for AI purposes. Core privacy control for AI systems that process personal data requiring consent.',
 'Implement consent mechanisms for PII used in AI training, inference, and profiling activities. Provide individuals with clear information about how their data will be used in AI systems including automated decision-making and profiling before obtaining consent.',
 ARRAY['Consent management records', 'Consent form documentation', 'AI processing disclosure records']),

('MAP 2.2', 'pt-4', 'Strong',
 'PT-4 consent supports documentation of AI system knowledge limits by defining the scope of data processing that individuals have authorized. AI systems should not process personal data beyond the scope of obtained consent.',
 'Define AI data processing scope based on obtained consent including what data types may be processed, what AI functions may use the data, and what automated decisions may be made. Document consent-based restrictions as AI system operating boundaries.',
 ARRAY['Consent scope documentation', 'Processing boundary records', 'Consent-to-function mapping']),

('MEASURE 2.10', 'pt-4', 'Strong',
 'PT-4 consent directly addresses AI privacy risk by ensuring individuals have control over how their personal data is used in AI systems. Lack of proper consent is a primary privacy risk for AI training and inference on personal data.',
 'Evaluate consent coverage and validity as a primary AI privacy risk metric. Assess whether consent obtained covers all AI processing activities, whether consent language accurately describes AI use, and whether withdrawal mechanisms function correctly.',
 ARRAY['Consent coverage assessments', 'Consent validity audits', 'Withdrawal mechanism test results']),

('GOVERN 5.1', 'pt-4', 'Partial',
 'PT-4 consent processes support collection of external feedback by establishing communication channels through which individuals express their data processing preferences. Addresses consent-based feedback but not systematic stakeholder engagement.',
 'Use consent interactions as opportunities to collect feedback about AI data processing practices. Provide clear channels for individuals to ask questions about AI data use, update preferences, and express concerns about automated processing.',
 ARRAY['Consent interaction records', 'Feedback channel documentation', 'Preference management logs']),

-- PT-5: Privacy Notice
('GOVERN 5.1', 'pt-5', 'Strong',
 'PT-5 privacy notices directly support AI transparency by requiring organizations to communicate data processing practices to individuals. Core transparency control for AI systems that ensures affected individuals understand how their data is used.',
 'Include AI-specific data processing descriptions in privacy notices covering automated decision-making, profiling activities, AI training data use, and inference result handling. Explain in accessible language how AI systems use personal data and what decisions may be informed by AI.',
 ARRAY['Privacy notices', 'AI processing disclosures', 'Accessibility documentation']),

('MAP 2.2', 'pt-5', 'Partial',
 'PT-5 privacy notices communicate AI system data practices and limitations to individuals, supporting documentation of what AI systems do with personal data. Addresses communication of practices but not the scientific understanding of AI system limitations.',
 'Describe AI automated decision-making capabilities and limitations in privacy notices. Include information about what types of decisions AI systems inform, what data inputs are used, and what options individuals have to request human review.',
 ARRAY['Privacy notices', 'AI capability disclosures', 'Human review procedure documentation']),

('MANAGE 4.3', 'pt-5', 'Strong',
 'PT-5 privacy notices directly support AI accountability by ensuring incidents and data practices are communicated to affected communities. Core transparency mechanism for AI system accountability.',
 'Publish clear, accessible information about AI system data processing practices in privacy notices. Update notices when AI data practices change and provide prominent disclosure of AI-related processing activities that may affect individual rights.',
 ARRAY['Privacy notices', 'Update notification records', 'Rights impact disclosures']),

('MEASURE 2.8', 'pt-5', 'Partial',
 'PT-5 privacy notices support AI transparency and accountability risk assessment by providing the mechanism through which organizations communicate AI data practices. Addresses the communication mechanism but not the broader transparency evaluation.',
 'Evaluate privacy notice effectiveness in communicating AI data processing practices. Assess whether notices provide sufficient information for individuals to understand AI automated processing and exercise their rights.',
 ARRAY['Notice effectiveness assessments', 'Comprehension testing results', 'Rights exercise documentation']),

-- PT-6: System of Records Notice
('MAP 1.1', 'pt-6', 'Partial',
 'PT-6 system of records notices support AI data system documentation by requiring public notification when systems maintain records about individuals. Addresses records system documentation but not the broader AI deployment context understanding.',
 'Document AI systems that maintain records about individuals including training datasets with PII, inference result databases, and behavioral profiling stores. Publish system of records notices for AI systems that retrieve personal records by individual identifier.',
 ARRAY['System of records notices', 'AI records system documentation', 'Publication records']),

('GOVERN 1.4', 'pt-6', 'Partial',
 'PT-6 notices support transparent AI data governance by requiring public documentation of AI systems that maintain personal records. Addresses records system transparency but not comprehensive AI risk management documentation.',
 'Ensure AI systems that create, maintain, or use records about individuals have appropriate system of records notices. Include AI-specific processing details such as automated profiling, scoring, and decision-making in notice descriptions.',
 ARRAY['System of records notices', 'AI processing descriptions', 'Compliance verification records']),

-- PT-7: Specific Categories of Personally Identifiable Information
('MAP 1.1', 'pt-7', 'Strong',
 'PT-7 specific PII categories directly apply to AI training data classification by requiring identification and documentation of sensitive personal data categories processed by AI systems. Core data classification control for AI privacy governance.',
 'Classify sensitive PII categories in AI training and inference datasets including Social Security numbers, biometric data, health information, financial data, and protected class attributes. Apply heightened controls to AI systems processing sensitive PII categories.',
 ARRAY['PII classification records', 'AI data sensitivity assessments', 'Heightened control documentation']),

('MAP 1.2', 'pt-7', 'Strong',
 'PT-7 PII categorization supports AI data sensitivity assessment by requiring interdisciplinary consideration of what personal data categories are present and how they should be protected. Addresses data categorization but not broader interdisciplinary AI context.',
 'Apply heightened protections to sensitive PII categories in AI training and inference including additional access controls, encryption requirements, and audit logging. Evaluate whether processing sensitive PII categories in AI systems is necessary or if less sensitive alternatives exist.',
 ARRAY['Protection documentation', 'Necessity assessments', 'Alternative data analysis records']),

('GOVERN 1.4', 'pt-7', 'Partial',
 'PT-7 PII categories support AI privacy compliance by requiring organizations to identify and appropriately handle regulated categories of personal data in AI systems. Addresses category-level compliance but not comprehensive AI risk documentation.',
 'Ensure AI processing of sensitive PII categories meets all applicable regulatory requirements including sector-specific rules for health data, financial data, and children''s data. Document compliance with category-specific regulatory obligations for each AI system.',
 ARRAY['Regulatory compliance records', 'Category-specific documentation', 'Compliance assessment reports']),

('MEASURE 2.10', 'pt-7', 'Strong',
 'PT-7 PII categorization directly supports AI privacy risk examination by identifying which AI systems process the most sensitive categories of personal data. Systems processing sensitive categories present higher privacy risk requiring additional evaluation.',
 'Prioritize AI privacy risk assessment for systems processing sensitive PII categories. Evaluate additional privacy risks created by AI inference on sensitive data including potential for discrimination, unauthorized profiling, and disproportionate impact on vulnerable populations.',
 ARRAY['Privacy risk prioritization records', 'Sensitive data risk assessments', 'Vulnerable population impact analysis']),

-- PT-8: Computer Matching Requirements
('GOVERN 1.4', 'pt-8', 'Partial',
 'PT-8 computer matching requirements apply to AI systems that match personal records across datasets, a common operation in AI training data preparation and entity resolution. Addresses matching compliance but not broader AI governance transparency.',
 'Apply computer matching agreement requirements to AI data preparation activities that link personal records across datasets. Ensure AI training data matching, entity resolution, and record linkage activities comply with applicable matching regulations.',
 ARRAY['Matching agreement records', 'Data linkage documentation', 'Compliance verification records']),

('MAP 1.1', 'pt-8', 'Partial',
 'PT-8 matching requirements support understanding of AI data context by documenting how personal records from different sources are combined for AI purposes. Addresses matching documentation but not the broader AI deployment context.',
 'Document AI data preparation activities that involve matching or linking personal records from multiple sources. Maintain records of what datasets are matched, matching criteria used, and resulting combined datasets used for AI training.',
 ARRAY['Matching activity documentation', 'Dataset combination records', 'Matching criteria specifications'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
