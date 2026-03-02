-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — SR Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 SR controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- SR-1: Policy and Procedures
('GOVERN 1.1', 'sr-1', 'Partial',
 'SR-1 establishes the supply chain risk management policy framework that can incorporate AI-specific supply chain requirements including model provenance, training data sourcing, and third-party AI service governance. Addresses the policy layer but not the full scope of AI risk management policies.',
 'Extend SR-1 policy to explicitly address AI supply chain risks including foundation model provider dependencies, training data provenance requirements, and pre-trained model acquisition standards. Reference AI-specific supply chain threat models in policy scope.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 6.1', 'sr-1', 'Strong',
 'SR-1 policy directly addresses third-party AI risks by establishing the governance framework for supply chain risk management including intellectual property and licensing considerations. Core policy control for AI third-party risk governance.',
 'Include AI-specific third-party risk categories in SCRM policy covering model licensing compliance, training data rights verification, and intellectual property protection for AI outputs. Define approval requirements for engaging new AI service providers.',
 ARRAY['Policy documents', 'Third-party risk governance framework', 'Approval procedures']),

-- SR-2: Supply Chain Risk Management Plan
('MAP 3.4', 'sr-2', 'Direct',
 'SR-2 SCRM plan directly addresses AI supply chain risk identification and management by requiring comprehensive planning for supply chain threats. Core control for ensuring AI components from external sources meet organizational standards.',
 'Develop an AI-specific supply chain risk management plan covering foundation model providers, training data sources, ML framework dependencies, and pre-trained model acquisition. Include risk assessment criteria for evaluating AI vendor trustworthiness and component reliability.',
 ARRAY['SCRM plan documents', 'AI supply chain risk assessments', 'Vendor evaluation criteria']),

('MAP 3.5', 'sr-2', 'Direct',
 'SR-2 SCRM plan directly addresses AI third-party dependencies by documenting and managing risks associated with external AI components and services. Ensures human oversight processes extend to supply chain relationships.',
 'Document all AI supply chain dependencies including foundation models, pre-trained weights, third-party APIs, open-source ML libraries, and external training data sources. Establish monitoring and review schedules for each dependency category.',
 ARRAY['Dependency documentation', 'Supply chain maps', 'Monitoring schedule records']),

('GOVERN 1.1', 'sr-2', 'Partial',
 'SR-2 SCRM planning contextualizes AI supply chain governance within the broader organizational risk management framework. Addresses supply chain planning but not the full scope of AI risk management policies and practices.',
 'Reference AI supply chain risks in the organizational governance framework and ensure SCRM planning aligns with broader AI risk management policies. Define how AI supply chain risks feed into enterprise risk reporting.',
 ARRAY['SCRM plan documents', 'Enterprise risk framework alignment', 'Governance documentation']),

('MANAGE 3.1', 'sr-2', 'Strong',
 'SR-2 SCRM plan directly supports regular monitoring of AI risks from third-party resources by establishing the planning framework for ongoing supply chain risk assessment. Core planning control for third-party AI risk monitoring.',
 'Include ongoing monitoring requirements for AI supply chain in the SCRM plan. Define review triggers such as major version releases by AI providers, security advisories affecting ML frameworks, and changes to data provider terms of service.',
 ARRAY['SCRM plan documents', 'Monitoring trigger definitions', 'Review schedule records']),

-- SR-3: Supply Chain Controls and Processes
('MAP 3.4', 'sr-3', 'Strong',
 'SR-3 supply chain controls directly manage AI vendor and provider risks through established processes for assessing and managing supply chain relationships. Addresses control implementation but relies on SR-2 planning for risk identification.',
 'Implement controls for AI model provenance verification, training data source validation, and third-party dependency security assessment. Establish intake processes that require AI components to pass security scanning, license compliance, and quality validation before integration.',
 ARRAY['Supply chain control records', 'Vendor assessment reports', 'Intake process documentation']),

('MAP 3.5', 'sr-3', 'Strong',
 'SR-3 supply chain processes support verification of AI component trustworthiness through systematic evaluation and validation procedures. Ensures human oversight extends to AI supply chain through structured processes.',
 'Establish processes to validate AI model and data supply chain integrity including cryptographic signature verification, reproducibility testing, and bias evaluation for third-party models. Require documentation of supply chain validation results before deployment.',
 ARRAY['Validation process records', 'Integrity verification reports', 'Bias evaluation results']),

