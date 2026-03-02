-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — CM Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 CM controls
-- 44 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- CM-1: Policy and Procedures
('GOVERN 1.1', 'cm-1', 'Partial',
 'CM-1 establishes the configuration management policy framework that can incorporate AI-specific versioning, model lifecycle, and deployment configuration requirements. Addresses the policy layer for configuration governance but not the full scope of AI risk management policies.',
 'Extend CM-1 policy to explicitly address AI model versioning standards, training pipeline configuration baselines, and deployment approval workflows. Include requirements for documenting AI model provenance and configuration dependencies.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'cm-1', 'Partial',
 'CM-1 procedures define organizational configuration management processes that support AI risk tolerance through controlled change management. Addresses configuration discipline but not the full scope of AI risk tolerance determination.',
 'Define CM procedures for AI model lifecycle events including training, validation, deployment, and retirement. Establish configuration freeze periods during critical AI evaluation phases to maintain stable measurement baselines.',
 ARRAY['Policy documents', 'CM procedure documentation', 'Lifecycle process definitions']),

('GOVERN 1.4', 'cm-1', 'Supportive',
 'CM-1 requires transparent documentation of configuration policies and processes, supporting organizational documentation of AI risk management outcomes. Limited to configuration-related transparency rather than comprehensive AI risk documentation.',
 'Document AI configuration management decisions transparently including model version selection rationale, deployment configurations, and rollback criteria. Publish configuration change histories for AI systems through existing GRC reporting channels.',
 ARRAY['Policy documents', 'Configuration decision records']),

-- CM-2: Baseline Configuration
('GOVERN 1.3', 'cm-2', 'Strong',
 'CM-2 baseline configurations directly define the approved operational state for AI systems, supporting risk tolerance through documented configuration boundaries. Establishes the reference point for detecting unauthorized changes but does not define AI-specific risk thresholds.',
 'Maintain documented baseline configurations for AI model deployments including model version, hyperparameters, serving infrastructure specifications, and data pipeline configurations. Update baselines through formal change control when models are retrained or updated.',
 ARRAY['Baseline configuration records', 'Model deployment specifications', 'Infrastructure configurations']),

('MAP 2.1', 'cm-2', 'Partial',
 'CM-2 baselines document the specific components and settings of AI systems, supporting documentation of implementation methods and components. Addresses configuration documentation but not the broader documentation of AI tasks and methodologies.',
 'Document baseline performance metrics and operational parameters for deployed AI models as part of the baseline configuration. Include model architecture details, framework versions, and dependency specifications in baseline records.',
 ARRAY['Baseline configuration records', 'Performance baseline documentation', 'Architecture specifications']),

('MANAGE 2.2', 'cm-2', 'Strong',
 'CM-2 baseline configurations enable detection of unauthorized AI system modifications by providing an approved reference state for comparison. Directly supports sustaining AI system value through configuration integrity but does not define remediation procedures when baselines are violated.',
 'Compare current AI model configurations against approved baselines on a regular schedule. Implement automated configuration drift detection that alerts when AI serving parameters, model weights, or pipeline configurations deviate from the documented baseline.',
 ARRAY['Configuration drift reports', 'Baseline comparison audits', 'Drift detection alert logs']),

('MAP 2.2', 'cm-2', 'Partial',
 'CM-2 baselines document the known operational parameters of AI systems, supporting documentation of system knowledge limits by establishing what configurations have been validated. Does not address the scientific understanding of AI capabilities and limitations.',
 'Include validated operating ranges and known configuration constraints in AI system baselines. Document which configurations have been tested and validated versus those inherited from upstream dependencies.',
 ARRAY['Baseline configuration records', 'Validation scope documentation']),

