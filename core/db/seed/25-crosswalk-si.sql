-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — SI Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 SI controls
-- 57 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- SI-1: Policy and Procedures
('GOVERN 1.1', 'si-1', 'Partial',
 'SI-1 establishes the system and information integrity policy framework that can incorporate AI-specific integrity, monitoring, and data quality requirements. Addresses the policy layer for integrity but not the full scope of AI-specific legal and regulatory tracking.',
 'Extend SI-1 policy to explicitly address AI system integrity requirements including model validation, training data quality standards, and output verification procedures. Reference applicable AI regulations and industry standards in the policy scope.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'si-1', 'Partial',
 'SI-1 procedures define organizational integrity processes and risk tolerance boundaries for system operations. Supports AI risk tolerance through integrity thresholds but does not address the full scope of AI risk management activity levels.',
 'Include AI-specific integrity thresholds in SI procedures such as acceptable model drift rates, minimum data quality scores, and output confidence levels. Define escalation criteria when AI systems fall below integrity thresholds.',
 ARRAY['Policy documents', 'Risk tolerance documentation', 'Integrity threshold definitions']),

('GOVERN 1.4', 'si-1', 'Supportive',
 'SI-1 requires transparent documentation of integrity policies and procedures, supporting organizational transparency around AI risk management outcomes. Scope is limited to integrity-related documentation rather than comprehensive AI risk transparency.',
 'Document AI integrity decisions transparently in SI policy artifacts. Publish AI system integrity metrics and monitoring outcomes to relevant stakeholders through existing GRC reporting channels.',
 ARRAY['Policy documents', 'Integrity reporting dashboards']),

-- SI-2: Flaw Remediation
('MANAGE 1.2', 'si-2', 'Strong',
 'SI-2 flaw remediation directly supports prioritized treatment of AI system vulnerabilities by requiring identification, reporting, and correction of system flaws. Covers the technical remediation process but does not address AI-specific risk assessment methodologies for prioritization.',
 'Track AI model and pipeline vulnerabilities alongside traditional software flaws in the vulnerability management platform. Include AI-specific flaw categories such as adversarial input vulnerabilities, model poisoning risks, and training data corruption.',
 ARRAY['Vulnerability reports', 'Patch records', 'AI vulnerability tracking']),

('MANAGE 1.3', 'si-2', 'Strong',
 'SI-2 flaw remediation includes prioritization and planning of corrective actions, directly supporting AI risk response development. Addresses remediation planning but not the broader risk transfer or acceptance decisions in AI risk response.',
 'Prioritize AI-specific flaws based on model criticality and potential impact on downstream decisions. Develop remediation runbooks for common AI vulnerabilities including data drift, concept drift, and adversarial attack patterns.',
 ARRAY['Vulnerability reports', 'Remediation plans', 'Risk response documentation']),

('MANAGE 4.1', 'si-2', 'Partial',
 'SI-2 flaw tracking feeds post-deployment monitoring by ensuring identified vulnerabilities are remediated and tracked over time. Supports incident detection through vulnerability awareness but is not a direct monitoring mechanism.',
 'Include AI system flaws in remediation tracking dashboards with AI-specific SLA targets. Configure automated alerts when AI component vulnerabilities exceed remediation timelines.',
 ARRAY['Vulnerability dashboards', 'Remediation SLA reports']),

-- SI-3: Malicious Code Protection
('MANAGE 2.2', 'si-3', 'Partial',
 'SI-3 malicious code protection supports sustaining AI system value by detecting malicious content at system entry and exit points. Addresses traditional malware but does not specifically cover AI-targeted attacks such as adversarial examples or model poisoning payloads.',
 'Scan AI model artifacts, training data pipelines, and inference inputs for malicious content. Extend malware scanning to cover serialized model files (pickle, ONNX, SafeTensors) where code execution vulnerabilities are common.',
 ARRAY['Malware scan reports', 'Pipeline security logs', 'Model artifact scan results']),