('GOVERN 6.2', 'sr-3', 'Partial',
 'SR-3 supply chain controls support contingency planning for third-party AI disruptions by establishing processes for managing supply chain failures. Addresses process controls but not the contingency planning framework itself.',
 'Define supply chain control processes that include fallback procedures for AI provider outages, model deprecation, or data source unavailability. Maintain alternative supplier lists for critical AI supply chain components.',
 ARRAY['Contingency procedure documents', 'Alternative supplier records', 'Fallback process documentation']),

-- SR-4: Provenance
('MAP 1.1', 'sr-4', 'Direct',
 'SR-4 provenance tracking directly supports understanding of AI system context by requiring documentation of component origins, custody chains, and modification history. Core control for AI data lineage and model ancestry documentation.',
 'Track provenance of AI models, training datasets, and pre-trained components from origin through all transformations to deployment. Maintain immutable records of training data sources, model training runs, and fine-tuning operations for complete lineage traceability.',
 ARRAY['Provenance records', 'Data lineage documentation', 'Model ancestry records']),

('MAP 1.5', 'sr-4', 'Strong',
 'SR-4 provenance supports assessment of AI impacts by enabling traceability from AI outputs back to source data and model origins. Critical for understanding how training data choices and model selection affect AI system behavior and potential biases.',
 'Trace AI data and model origins to assess potential impacts and embedded biases. Use provenance records to identify whether training data sources are representative, whether model origins introduce systematic biases, and how component choices affect AI risk profiles.',
 ARRAY['Provenance analysis reports', 'Bias traceability documentation', 'Impact assessment records']),

('MAP 5.1', 'sr-4', 'Strong',
 'SR-4 provenance supports documentation of AI system likelihood and magnitude of impacts by providing complete supply chain visibility. Enables identification of concentrated risk from single-source dependencies.',
 'Document complete supply chain lineage for AI system components including upstream dependencies, version history, and known issues. Identify single points of failure in AI supply chains where component unavailability would impact system operation.',
 ARRAY['Supply chain documentation', 'Single point of failure analysis', 'Dependency risk assessments']),

('MEASURE 2.1', 'sr-4', 'Partial',
 'SR-4 provenance supports TEVV documentation by providing the data and model lineage needed to understand and reproduce test results. Addresses lineage traceability but not the TEVV methodology itself.',
 'Include provenance records in TEVV documentation to enable traceability from test results to specific model versions and training data configurations. Verify that evaluation results correspond to the exact provenance chain of the deployed model.',
 ARRAY['TEVV provenance links', 'Test-to-lineage traceability', 'Reproduction verification records']),

-- SR-5: Acquisition Strategies, Tools, and Methods
('MAP 3.4', 'sr-5', 'Strong',
 'SR-5 acquisition strategies directly address AI procurement risks by establishing criteria and methods for acquiring AI components, services, and data. Core control for ensuring AI acquisitions align with organizational quality and security standards.',
 'Define acquisition criteria for AI models, services, and training data including security requirements, bias evaluation standards, performance benchmarks, and license compliance. Evaluate build-versus-buy tradeoffs for AI capabilities against organizational risk appetite.',
 ARRAY['Acquisition criteria documentation', 'Evaluation records', 'Build-vs-buy analysis']),

('GOVERN 1.7', 'sr-5', 'Partial',
 'SR-5 acquisition strategies support AI system decommissioning planning by requiring consideration of long-term sustainability in procurement decisions. Addresses acquisition-phase planning but not the full decommissioning process.',
 'Plan AI acquisitions considering long-term governance requirements including vendor lock-in risks, data portability, model export capabilities, and exit strategies for third-party AI dependencies. Negotiate contractual provisions for data return upon service termination.',
 ARRAY['Acquisition planning records', 'Exit strategy documentation', 'Contract provisions']),

('MAP 4.1', 'sr-5', 'Partial',
 'SR-5 acquisition strategies support mapping of AI technology legal risks by requiring evaluation of licensing, intellectual property, and regulatory compliance in procurement. Addresses acquisition-phase legal assessment but not ongoing legal risk monitoring.',
 'Evaluate AI acquisition options for legal risks including open-source license obligations, model output ownership, training data rights, and regulatory compliance in target deployment jurisdictions. Document legal risk assessment as part of acquisition decision records.',
 ARRAY['Legal risk assessments', 'License evaluation records', 'Regulatory compliance documentation']),

-- SR-6: Supplier Assessments and Reviews
('MAP 3.4', 'sr-6', 'Strong',
 'SR-6 supplier assessments directly evaluate AI vendor risks through structured review processes covering security, quality, and reliability. Core control for validating that AI suppliers meet organizational standards.',
 'Assess AI model and data providers for security posture, bias testing practices, model reliability track record, and incident response capabilities. Include AI-specific assessment criteria such as model card completeness, training data documentation, and fairness evaluation results.',
 ARRAY['Supplier assessment reports', 'AI vendor scorecards', 'Risk evaluation records']),