-- CM-3: Configuration Change Control
('GOVERN 4.1', 'cm-3', 'Strong',
 'CM-3 change control processes directly govern AI model updates, retraining, and configuration modifications with formal approval workflows. Supports safety-first mindset by requiring deliberate change authorization but does not define AI-specific safety criteria for change approval.',
 'Require formal change approval for AI model retraining, fine-tuning, prompt template modifications, and production deployment. Include AI safety impact assessment as a mandatory step in the change control workflow for AI system modifications.',
 ARRAY['Change request records', 'Change approval logs', 'Safety impact assessments']),

('MANAGE 1.3', 'cm-3', 'Strong',
 'CM-3 change control supports documented AI risk responses by providing a structured process for implementing and tracking changes to AI systems. Ensures risk responses are executed through controlled processes but does not define the risk response strategy itself.',
 'Track AI model changes through formal change management including the risk rationale for each change, expected outcomes, and rollback criteria. Document which identified AI risks each change addresses and the expected risk reduction.',
 ARRAY['Change records', 'Risk response tracking', 'Rollback documentation']),

('MANAGE 2.2', 'cm-3', 'Strong',
 'CM-3 ensures all AI system modifications are authorized, documented, and traceable, directly sustaining the value of deployed AI by preventing unauthorized changes. Addresses change governance but not the broader mechanisms for value assessment.',
 'Log all AI model and pipeline configuration changes with author, approver, timestamp, and justification. Implement pre-deployment gates that verify AI changes have completed required reviews, testing, and approval steps before reaching production.',
 ARRAY['Change audit logs', 'Deployment gate records', 'Configuration change history']),

('GOVERN 4.3', 'cm-3', 'Partial',
 'CM-3 change control supports organizational practices for AI testing and incident sharing by requiring testing and documentation as part of the change process. Addresses change-driven testing but not broader testing practices or incident information sharing.',
 'Require AI-specific test results (accuracy, fairness, performance benchmarks) as artifacts in change control records. Establish post-deployment monitoring requirements as conditions of change approval for AI system modifications.',
 ARRAY['Change test results', 'Post-deployment monitoring plans', 'Change documentation']),

-- CM-4: Impact Analyses
('MAP 3.1', 'cm-4', 'Strong',
 'CM-4 impact analysis directly supports examination of potential AI system benefits by requiring assessment of how configuration changes affect system functionality and stakeholders. Addresses change-driven impact but not the initial benefit analysis for new AI systems.',
 'Assess impact of AI model changes on downstream systems, user workflows, and decision outcomes. Include analysis of how model updates affect prediction accuracy, response latency, and user trust in the impact assessment.',
 ARRAY['Impact assessment reports', 'Downstream dependency analysis', 'Stakeholder impact documentation']),

('MAP 3.2', 'cm-4', 'Strong',
 'CM-4 impact analysis directly supports examination of potential costs associated with AI system changes including performance degradation, bias introduction, and service disruption. Addresses change impact but not the full lifecycle cost analysis of AI systems.',
 'Include bias and fairness impact assessment when analyzing AI configuration changes. Evaluate non-monetary costs such as reduced model explainability, increased latency, and potential disparate impact on user subgroups.',
 ARRAY['Impact assessment reports', 'Fairness impact analysis', 'Cost-benefit documentation']),

('MEASURE 2.6', 'cm-4', 'Partial',
 'CM-4 impact analysis informs AI safety measurement by identifying potential safety implications of configuration changes before implementation. Supports safety assessment but does not define safety evaluation criteria or demonstrate safety.',
 'Reassess AI safety baselines and measurement approaches after significant configuration changes. Include safety regression testing results in impact analysis artifacts to ensure changes do not degrade established safety guarantees.',
 ARRAY['Safety impact assessments', 'Measurement recalibration records', 'Regression test results']),

('MEASURE 2.13', 'cm-4', 'Partial',
 'CM-4 impact analysis supports evaluation of TEVV effectiveness by identifying when system changes may invalidate existing test and evaluation results. Triggers re-evaluation but does not define the TEVV process itself.',
 'Flag configuration changes that may invalidate existing AI TEVV results and trigger re-evaluation. Maintain traceability between configuration states and their associated TEVV findings to identify when re-testing is needed.',
 ARRAY['TEVV validity tracking', 'Configuration-TEVV traceability', 'Re-evaluation trigger logs']),