('MANAGE 2.4', 'si-3', 'Partial',
 'SI-3 malicious code detection supports mechanisms to supersede or deactivate compromised AI components by identifying threats to model integrity. Does not address the decision framework for when to disengage an AI system versus remediating in place.',
 'Verify integrity of third-party AI libraries, pre-trained models, and foundation model API dependencies before deployment. Implement quarantine procedures for AI artifacts that fail integrity checks.',
 ARRAY['Malware scan reports', 'Third-party model verification records', 'Quarantine logs']),

-- SI-4: System Monitoring
('MEASURE 2.4', 'si-4', 'Strong',
 'SI-4 system monitoring directly enables continuous measurement of AI system functionality and behavior in production as identified in the MAP function. Provides the technical infrastructure for ongoing AI monitoring but does not define AI-specific metrics or thresholds.',
 'Monitor AI model inference patterns for anomalous outputs, prediction drift, and unexpected input distributions. Configure SIEM rules to detect AI-specific anomalies such as sudden accuracy drops, latency spikes, or unusual query patterns.',
 ARRAY['SIEM dashboards', 'AI monitoring logs', 'Anomaly detection alerts']),

('MEASURE 2.5', 'si-4', 'Strong',
 'SI-4 monitoring supports demonstration of AI system validity and reliability by providing continuous operational telemetry. Captures system behavior data necessary for TEVV but does not define the evaluation criteria or acceptance thresholds.',
 'Track AI prediction accuracy, confidence score distributions, and error rates through system monitoring. Establish baseline performance metrics and alert on deviations that exceed acceptable confidence intervals.',
 ARRAY['Performance monitoring dashboards', 'Accuracy tracking reports', 'Baseline deviation alerts']),

('MEASURE 2.7', 'si-4', 'Strong',
 'SI-4 monitoring captures system security and resilience data directly relevant to evaluating AI system security posture. Provides the observation layer for AI security evaluation but does not address the assessment methodology.',
 'Include AI-specific security telemetry in system monitoring strategy: model endpoint access patterns, inference request volumes, and data exfiltration indicators. Monitor for adversarial probing attempts against AI model APIs.',
 ARRAY['Security monitoring logs', 'AI endpoint access logs', 'Adversarial detection alerts']),

('MEASURE 2.8', 'si-4', 'Partial',
 'SI-4 system monitoring supports transparency and accountability by providing audit trails of system behavior. Addresses observability but not the broader transparency requirements such as explainability or stakeholder communication.',
 'Monitor AI system behavior under edge-case and adversarial conditions to support robustness assessment. Log all AI system decisions with sufficient context for post-hoc accountability review.',
 ARRAY['Monitoring logs', 'Decision audit trails', 'Edge-case test results']),

('MEASURE 3.1', 'si-4', 'Strong',
 'SI-4 provides the foundational monitoring infrastructure for identifying and tracking existing, unanticipated, and emergent AI risks in production. Directly enables risk tracking through continuous system observation but does not define risk categorization frameworks.',
 'Integrate AI-specific telemetry into SIEM and monitoring platforms to enable real-time risk tracking. Configure monitoring to detect emergent risks such as model drift, distribution shift, and novel failure modes not seen during testing.',
 ARRAY['SIEM integration configs', 'AI telemetry dashboards', 'Emergent risk alerts']),

('MEASURE 3.3', 'si-4', 'Partial',
 'SI-4 monitoring can capture user feedback signals and system-level indicators that inform AI measurement improvements. Supports feedback integration indirectly through system telemetry rather than direct user feedback mechanisms.',
 'Use monitoring trend analysis to refine AI performance thresholds and measurement approaches. Correlate system monitoring data with user-reported issues to identify gaps in AI measurement coverage.',
 ARRAY['Monitoring trend reports', 'Feedback correlation analysis']),