('MAP 3.5', 'sr-6', 'Strong',
 'SR-6 supplier reviews validate AI third-party trustworthiness through periodic reassessment of supplier risk profiles. Ensures ongoing oversight of AI supply chain relationships beyond initial acquisition.',
 'Conduct periodic reviews of AI service providers including evaluation of model version changes, security posture updates, and compliance with agreed service levels. Reassess supplier risk ratings when providers make significant changes to their AI offerings.',
 ARRAY['Supplier review reports', 'Periodic assessment records', 'Service level evaluation documentation']),

('MEASURE 2.9', 'sr-6', 'Strong',
 'SR-6 supplier assessments support AI system evaluation by requiring review of third-party model documentation, validation results, and governance practices. Directly supports responsible use and governance of third-party AI components.',
 'Include AI-specific evaluation criteria in supplier assessments: model explainability documentation, validation methodology transparency, bias testing results, and incident history. Require suppliers to provide model cards or equivalent documentation for all AI components.',
 ARRAY['Supplier evaluation reports', 'Model card reviews', 'Third-party validation documentation']),

('MANAGE 3.2', 'sr-6', 'Strong',
 'SR-6 supplier reviews directly support monitoring of pre-trained models used in development by providing structured assessment of the organizations that produce and maintain those models. Core control for third-party model governance.',
 'Monitor pre-trained model suppliers for changes that could affect organizational AI systems including model architecture updates, training data changes, and deprecation notices. Require advance notification from suppliers before significant model changes.',
 ARRAY['Pre-trained model monitoring records', 'Supplier notification agreements', 'Change impact assessments']),

-- SR-7: Supply Chain Operations Security
('MAP 3.4', 'sr-7', 'Partial',
 'SR-7 supply chain OPSEC supports AI procurement confidentiality by protecting acquisition strategies, requirements, and evaluation criteria from adversarial exploitation. Addresses information protection but not the broader supply chain risk management.',
 'Protect AI acquisition strategies, model evaluation criteria, and supply chain vulnerability assessments from unauthorized disclosure. Limit visibility into AI procurement requirements to need-to-know personnel to prevent adversarial targeting of supply chain weaknesses.',
 ARRAY['OPSEC assessment reports', 'Information classification records', 'Access control documentation']),

-- SR-8: Notification Agreements
('MANAGE 4.2', 'sr-8', 'Strong',
 'SR-8 notification agreements directly support continual AI improvement by requiring suppliers to communicate security incidents, model changes, and service disruptions. Core control for maintaining situational awareness of AI supply chain status.',
 'Require AI vendors to provide timely notification of security incidents affecting their AI services, significant model version changes, training data modifications, and end-of-life announcements. Define notification timelines and escalation procedures in supplier agreements.',
 ARRAY['Notification agreement records', 'Vendor contract provisions', 'Notification compliance tracking']),

('MANAGE 3.1', 'sr-8', 'Partial',
 'SR-8 notification agreements support monitoring of third-party AI risks by ensuring timely communication of supply chain changes and incidents. Addresses notification framework but not the broader risk monitoring and control activities.',
 'Include AI-specific notification requirements in supplier agreements covering model drift detection, performance degradation, data breach incidents involving training data, and changes to model governance practices. Track notification compliance across suppliers.',
 ARRAY['Notification agreement provisions', 'Compliance tracking records', 'Incident notification logs']),

-- SR-9: Tamper Resistance and Detection
('MANAGE 2.4', 'sr-9', 'Strong',
 'SR-9 tamper resistance directly supports mechanisms to detect and respond to unauthorized modifications of AI components throughout the supply chain. Core control for ensuring AI model integrity from source through deployment.',
 'Apply tamper detection to AI model artifacts, deployment packages, and training data throughout the supply chain. Implement cryptographic seals, hash verification, and integrity monitoring for AI components at each stage from acquisition through deployment.',
 ARRAY['Tamper detection configurations', 'Integrity verification records', 'Supply chain seal documentation']),

('MANAGE 2.2', 'sr-9', 'Partial',
 'SR-9 tamper resistance supports sustaining AI system value by preventing unauthorized modifications that could degrade model performance or introduce vulnerabilities. Addresses integrity protection but not broader value sustainment.',
 'Deploy tamper-evident packaging for AI model weight files and configuration bundles distributed across deployment environments. Implement automated integrity checks that detect unauthorized modifications to AI components before they reach production.',
 ARRAY['Tamper-evident packaging records', 'Automated integrity check logs', 'Deployment validation reports']),