-- CM-5: Access Restrictions for Change
('GOVERN 1.4', 'cm-5', 'Partial',
 'CM-5 access restrictions support transparent AI governance by documenting who is authorized to make changes to AI systems and enforcing those restrictions. Addresses change authorization transparency but not comprehensive AI risk management documentation.',
 'Restrict AI model configuration and deployment pipeline modifications to authorized roles. Document access restriction decisions and maintain audit logs of all change authorization events for AI systems.',
 ARRAY['Access control records', 'Authorization audit logs', 'Role assignment documentation']),

('MANAGE 2.4', 'cm-5', 'Partial',
 'CM-5 access restrictions support mechanisms to deactivate or modify AI systems by ensuring only authorized personnel can make changes. Provides the access control layer but does not define the criteria for when AI systems should be disengaged.',
 'Implement role-based access for AI model deployment and rollback pipelines with separation between development and production environments. Ensure emergency rollback procedures have pre-authorized access paths that bypass normal change windows.',
 ARRAY['Access control configurations', 'RBAC policies', 'Emergency access procedures']),

('GOVERN 3.2', 'cm-5', 'Partial',
 'CM-5 access restrictions support differentiation of roles for human-AI configuration oversight by controlling who can modify AI system behavior. Addresses technical access enforcement but not the broader policy framework for human-AI role definition.',
 'Define separate access roles for AI model development, review, deployment, and monitoring with appropriate separation of duties. Ensure human oversight roles have read access to AI configurations without modification privileges.',
 ARRAY['Role definitions', 'Separation of duties documentation', 'Access control matrices']),

-- CM-6: Configuration Settings
('MAP 2.1', 'cm-6', 'Strong',
 'CM-6 configuration settings documentation directly supports documentation of AI system implementation details including operational parameters and tunable settings. Addresses the technical configuration layer essential for AI reproducibility and auditability.',
 'Document AI model configuration settings including hyperparameters, inference thresholds, temperature settings, token limits, and safety filter configurations. Maintain configuration registries that enable AI system behavior to be reproduced and audited.',
 ARRAY['Configuration setting records', 'Hyperparameter documentation', 'Setting audit trails']),

('MANAGE 2.2', 'cm-6', 'Partial',
 'CM-6 configuration settings management supports sustaining AI system value by ensuring operational parameters remain within approved ranges. Addresses parameter governance but not the broader value assessment of deployed AI systems.',
 'Define and enforce approved configuration ranges for AI model operational parameters. Implement automated checks that verify AI system settings comply with documented security and performance requirements before and during runtime.',
 ARRAY['Configuration compliance reports', 'Automated check results', 'Parameter range documentation']),

('MEASURE 2.3', 'cm-6', 'Partial',
 'CM-6 configuration settings documentation supports measurement of AI system performance under documented conditions by ensuring the configuration state is known and recorded. Addresses configuration documentation but not the performance measurement methodology.',
 'Record exact configuration settings for each AI performance measurement to ensure reproducibility. Correlate configuration changes with performance measurement outcomes to understand the relationship between settings and AI behavior.',
 ARRAY['Configuration-performance correlation records', 'Measurement environment documentation']),

-- CM-7: Least Functionality
('MAP 2.1', 'cm-7', 'Partial',
 'CM-7 least functionality constrains AI system capabilities to essential functions, supporting documentation of intended AI implementation scope. Addresses capability restriction but not the broader documentation of AI methods and components.',
 'Limit AI system capabilities to documented intended purposes by disabling unnecessary model endpoints, restricting API surface area, and removing unused inference modes. Document the rationale for each enabled AI capability.',
 ARRAY['Capability restriction documentation', 'API surface audit records', 'Architecture documents']),