('MANAGE 4.1', 'si-4', 'Strong',
 'SI-4 system monitoring directly enables post-deployment AI monitoring by providing detection capabilities for incidents, errors, and performance degradation. Core infrastructure for AI incident detection but does not define AI-specific incident response procedures.',
 'Configure alerts for AI model degradation, drift, and unexpected behavior patterns. Implement monitoring dashboards that track AI system health metrics alongside traditional infrastructure monitoring.',
 ARRAY['Monitoring dashboards', 'AI alert configurations', 'Incident detection logs']),

('MANAGE 4.2', 'si-4', 'Partial',
 'SI-4 monitoring outputs can inform continual improvement activities by identifying recurring patterns and opportunities for enhancement. Provides data for improvement but does not establish the engagement processes with stakeholders.',
 'Route AI-specific monitoring alerts to appropriate response teams with defined escalation paths. Use monitoring data trends to prioritize AI system improvements in sprint planning and roadmap discussions.',
 ARRAY['Alert routing configurations', 'Escalation procedures', 'Improvement tracking logs']),

-- SI-4.2: Automated Tools and Mechanisms for Real-Time Analysis
('MEASURE 3.1', 'si-4.2', 'Strong',
 'SI-4(2) automated real-time analysis provides advanced monitoring capabilities specifically suited for tracking fast-moving AI risks that require immediate detection. Extends base monitoring with automation needed for AI systems operating at scale.',
 'Deploy automated real-time analysis tools to monitor AI inference pipelines for anomalies, performance degradation, and security threats. Implement streaming analytics on AI system telemetry to detect risks faster than batch monitoring allows.',
 ARRAY['Real-time analytics dashboards', 'Automated alert configurations', 'Streaming analysis logs']),

-- SI-5: Security Alerts, Advisories, and Directives
('MANAGE 4.1', 'si-5', 'Partial',
 'SI-5 security alert dissemination supports AI risk awareness by ensuring relevant vulnerability advisories reach appropriate personnel. Addresses information distribution but does not define AI-specific threat intelligence sources or response procedures.',
 'Include AI-specific vulnerability advisories (e.g., framework CVEs, model architecture vulnerabilities, adversarial attack disclosures) in security alert dissemination processes. Subscribe to AI security mailing lists and threat intelligence feeds.',
 ARRAY['Advisory distribution records', 'AI threat intelligence feeds', 'Alert acknowledgment logs']),

('MANAGE 4.2', 'si-5', 'Partial',
 'SI-5 advisory distribution supports continual improvement by keeping teams informed of emerging AI security threats and mitigations. Limited to advisory awareness rather than structured improvement processes.',
 'Distribute AI framework vulnerability notifications and best practice updates to development and operations teams. Track advisory response actions to measure organizational learning and improvement over time.',
 ARRAY['Advisory distribution records', 'Response action tracking', 'Improvement metrics']),

-- SI-6: Security and Privacy Function Verification
('MEASURE 2.5', 'si-6', 'Strong',
 'SI-6 function verification directly validates that AI system security controls operate correctly, supporting demonstration of validity and reliability. Addresses verification of security functions but not broader AI performance or fairness validation.',
 'Verify AI-specific security functions including access controls on model endpoints, data encryption in transit and at rest for training data, and authentication mechanisms for inference APIs. Schedule periodic verification aligned with AI deployment cycles.',
 ARRAY['Function verification reports', 'Security test results', 'Verification schedules']),

('MEASURE 2.6', 'si-6', 'Strong',
 'SI-6 verification supports AI safety assessment by confirming that protective controls function as intended. Validates the operational effectiveness of safety controls but does not define AI-specific safety criteria.',
 'Validate that AI monitoring and measurement tools produce accurate results through periodic function verification. Test that safety guardrails (content filters, output validators, rate limiters) continue to function after model updates.',
 ARRAY['Safety control test results', 'Guardrail verification reports', 'Post-update validation logs']),

-- SI-7: Software, Firmware, and Information Integrity
('MEASURE 2.5', 'si-7', 'Strong',
 'SI-7 integrity verification directly ensures AI models, training data, and configuration files have not been tampered with, supporting TEVV validity. Addresses data and artifact integrity but not the broader validation of model behavior or performance.',
 'Implement cryptographic hashing for AI model weight files, training datasets, and inference pipeline configurations. Verify integrity checksums before model deployment and periodically during runtime to detect unauthorized modifications.',
 ARRAY['Integrity verification reports', 'Hash validation logs', 'Model artifact checksums']),