-- SR-10: Inspection of Systems or Components
('MAP 3.4', 'sr-10', 'Strong',
 'SR-10 component inspection directly validates AI system integrity before deployment by requiring examination of components for vulnerabilities, counterfeit elements, and tampering evidence. Core quality gate for AI supply chain components.',
 'Inspect AI models and components for vulnerabilities, backdoors, and quality issues before deployment including static analysis of model architectures, adversarial robustness testing, and fairness evaluation. Screen for known model vulnerability patterns and poisoning indicators.',
 ARRAY['Inspection reports', 'Vulnerability scan results', 'Pre-deployment quality gate records']),

('MAP 3.5', 'sr-10', 'Strong',
 'SR-10 inspection supports validation of third-party AI components by requiring systematic examination before integration. Ensures human oversight of AI supply chain through structured inspection processes.',
 'Validate third-party AI models and libraries against security and quality requirements before integration. Inspect pre-trained models for embedded biases, known vulnerabilities, and compliance with organizational standards through structured evaluation procedures.',
 ARRAY['Third-party inspection reports', 'Integration validation records', 'Compliance evaluation results']),

('MEASURE 2.5', 'sr-10', 'Partial',
 'SR-10 inspection supports demonstration of AI system validity by providing pre-deployment verification that components meet performance and security requirements. Addresses component-level validation but not the full TEVV process.',
 'Include AI component inspection results in TEVV documentation to demonstrate that deployed components passed pre-deployment quality and security validation. Correlate inspection findings with post-deployment performance to validate inspection effectiveness.',
 ARRAY['Inspection-TEVV linkage records', 'Post-deployment correlation analysis', 'Validation effectiveness reports']),

-- SR-11: Component Authenticity
('MAP 3.4', 'sr-11', 'Strong',
 'SR-11 component authenticity directly applies to AI model verification by requiring confirmation that AI components are genuine and unmodified from their claimed source. Core anti-counterfeiting control for AI supply chain.',
 'Verify authenticity of AI models, ML libraries, and training data sources through cryptographic signature validation, hash verification against official registries, and provenance chain confirmation. Reject AI components that cannot be authenticated to a trusted source.',
 ARRAY['Authenticity verification records', 'Signature validation logs', 'Registry confirmation records']),

('MAP 5.1', 'sr-11', 'Partial',
 'SR-11 authenticity verification supports AI documentation completeness by providing verified evidence of component origins and integrity. Addresses component documentation but not the broader impact assessment methodology.',
 'Document AI component authentication methods, verification results, and the trusted sources used for validation. Maintain authenticity records as part of AI system documentation to support audit and compliance requirements.',
 ARRAY['Authentication documentation', 'Verification result records', 'Audit trail documentation']),

('MANAGE 3.1', 'sr-11', 'Partial',
 'SR-11 authenticity verification supports monitoring of third-party AI resources by ensuring ongoing verification that components remain authentic and unmodified. Addresses component integrity but not the broader risk monitoring activities.',
 'Periodically re-verify authenticity of deployed third-party AI components against updated registries and signature databases. Detect when deployed model versions no longer match authenticated versions due to unauthorized updates or supply chain compromise.',
 ARRAY['Re-verification records', 'Authenticity monitoring logs', 'Discrepancy alert records']),

-- SR-12: Component Disposal
('MANAGE 2.4', 'sr-12', 'Partial',
 'SR-12 component disposal supports AI system decommissioning by requiring secure disposal of retired components. Addresses physical and data disposal but not the broader criteria for when AI systems should be disengaged.',
 'Securely dispose of retired AI models, training datasets, inference logs, and associated infrastructure. Ensure model weight files are cryptographically erased, training data is purged according to retention policies, and deployment artifacts are removed from all environments.',
 ARRAY['Disposal records', 'Cryptographic erasure certificates', 'Decommissioning checklists']),

('GOVERN 1.7', 'sr-12', 'Partial',
 'SR-12 component disposal supports AI decommissioning processes by defining how retired AI components are handled at end of life. Addresses disposal mechanics but not the decommissioning decision process or downstream risk assessment.',
 'Include AI-specific disposal procedures in decommissioning plans covering model artifact destruction, training data retention decisions, and inference log archival or purging. Verify disposal completeness including removal from model registries, API gateway deregistration, and monitoring system cleanup.',
 ARRAY['Disposal procedures', 'Decommissioning verification records', 'Registry cleanup logs'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