('MANAGE 2.4', 'cm-7', 'Partial',
 'CM-7 least functionality reduces the AI system attack surface and limits potential misuse by disabling unnecessary capabilities. Supports disengagement by minimizing what an AI system can do but does not define performance-based disengagement criteria.',
 'Disable unnecessary AI model endpoints, capabilities, and administrative interfaces in production environments. Review AI system functionality periodically to identify and remove capabilities that are no longer needed or that pose unacceptable risk.',
 ARRAY['Functionality review records', 'Configuration hardening reports', 'Capability removal logs']),

('MAP 3.3', 'cm-7', 'Partial',
 'CM-7 least functionality supports specifying targeted application scope by requiring organizations to limit system capabilities to essential functions. Addresses capability scoping but not the full documentation of AI application scope and limitations.',
 'Align AI system functionality restrictions with the documented intended use scope. Disable model capabilities that fall outside the approved application scope and document why each capability boundary was established.',
 ARRAY['Application scope documentation', 'Capability boundary records']),

-- CM-8: System Component Inventory
('MAP 1.1', 'cm-8', 'Strong',
 'CM-8 component inventory directly supports understanding of AI system context by maintaining a comprehensive catalog of system components including AI models, datasets, and infrastructure. Core inventory control but scoped to technical components rather than deployment context and societal impacts.',
 'Include AI models, training datasets, inference endpoints, feature stores, and pipeline orchestrators in the system component inventory. Track model lineage, dataset provenance, and dependency relationships between AI components.',
 ARRAY['Component inventory records', 'AI model registry', 'Dataset catalog', 'Dependency maps']),

('GOVERN 1.6', 'cm-8', 'Strong',
 'CM-8 component inventory directly supports AI system inventory mechanisms by providing a structured approach to cataloging and tracking AI components throughout their lifecycle. Core enabler for AI accountability but does not address lifecycle governance decisions.',
 'Extend system component inventory to specifically track AI systems with lifecycle metadata including creation date, training data version, deployment status, and responsible owner. Implement automated discovery to detect unregistered AI components.',
 ARRAY['AI system inventory', 'Lifecycle metadata records', 'Automated discovery logs']),

('MAP 1.5', 'cm-8', 'Strong',
 'CM-8 inventory with component details supports documentation of organizational risk tolerances by providing the factual basis for understanding what AI components exist and their operational characteristics. Addresses component awareness but not risk tolerance determination.',
 'Track AI components alongside their operational purpose, resource consumption, and business criticality in the component inventory. Maintain cost and benefit annotations for AI components to support risk tolerance discussions.',
 ARRAY['Component inventory records', 'Cost-benefit annotations', 'Business criticality ratings']),

('MAP 5.1', 'cm-8', 'Partial',
 'CM-8 inventory supports documentation of AI system likelihood and magnitude of impacts by maintaining records of what AI components exist and where they operate. Addresses component documentation but not impact assessment methodology.',
 'Ensure all AI components are inventoried with version information, data lineage, and operational scope. Link inventory records to impact assessments to maintain traceability between AI components and their documented risk profiles.',
 ARRAY['Component inventory records', 'Impact assessment links', 'Version tracking records']),

-- CM-9: Configuration Management Plan
('GOVERN 1.3', 'cm-9', 'Strong',
 'CM-9 configuration management plan directly establishes the governance framework for AI system configuration lifecycle, supporting organizational risk management processes. Addresses configuration governance planning but not the broader AI risk tolerance determination.',
 'Include AI model lifecycle management in the configuration management plan covering model development, testing, deployment, monitoring, and retirement stages. Define configuration management roles specific to AI systems including model owners, pipeline administrators, and configuration auditors.',
 ARRAY['CM plan documents', 'AI lifecycle procedures', 'Role assignment documentation']),