('MANAGE 2.2', 'si-7', 'Strong',
 'SI-7 integrity monitoring detects unauthorized modifications to AI models or data, directly sustaining the value of deployed AI systems. Provides tamper detection but does not address the remediation workflow when integrity violations are found.',
 'Alert on unexpected changes to deployed model weights, configuration files, or serving infrastructure. Implement file integrity monitoring on AI model storage locations and version-controlled model registries.',
 ARRAY['Integrity monitoring alerts', 'File integrity logs', 'Model registry audit trails']),

('MANAGE 2.4', 'si-7', 'Partial',
 'SI-7 integrity controls support mechanisms to deactivate compromised AI components by providing evidence of tampering. Detects the need for disengagement but does not implement the disengagement mechanism itself.',
 'Use code signing and cryptographic checksums for AI deployment artifacts including model files, serving containers, and pipeline scripts. Define automated rollback triggers when integrity verification fails.',
 ARRAY['Code signing certificates', 'Deployment artifact checksums', 'Rollback trigger logs']),

-- SI-7.1: Integrity Checks
('MEASURE 2.5', 'si-7.1', 'Strong',
 'SI-7(1) integrity checks at specific events (startup, restart, deployment) provide targeted verification of AI model integrity at critical lifecycle transitions. Extends base integrity with event-driven checks most relevant to AI deployment pipelines.',
 'Configure integrity checks to run automatically at AI model deployment, container startup, and pipeline execution events. Verify model file checksums, dependency versions, and configuration integrity before allowing inference traffic.',
 ARRAY['Deployment integrity check logs', 'Startup verification results', 'Pipeline integrity reports']),

-- SI-8: Spam Protection
('MANAGE 2.2', 'si-8', 'Partial',
 'SI-8 spam protection mechanisms at system entry points can filter noise and unwanted inputs to AI systems, helping sustain the value of AI outputs. Addresses unsolicited input filtering but not the broader spectrum of AI-specific input quality controls.',
 'Apply spam and noise filtering to AI system input channels to prevent low-quality data from degrading model performance. Implement input preprocessing pipelines that reject clearly malformed or adversarial inputs before they reach inference endpoints.',
 ARRAY['Spam filter configurations', 'Input rejection logs', 'Preprocessing pipeline metrics']),

-- SI-9: Information Input Restrictions
('GOVERN 3.2', 'si-9', 'Partial',
 'SI-9 input restrictions define who can provide information to system functions, supporting human-AI configuration policies by controlling which users and systems can submit inputs to AI models. Addresses input authorization but not the full scope of human oversight design.',
 'Restrict AI model input sources to authorized users, systems, and data pipelines through input restriction controls. Define and enforce rules for which data sources are approved for AI training versus inference workloads.',
 ARRAY['Input restriction policies', 'Authorized source lists', 'Access control configurations']),

-- SI-10: Information Input Validation
('MAP 2.3', 'si-10', 'Direct',
 'SI-10 input validation directly addresses AI system input data quality by checking validity of information inputs including character sets, ranges, and formats. Core control for ensuring AI models receive well-formed inputs that match expected data specifications.',
 'Validate AI input data types, value ranges, formats, and schemas before model inference. Implement input sanitization for text-based AI systems to prevent prompt injection, SQL injection through natural language interfaces, and other input manipulation attacks.',
 ARRAY['Input validation rules', 'Validation test reports', 'Sanitization configurations']),

('MEASURE 2.5', 'si-10', 'Partial',
 'SI-10 input validation supports AI output quality measurement by ensuring inputs conform to expected specifications, reducing one source of unreliable outputs. Addresses input quality but not the broader TEVV process for validating model behavior.',
 'Track input validation failure rates, rejection reasons, and data quality metrics as AI quality indicators. Correlate input validation outcomes with downstream model prediction accuracy to quantify the impact of input quality on AI reliability.',
 ARRAY['Validation metrics dashboards', 'Input quality trend reports', 'Correlation analysis results']),

-- SI-11: Error Handling
('MEASURE 2.8', 'si-11', 'Partial',
 'SI-11 error handling supports AI transparency by requiring error messages that provide necessary corrective information without revealing exploitable details. Addresses error communication but not the broader transparency requirements for AI systems such as model explainability.',
 'Design AI system error messages to convey actionable guidance for users without exposing model internals, training data details, or system architecture. Implement structured error codes for AI-specific failure modes (model timeout, confidence below threshold, input out of distribution).',
 ARRAY['Error handling specifications', 'Error message review records', 'AI error taxonomy documentation']),

('GOVERN 4.2', 'si-11', 'Partial',
 'SI-11 error handling supports documentation of AI risks and potential impacts by providing structured error information that teams can analyze and communicate. Limited to error-level documentation rather than comprehensive risk communication.',
 'Log AI system errors with sufficient context for risk analysis including input characteristics, model state, and environmental conditions. Aggregate error patterns to identify systemic AI risks for documentation and stakeholder communication.',
 ARRAY['Error logs', 'Error pattern analysis reports', 'Risk documentation']),

-- SI-12: Information Management and Retention
('GOVERN 1.3', 'si-12', 'Partial',
 'SI-12 information retention supports AI data governance by defining lifecycle management for training data, model versions, and inference logs in accordance with regulations. Addresses data retention but not the AI-specific risk tolerance and process determination.',
 'Define retention policies for AI training data, model weight files, inference logs, and evaluation results. Align AI data retention with applicable regulations (GDPR right to deletion, CCPA data retention, sector-specific requirements for model audit trails).',
 ARRAY['Retention policy documents', 'Data lifecycle records', 'Regulatory compliance evidence']),

('MAP 1.1', 'si-12', 'Partial',
 'SI-12 retention management supports understanding of AI system data context by tracking information assets through their lifecycle. Addresses data lifecycle awareness but not the broader understanding of deployment context and potential impacts.',
 'Track AI data assets through their retention lifecycle including training data provenance, model version history, and inference log archival. Maintain data lineage documentation that connects retained data to specific AI models and decisions.',
 ARRAY['Data inventory records', 'Retention lifecycle tracking', 'Data lineage documentation']),

-- SI-13: Predictable Failure Prevention
('MANAGE 2.2', 'si-13', 'Strong',
 'SI-13 predictable failure prevention through MTTF analysis and proactive component replacement directly supports sustaining AI system value by preventing known failure modes. Addresses hardware and infrastructure reliability but requires extension for AI-specific failure patterns.',
 'Design AI systems with failover, graceful degradation, and redundant model serving capabilities. Apply MTTF analysis to AI infrastructure components (GPU clusters, model serving nodes, data pipeline stages) and implement proactive replacement before predicted failures.',
 ARRAY['MTTF analysis reports', 'Failover test results', 'Capacity planning documents']),

('MANAGE 4.1', 'si-13', 'Partial',
 'SI-13 failure prevention informs post-deployment AI monitoring by identifying components likely to fail and establishing monitoring around them. Supports proactive monitoring but does not define the full monitoring plan for AI systems.',
 'Pre-plan responses for predicted AI system failure modes including model serving degradation, data pipeline interruptions, and GPU memory exhaustion. Include failure prevention triggers in post-deployment monitoring dashboards.',
 ARRAY['Failure mode analysis', 'Monitoring trigger configurations', 'Incident response plans']),

-- SI-15: Information Output Filtering
('MAP 2.3', 'si-15', 'Direct',
 'SI-15 output filtering directly controls AI system output quality and safety by validating that information output is consistent with expected content. Core control for AI guardrails including content safety filters, toxicity detection, and hallucination checks.',
 'Implement content filters, toxicity detectors, factual grounding checks, and hallucination detection on AI outputs before delivery to users. Define expected output profiles for each AI application and configure filtering rules to reject outputs that deviate from specifications.',
 ARRAY['Output filter configurations', 'Filter effectiveness test reports', 'Rejected output logs']),