('MANAGE 2.2', 'cm-9', 'Partial',
 'CM-9 establishes how AI configurations are tracked and verified over time, supporting mechanisms to sustain deployed AI system value. Addresses the planning layer but not the operational monitoring and enforcement.',
 'Define how AI model configurations are continuously tracked, verified, and reported in the CM plan. Establish configuration audit schedules for AI systems aligned with model update cycles and regulatory review requirements.',
 ARRAY['CM plan documents', 'Configuration audit schedules', 'Verification procedures']),

('GOVERN 1.5', 'cm-9', 'Partial',
 'CM-9 planning supports ongoing review of AI system configuration management processes by establishing review cycles and accountability. Addresses CM process review but not the broader AI risk management process review.',
 'Include periodic review of AI configuration management effectiveness in the CM plan. Define metrics for evaluating whether AI configuration processes adequately support model integrity, reproducibility, and auditability.',
 ARRAY['CM plan review records', 'Effectiveness metrics', 'Process improvement documentation']),

-- CM-10: Software Usage Restrictions
('GOVERN 6.1', 'cm-10', 'Partial',
 'CM-10 software usage restrictions support AI third-party risk management by controlling which software and AI tools are authorized for use, including license compliance. Addresses software authorization but not the broader third-party AI risk assessment process.',
 'Establish approved software lists for AI development tools, ML frameworks, and pre-trained model sources with license compliance verification. Restrict use of AI libraries and foundation models to those that have passed security and license review.',
 ARRAY['Approved software lists', 'License compliance records', 'Software authorization logs']),

('MAP 4.1', 'cm-10', 'Partial',
 'CM-10 software restrictions support mapping of AI technology legal risks by requiring license compliance and usage authorization for software components. Addresses software license compliance but not broader intellectual property risk assessment.',
 'Track license terms for AI frameworks, pre-trained models, and training datasets to identify legal restrictions on use. Document usage restrictions for AI components including open-source license obligations, commercial license limitations, and data usage agreements.',
 ARRAY['License tracking records', 'Usage restriction documentation', 'Legal compliance assessments']),

-- CM-11: User-installed Software
('MANAGE 2.4', 'cm-11', 'Partial',
 'CM-11 controls over user-installed software support mechanisms to manage unauthorized AI tool proliferation by governing what AI software users can install. Addresses installation governance but not the performance-based criteria for AI disengagement.',
 'Control installation of AI tools, plugins, and browser extensions that may process organizational data through unauthorized AI services. Implement policies that require approval before users install AI-powered development tools or productivity applications.',
 ARRAY['Software installation policies', 'Approval records', 'Installed software audits']),

('GOVERN 6.1', 'cm-11', 'Partial',
 'CM-11 restricts user installation of unapproved software including third-party AI tools, supporting governance of AI-related third-party risks. Addresses installation control but not comprehensive third-party AI risk assessment.',
 'Prevent unauthorized installation of AI chatbots, code assistants, and data analysis tools that may send organizational data to external AI services. Maintain an approved list of AI tools with documented data handling practices and risk assessments.',
 ARRAY['Installation restriction policies', 'Approved AI tool registry', 'Risk assessment records']),

-- CM-12: Information Location
('MAP 1.1', 'cm-12', 'Partial',
 'CM-12 information location tracking supports understanding of AI data context by documenting where training data, model artifacts, and inference logs are stored and processed. Addresses data residency but not the broader deployment context and potential impacts.',
 'Document where AI training data, model weight files, inference logs, and evaluation results are stored and processed. Track data sovereignty requirements for AI data assets across geographic regions and cloud availability zones.',
 ARRAY['Data location inventory', 'Storage documentation', 'Data residency maps']),

('MAP 1.5', 'cm-12', 'Partial',
 'CM-12 information location supports understanding of AI data flow by documenting where information resides across the AI processing pipeline. Addresses location awareness but not the risk tolerance determination for data placement decisions.',
 'Map AI data flows including training data sources, feature engineering locations, model serving infrastructure, and logging destinations. Document data movement between environments (development, staging, production) for AI pipeline components.',
 ARRAY['Data flow maps', 'Pipeline architecture documentation', 'Environment topology records']),