('MEASURE 2.11', 'si-15', 'Strong',
 'SI-15 output filtering supports fairness and bias evaluation by enabling analysis of filtered versus unfiltered AI output distributions. Provides the mechanism for bias detection in outputs but does not define fairness metrics or bias thresholds.',
 'Monitor filtered versus unfiltered output distributions for bias indicators across demographic categories. Analyze output filtering patterns to detect whether certain user groups or input categories are disproportionately affected by safety filters.',
 ARRAY['Bias analysis reports', 'Output distribution dashboards', 'Fairness audit results']),

('MEASURE 2.9', 'si-15', 'Partial',
 'SI-15 output filtering supports AI model interpretation and responsible use by ensuring outputs are validated within expected parameters before delivery. Addresses output validation but not model explainability or contextual interpretation.',
 'Configure output filters to flag low-confidence predictions, out-of-distribution responses, and outputs that require human review. Provide contextual metadata alongside AI outputs to support informed interpretation by end users.',
 ARRAY['Confidence threshold configurations', 'Human review queue metrics', 'Output metadata specifications']),

-- SI-17: Fail-safe Procedures
('MANAGE 2.4', 'si-17', 'Strong',
 'SI-17 fail-safe procedures directly support mechanisms to disengage or deactivate AI systems during failures by defining specific steps to take when failures occur. Provides the procedural framework for AI system disengagement but does not define AI-specific failure detection criteria.',
 'Define fail-safe procedures for AI systems including automatic fallback to rule-based systems, graceful service degradation, and emergency model rollback. Establish clear criteria for when AI systems should be deactivated versus operating in degraded mode.',
 ARRAY['Fail-safe procedure documents', 'Fallback configuration records', 'Emergency rollback runbooks']),

('MANAGE 4.1', 'si-17', 'Partial',
 'SI-17 fail-safe procedures support post-deployment incident response by establishing predetermined responses to system failures. Addresses failure response but not the broader monitoring and evaluation components of post-deployment plans.',
 'Integrate AI system fail-safe triggers into post-deployment monitoring dashboards. Define automated and manual fail-safe activation criteria based on AI-specific indicators such as sustained accuracy degradation or safety threshold violations.',
 ARRAY['Fail-safe trigger configurations', 'Incident response procedures', 'Monitoring integration documentation']),

-- SI-18: PII Quality Operations
('MAP 1.1', 'si-18', 'Strong',
 'SI-18 PII quality operations directly support understanding of AI training data context by ensuring personally identifiable information is accurate, relevant, timely, and complete. Core control for AI data quality governance but scoped to PII rather than all training data.',
 'Ensure PII used in AI training is accurate, complete, and current through regular data quality assessments. Implement data validation pipelines that check PII quality before incorporation into training datasets and flag records that fail quality thresholds.',
 ARRAY['Data quality assessment reports', 'PII validation pipeline logs', 'Quality threshold configurations']),

('MAP 1.2', 'si-18', 'Strong',
 'SI-18 PII quality management supports AI data categorization by requiring organizations to understand and manage the quality of personal data used in AI systems. Addresses PII-specific categorization but not broader data classification for AI purposes.',
 'Classify PII sensitivity levels in AI training and inference datasets using established data categorization frameworks. Maintain data dictionaries that document PII fields, their quality status, and their use across different AI models.',
 ARRAY['Data classification records', 'Data dictionaries', 'PII inventory documentation']),

('MEASURE 2.1', 'si-18', 'Strong',
 'SI-18 PII quality operations support AI fairness measurement by ensuring the underlying personal data is accurate enough to detect and measure bias. Data quality issues in PII can introduce or mask bias in AI systems.',
 'Assess whether PII quality issues introduce or obscure bias in AI system outputs. Include PII quality metrics alongside fairness metrics in TEVV reporting to understand the relationship between data quality and model fairness.',
 ARRAY['Fairness assessment reports', 'Data quality correlation analysis', 'TEVV documentation']),

-- SI-19: De-identification
('MAP 1.1', 'si-19', 'Strong',
 'SI-19 de-identification is critical for understanding AI training data context because it determines what personal information is present and accessible in datasets. Core privacy control for AI data preparation but does not address non-PII data context.',
 'Apply de-identification techniques to PII before use in AI model training, ensuring privacy protection while preserving data utility for model learning. Validate that de-identification is effective against re-identification attacks specific to AI training data.',
 ARRAY['De-identification records', 'Privacy impact assessments', 'Re-identification risk analysis']),

('MAP 1.2', 'si-19', 'Strong',
 'SI-19 de-identification supports proper AI data categorization by defining which data elements have been de-identified and which retain identifying characteristics. Essential for accurate data classification in AI contexts.',
 'Verify de-identification effectiveness for AI training datasets and document the techniques applied. Maintain records that distinguish between fully de-identified, partially de-identified, and raw PII datasets used across AI development stages.',
 ARRAY['De-identification verification reports', 'Data categorization records', 'Technique documentation']),

('GOVERN 1.4', 'si-19', 'Partial',
 'SI-19 de-identification supports transparent documentation of AI privacy practices by requiring organizations to implement and document privacy-protective data handling. Addresses privacy documentation but not comprehensive AI risk management transparency.',
 'Reference de-identification standards and techniques in AI data governance policies. Document de-identification decisions including which methods were applied, their assessed effectiveness, and any residual re-identification risks for transparency.',
 ARRAY['Privacy policy documents', 'De-identification decision records', 'Risk documentation']),

('MEASURE 2.10', 'si-19', 'Strong',
 'SI-19 de-identification directly addresses AI privacy risk by reducing the privacy exposure of personal data used in AI systems. Core control for managing the privacy risk identified in the MAP function.',
 'Evaluate de-identification effectiveness as a primary privacy risk metric for AI systems. Test de-identified training data against known re-identification attacks and linkage methods to ensure privacy protections hold under AI-specific threat models.',
 ARRAY['Privacy risk assessments', 'Re-identification test results', 'De-identification effectiveness reports']),

-- SI-19.4: Removal, Masking, Encryption, Hashing, or Replacement
('MEASURE 2.10', 'si-19.4', 'Strong',
 'SI-19(4) specifies concrete de-identification techniques (removal, masking, encryption, hashing, replacement) directly applicable to AI training data privacy protection. Provides implementation specificity beyond the base control for AI data preparation.',
 'Apply appropriate de-identification techniques based on AI use case: hashing for linkage preservation, masking for partial utility retention, removal for unnecessary fields, and encryption for data that must remain recoverable. Validate technique effectiveness for AI-specific re-identification risks.',
 ARRAY['Technique selection documentation', 'Privacy engineering records', 'Effectiveness validation reports']),

-- SI-20: Tainting
('MEASURE 2.7', 'si-20', 'Partial',
 'SI-20 tainting supports AI security and resilience evaluation by enabling detection of data exfiltration from AI systems including training data and model parameters. Novel approach to detecting AI data theft but not a comprehensive security assessment method.',
 'Embed watermarks or canary data in AI training datasets to detect unauthorized data extraction or model copying. Use tainting techniques to verify that AI model outputs do not inadvertently expose training data through memorization.',
 ARRAY['Data watermark records', 'Canary data configurations', 'Exfiltration detection logs']),

('MAP 1.1', 'si-20', 'Partial',
 'SI-20 tainting supports understanding of AI data provenance by embedding traceable markers in data that reveal how information flows through AI systems. Provides data lineage tracking but not the broader context understanding required by MAP 1.1.',
 'Use data tainting to track how training data flows through AI model development pipelines and into production inference. Embed provenance markers that enable audit trails from AI outputs back to source training data.',
 ARRAY['Data provenance markers', 'Pipeline flow tracking', 'Audit trail documentation']),