('MEASURE 2.10', 'cm-12', 'Partial',
 'CM-12 information location tracking supports AI privacy risk assessment by identifying where personal data resides in AI systems. Addresses data location awareness but not the privacy risk evaluation methodology.',
 'Track locations of personal data within AI training datasets, model embeddings, and inference caches. Identify AI data storage locations that cross jurisdictional boundaries and assess associated privacy risk implications.',
 ARRAY['PII location tracking', 'Privacy impact documentation', 'Cross-border data assessments']),

-- CM-13: Data Action Mapping
('MAP 1.1', 'cm-13', 'Strong',
 'CM-13 data action mapping directly supports AI data lineage and provenance documentation by tracking how data is collected, used, transformed, and shared across AI system components. Core data governance control for AI but scoped to data actions rather than deployment context.',
 'Map data actions across the entire AI pipeline from collection through preprocessing, training, inference, and output delivery. Document transformation steps that modify training data to ensure data lineage is complete and auditable.',
 ARRAY['Data action maps', 'AI pipeline documentation', 'Data lineage records']),

('MAP 1.5', 'cm-13', 'Strong',
 'CM-13 data action mapping identifies how AI data processing actions affect individuals and groups, directly supporting documentation of organizational risk tolerances for AI data use. Addresses data processing impacts but not the risk tolerance decision process.',
 'Document how AI data processing actions including collection, aggregation, inference, and scoring affect individuals and demographic groups. Link data action maps to privacy impact assessments and fairness evaluations for AI systems.',
 ARRAY['Data action maps', 'Impact documentation', 'Fairness evaluation links']),

('MAP 5.1', 'cm-13', 'Partial',
 'CM-13 data action mapping supports documentation of AI system impacts by providing visibility into how data flows through AI processing and who is affected. Addresses data action visibility but not impact magnitude assessment.',
 'Include AI-specific data actions in system data maps with annotations for potential impact on data subjects. Track data actions that create derived information (predictions, scores, classifications) and document their downstream use and impact.',
 ARRAY['Data action maps', 'Derived data documentation', 'Impact annotations']),

('MEASURE 2.10', 'cm-13', 'Strong',
 'CM-13 data action mapping directly supports AI privacy risk examination by providing comprehensive visibility into how personal data is processed across AI system components. Core control for understanding privacy exposure in AI data pipelines.',
 'Map all data actions involving personal data in AI systems including training data ingestion, feature extraction, model training, inference, and output delivery. Identify data actions that create re-identification risk or generate new personal data through AI inference.',
 ARRAY['Data action maps', 'Privacy risk documentation', 'Re-identification risk assessments']),

-- CM-14: Signed Components
('MANAGE 2.2', 'cm-14', 'Strong',
 'CM-14 signed components directly supports sustaining AI system value by ensuring deployed model artifacts, libraries, and pipeline components are authentic and unmodified. Provides cryptographic assurance of AI component integrity.',
 'Implement code signing for AI model weight files, serving containers, and pipeline components to ensure authenticity. Verify component signatures before AI deployment and reject unsigned or invalidly signed artifacts from the deployment pipeline.',
 ARRAY['Code signing certificates', 'Signature verification logs', 'Deployment validation records']),

('MANAGE 3.1', 'cm-14', 'Strong',
 'CM-14 signed components supports monitoring of third-party AI resources by providing cryptographic verification that third-party models and libraries have not been tampered with. Addresses artifact integrity but not the broader third-party risk assessment.',
 'Require cryptographic signatures for all third-party AI models, pre-trained weights, and ML libraries before integration. Verify signatures against trusted registries and reject components that fail validation or lack provenance documentation.',
 ARRAY['Third-party signature records', 'Registry verification logs', 'Provenance documentation'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