-- SI-21: Information Refresh
('MANAGE 3.2', 'si-21', 'Partial',
 'SI-21 information refresh supports pre-trained model monitoring by ensuring the data used by AI systems remains current and relevant. Addresses data freshness but not the broader model performance monitoring and assessment activities.',
 'Apply information refresh policies to AI model training data, reference datasets, and knowledge bases to prevent staleness. Define refresh schedules for AI data sources aligned with the rate of change in the problem domain.',
 ARRAY['Data refresh schedules', 'Staleness assessment reports', 'Update verification logs']),

('MAP 2.2', 'si-21', 'Partial',
 'SI-21 information refresh supports documentation of AI system knowledge limits by ensuring the currency of underlying data is tracked and understood. Addresses data timeliness but not the broader scientific understanding of model limitations.',
 'Document the refresh status of AI training data and reference datasets as a factor in understanding model knowledge limits. Flag AI systems operating on stale data and communicate currency limitations to users and stakeholders.',
 ARRAY['Data currency documentation', 'Knowledge limit disclosures', 'Refresh status dashboards']),

-- SI-22: Information Diversity
('MAP 1.1', 'si-22', 'Partial',
 'SI-22 information diversity supports diverse AI training data by requiring alternative information sources, reducing single-source dependencies. Addresses source diversity but not the broader deployment context understanding required by MAP 1.1.',
 'Use diverse data sources to reduce AI model bias and single-source dependency risks. Identify and document alternative data sources for critical AI training datasets to ensure representativeness and reduce the impact of any single source failure.',
 ARRAY['Data source inventory', 'Diversity assessment reports', 'Alternative source documentation']),

('MEASURE 2.1', 'si-22', 'Partial',
 'SI-22 data diversity supports AI fairness assessment by providing multiple information sources that can be compared for consistency and representativeness. Addresses source diversity measurement but not the full TEVV metrics framework.',
 'Measure training data diversity across demographic, geographic, and temporal dimensions as an AI fairness indicator. Compare outputs from models trained on diverse versus non-diverse data to quantify the impact of information diversity on fairness metrics.',
 ARRAY['Diversity metrics reports', 'Fairness comparison analysis', 'Data representativeness assessments']),

('MEASURE 2.11', 'si-22', 'Partial',
 'SI-22 information diversity supports fairness and bias evaluation by ensuring AI training data draws from multiple representative sources. Data diversity is a prerequisite for unbiased AI but does not guarantee fairness on its own.',
 'Assess whether information source diversity translates to demographic representativeness in AI training data. Track diversity metrics over time and correlate with fairness evaluation outcomes to measure the effectiveness of diversity initiatives.',
 ARRAY['Diversity tracking dashboards', 'Fairness correlation reports', 'Demographic representation analysis']),

-- SI-23: Information Fragmentation
('MEASURE 2.10', 'si-23', 'Partial',
 'SI-23 information fragmentation supports AI privacy risk management by breaking data into fragments stored across systems, making it harder to reconstruct complete personal profiles from AI training data. Novel privacy protection but adds complexity to AI data management.',
 'Apply data fragmentation strategies to sensitive AI training datasets so that no single system holds complete personal profiles. Design AI data architectures that separate identifying attributes from behavioral data used for model training.',
 ARRAY['Fragmentation architecture documents', 'Data separation configurations', 'Privacy engineering records']),

('GOVERN 1.1', 'si-23', 'Supportive',
 'SI-23 information fragmentation supports AI risk management policies by providing a privacy-by-design technique that can be incorporated into organizational AI data handling practices. Supportive technical mechanism rather than a direct policy control.',
 'Reference information fragmentation as an available privacy-by-design technique in AI data governance policies. Define when fragmentation is appropriate based on data sensitivity classifications and AI use case risk levels.',
 ARRAY['Data governance policies', 'Privacy-by-design documentation', 'Risk classification records'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
