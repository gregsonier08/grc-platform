-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — AU Family Crosswalk Mappings
-- Source: NIST AI 100-1 × NIST SP 800-53 Rev 5
-- 40 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
('GOVERN 1.1', 'au-1', 'Partial',
 'AU-1 establishes the audit and accountability policy framework that can incorporate AI-specific logging and monitoring requirements. Addresses the policy layer for audit accountability but not the full scope of AI-specific legal and risk tracking.',
 'Extend AU-1 policy to explicitly cover AI system audit requirements: what AI system events must be logged, retention periods for AI activity logs, and accountability for model decisions. Ensure audit policy addresses AI-specific scenarios such as model retraining events and automated decision logging.',
 ARRAY['Audit policy documents', 'Policy review records']),

('GOVERN 4.1', 'au-1', 'Supportive',
 'AU-1 policy and procedures establish the governance foundation for safety-first audit practices. System use audit requirements can reinforce responsible AI use culture.',
 'Incorporate AI system interaction audit requirements into AU-1 policy. Require logging of all consequential AI-assisted decisions as a safety measure. Policy should mandate review cadences for AI system audit logs.',
 ARRAY['Audit policy', 'Policy acknowledgments']),

('GOVERN 3.1', 'au-6', 'Supportive',
 'AU-6 audit record review and reporting can communicate AI risk levels to organizational personnel. Regular audit reporting creates awareness of AI system behavior patterns and anomalies.',
 'Configure audit record review to produce regular AI system behavior reports distributed to AI risk owners and relevant stakeholders. Use audit reporting to communicate AI system risk posture across the organization.',
 ARRAY['Audit review reports', 'Distribution records', 'Risk communication logs']),

('GOVERN 3.1', 'au-12', 'Supportive',
 'AU-12 audit record generation ensures AI system events are captured and available for risk reporting. Comprehensive event capture is a prerequisite for communicating AI risk levels.',
 'Configure AU-12 audit generation to capture AI system-specific events: inference requests, model updates, access to training data, and system configuration changes. Ensure generated records feed into risk reporting processes.',
 ARRAY['Audit configuration records', 'Event capture verification']),

('GOVERN 4.2', 'au-6', 'Supportive',
 'AU-6 audit record review enables teams to document and communicate AI system risk findings. Audit analysis surfaces patterns that should be documented and shared broadly.',
 'Use audit record review findings to populate AI risk documentation. Establish process for escalating significant audit findings to AI risk documentation. Share audit-derived risk insights with affected teams.',
 ARRAY['Audit review reports', 'Risk documentation', 'Communication records']),

('GOVERN 5.2', 'au-16', 'Supportive',
 'AU-16 cross-organizational audit logging enables sharing of AI system behavior data across organizational boundaries. Supports mechanisms for incorporating external AI actor feedback through shared observability.',
 'Implement cross-organizational audit logging for AI systems shared with partners or external AI actors. Use shared audit data to identify patterns reported by external stakeholders. Establish feedback loops from cross-org audit findings into AI system design.',
 ARRAY['Cross-org audit agreements', 'Shared audit logs', 'Feedback integration records']),

('MEASURE 1.1', 'au-6', 'Supportive',
 'AU-6 audit record review and reporting informs selection of AI risk metrics by revealing what behaviors and events are observable and measurable. Audit analysis identifies which risk indicators have data support.',
 'Use audit record analysis to identify candidate AI risk metrics — events that are both meaningful and measurable via existing logging. Ensure selected metrics align with what can be reliably captured in audit records.',
 ARRAY['Audit analysis reports', 'Metric selection documentation']),

('MEASURE 1.1', 'au-7', 'Supportive',
 'AU-7 audit record reduction and report generation provides the analytical infrastructure for distilling AI risk metrics from raw audit data. Reporting capabilities are foundational for operationalizing risk measurement.',
 'Configure AU-7 report generation to produce AI-specific risk metric summaries from audit logs. Automate extraction of key AI performance indicators from audit data. Ensure report generation supports the measurement approaches selected for AI risk.',
 ARRAY['Audit report templates', 'Metric reports', 'Report generation configuration']),

('MEASURE 1.2', 'au-6', 'Partial',
 'AU-6 regular audit review processes directly support the ongoing assessment of AI metric effectiveness and existing control performance. Scheduled audit reviews create the cadence for reassessing measurement approaches.',
 'Establish regular AU-6 review cycles that include assessment of AI monitoring metric effectiveness. Use audit findings to identify metrics that are under- or over-sensitive. Update measurement approaches based on audit review insights.',
 ARRAY['Periodic audit review records', 'Metric effectiveness assessments', 'Control performance reports']),

('MEASURE 2.1', 'au-3', 'Supportive',
 'AU-3 content of audit records defines what data is captured during AI system testing and evaluation activities. Rich audit record content enables reconstruction of TEVV test conditions and results.',
 'Define AU-3 audit record content requirements to capture AI TEVV metadata: test configuration, model version under test, test data provenance, and evaluator identity. Ensure audit records provide sufficient detail to reconstruct test conditions for review.',
 ARRAY['Audit record content specification', 'TEVV audit logs', 'Test documentation']),

('MEASURE 2.4', 'au-2', 'Strong',
 'AU-2 event logging configuration determines which AI system behaviors and events are captured for production monitoring. Defining the right events to log is foundational to monitoring AI system functionality in deployment.',
 'Define AI-specific event logging requirements: inference requests and responses (sampled), model version changes, performance metric threshold crossings, anomalous output patterns, and data pipeline events. Ensure AU-2 event definitions cover the AI system behaviors most critical to safety and performance monitoring.',
 ARRAY['Event logging specification', 'Audit configuration', 'Monitoring coverage review']),

('MEASURE 2.4', 'au-3', 'Partial',
 'AU-3 defines the content richness of audit records that enable AI system behavior analysis. Detailed record content is necessary for meaningful analysis of AI system functionality in production.',
 'Require AU-3 audit records for AI systems to include: request context, model version, confidence scores (where applicable), processing latency, and output category. Richer record content enables more granular analysis of AI behavior patterns.',
 ARRAY['Audit record specification', 'Sample audit records', 'Content completeness review']),

('MEASURE 2.4', 'au-6', 'Strong',
 'AU-6 audit record review and analysis is the primary mechanism for monitoring AI system functionality and behavior in production. Regular review of AI system audit logs identifies behavioral drift, anomalies, and performance issues.',
 'Establish AI-specific AU-6 review processes: automated alerting for anomalous patterns, periodic human review of AI output distributions, and trend analysis for key performance indicators. Ensure audit review frequency matches the AI system risk level.',
 ARRAY['Audit review reports', 'AI behavior analysis', 'Anomaly detection logs', 'Performance trend reports']),

('MEASURE 2.4', 'au-8', 'Supportive',
 'AU-8 time stamps ensure AI system audit records are temporally ordered and correlated, enabling accurate reconstruction of AI system behavior sequences for analysis.',
 'Ensure synchronized time stamps across all AI system components: data ingestion, model inference, output delivery, and downstream logging. Time stamp accuracy is critical for correlating AI behavior events across distributed components.',
 ARRAY['Time synchronization config', 'Audit record timestamps', 'NTP configuration']),

('MEASURE 2.4', 'au-12', 'Strong',
 'AU-12 audit record generation ensures AI system events are systematically captured from all relevant components. Comprehensive generation coverage is essential for complete production monitoring.',
 'Configure AU-12 to generate audit records from all AI system components: API endpoints, model serving infrastructure, data pipelines, and monitoring dashboards. Verify audit generation completeness against AI system architecture diagram.',
 ARRAY['Audit generation configuration', 'Coverage verification', 'Component inventory']),

('MEASURE 2.4', 'au-14', 'Supportive',
 'AU-14 session audit capability enables capture of complete AI system interaction sessions, providing richer context for behavior analysis than individual event records alone.',
 'Consider AU-14 session-level audit for high-consequence AI systems where individual events lack sufficient context. Session audit of AI system usage can reveal patterns not visible at the individual transaction level.',
 ARRAY['Session audit configuration', 'Session audit records']),

('MEASURE 2.5', 'au-8', 'Supportive',
 'AU-8 time stamps provide the temporal integrity needed to verify that AI system TEVV testing was conducted in a controlled, reproducible sequence. Reliable timestamps are required for valid TEVV evidence.',
 'Ensure time stamp integrity for all AI TEVV test records. Synchronized timestamps enable ordering of test events, correlation with system state, and verification that test conditions were consistent.',
 ARRAY['TEVV audit timestamps', 'Time synchronization records']),

('MEASURE 2.5', 'au-9', 'Supportive',
 'AU-9 protection of audit information safeguards the TEVV evidence that demonstrates AI system validity and reliability. Tamper-evident audit records preserve the integrity of test results.',
 'Apply AU-9 protections to all TEVV audit records: write-once storage, cryptographic integrity verification, and access controls preventing modification. Protected test records provide defensible evidence of AI system validation.',
 ARRAY['Audit protection configuration', 'Integrity verification logs', 'Access control records']),

('MEASURE 2.5', 'au-11', 'Supportive',
 'AU-11 audit record retention ensures TEVV evidence is preserved for the duration needed to support AI system operation and post-deployment reviews. Adequate retention enables retrospective analysis of validation conditions.',
 'Define AI TEVV audit record retention periods aligned with AI system deployment lifecycle. Retain TEVV records for at least the operational life of the system. Ensure retention covers regulatory or contractual requirements for AI validation evidence.',
 ARRAY['Retention policy', 'TEVV record inventory', 'Retention verification']),

('MEASURE 2.7', 'au-9', 'Supportive',
 'AU-9 protection of audit information contributes to AI system security by preventing tampering with the monitoring records that detect security incidents. Integrity of security-related audit data is fundamental to AI system security posture.',
 'Apply AU-9 protections specifically to AI system security audit records: model access logs, API authentication events, and anomaly detection alerts. Ensure security audit records cannot be modified by the AI system or its administrators.',
 ARRAY['Audit protection policy', 'Security audit integrity verification']),

('MEASURE 2.7', 'au-13', 'Supportive',
 'AU-13 monitoring for information disclosure directly supports AI system security by detecting unauthorized disclosure of model outputs, training data, or system architecture information.',
 'Configure AU-13 monitoring for AI-specific disclosure risks: model inversion attempts, unusual output volumes that may indicate data exfiltration, and unauthorized access to model artifacts. Alert on patterns suggesting adversarial probing.',
 ARRAY['Disclosure monitoring configuration', 'Alert logs', 'Anomaly reports']),

('MEASURE 2.8', 'au-3', 'Partial',
 'AU-3 content of audit records directly supports transparency and accountability requirements by ensuring AI system decisions and actions are captured with sufficient detail for review. Rich record content enables accountability attribution.',
 'Define AU-3 content requirements for AI accountability: decision inputs, model version, confidence or probability outputs, override events, and human-in-the-loop actions. Ensure records support both internal accountability reviews and potential external audits.',
 ARRAY['Audit content specification', 'Accountability audit records', 'Review documentation']),

('MEASURE 2.8', 'au-9', 'Partial',
 'AU-9 protection of audit information preserves the integrity of records needed to demonstrate AI system transparency and accountability. Tamper-evident records are a prerequisite for trustworthy accountability.',
 'Protect AI accountability audit records with cryptographic integrity verification. Ensure audit records documenting AI decision rationale cannot be modified retroactively. Implement write-once storage for high-consequence AI decision logs.',
 ARRAY['Audit integrity controls', 'Cryptographic verification logs']),

('MEASURE 2.8', 'au-10', 'Partial',
 'AU-10 non-repudiation directly supports AI system accountability by ensuring AI-assisted decisions and actions cannot be denied after the fact. Non-repudiation is foundational for accountability frameworks.',
 'Implement AU-10 non-repudiation for consequential AI-assisted decisions: bind decision records to authenticated user identities, model versions, and input data hashes. Ensure AI system operators cannot deny having initiated or approved AI actions.',
 ARRAY['Non-repudiation implementation docs', 'Decision audit trails', 'Cryptographic binding records']),

('MEASURE 3.1', 'au-2', 'Partial',
 'AU-2 event logging configuration establishes what AI system events are tracked, which is foundational to maintaining approaches for identifying and tracking AI risks. The events defined for logging determine what risks can be detected.',
 'Define AI risk-relevant events in AU-2 configuration: performance degradation indicators, data distribution shifts, output anomalies, and security events. Ensure event logging coverage aligns with identified AI risk categories.',
 ARRAY['Event logging policy', 'Risk-event mapping', 'Coverage verification']),

('MEASURE 3.1', 'au-6', 'Partial',
 'AU-6 audit record review and analysis is a primary mechanism for identifying and tracking AI risks over time. Systematic review of AI system logs enables ongoing risk identification as the system evolves.',
 'Establish AU-6 review processes specifically for AI risk tracking: periodic review cadences, risk indicator trending, comparison against established baselines, and escalation procedures for newly identified risks.',
 ARRAY['Audit review schedule', 'Risk tracking reports', 'Trend analysis']),

('MEASURE 3.2', 'au-6', 'Supportive',
 'AU-6 audit review provides monitoring capability for AI risk scenarios that are difficult to quantify directly. Qualitative analysis of audit records can track risk indicators in settings where formal metrics are unavailable.',
 'Apply qualitative AU-6 review methods for AI risk dimensions that lack established metrics. Use expert analyst review of audit logs to track emerging risk patterns before formal metrics are available.',
 ARRAY['Expert review records', 'Qualitative risk assessments', 'Emerging risk documentation']),

('MEASURE 3.3', 'au-6', 'Supportive',
 'AU-6 audit record analysis can be used to identify patterns in system behavior that correspond to issues reported by end users, supporting feedback integration into AI system evaluation.',
 'Cross-reference end user problem reports with AU-6 audit analysis to confirm or investigate reported issues. Use audit data to validate user feedback, identify systemic patterns, and prioritize issues for remediation.',
 ARRAY['Feedback correlation reports', 'Audit-confirmed issue logs']),

('MEASURE 4.1', 'au-6', 'Partial',
 'AU-6 audit record review connects AI system measurement activities to organizational risk management by providing the monitoring data that informs risk tolerance assessments and management decisions.',
 'Ensure AU-6 AI monitoring outputs are connected to organizational risk management processes. Route significant audit findings to risk owners and decision-makers. Establish thresholds that trigger formal risk management review.',
 ARRAY['Risk escalation procedures', 'Audit-to-risk management workflow', 'Escalation records']),

('MEASURE 4.1', 'au-7', 'Supportive',
 'AU-7 audit record reduction and report generation aggregates monitoring data into summaries that connect AI system measurement to organizational risk management reporting.',
 'Configure AU-7 to generate AI risk management dashboards and reports aligned with organizational risk reporting cadences. Ensure synthesized reports are suitable for risk owner consumption and decision-making.',
 ARRAY['Risk report templates', 'Audit summary reports', 'Management dashboards']),

('MEASURE 4.2', 'au-6', 'Supportive',
 'AU-6 audit review with domain expert involvement validates that AI system measurement results reflect intended performance. Expert review of audit records can confirm or challenge automated measurement interpretations.',
 'Include domain experts in AU-6 review processes for AI systems. Expert-reviewed audit analysis validates whether automated measurement tools are correctly interpreting AI system behavior.',
 ARRAY['Expert review participation records', 'Validated measurement reports']),

('MEASURE 4.3', 'au-6', 'Partial',
 'AU-6 ongoing audit record review and analysis enables identification of measurable performance improvements or declines over time. Historical audit data provides the baseline for measuring change.',
 'Use longitudinal AU-6 analysis to track AI system performance trends. Document measurable improvements and declines identified through audit review. Correlate performance changes with system updates, retraining events, or environmental changes.',
 ARRAY['Performance trend analysis', 'Audit-based improvement records', 'Historical comparison reports']),

('MANAGE 4.1', 'au-2', 'Partial',
 'AU-2 event logging is a foundational component of post-deployment AI system monitoring. Defining appropriate events to log enables the monitoring plan required for post-deployment oversight.',
 'Ensure AU-2 event definitions are reviewed and updated as part of post-deployment monitoring plan implementation. Include AI-specific events in logging scope: inference requests, model performance metrics, data drift indicators, and override events.',
 ARRAY['Post-deployment monitoring plan', 'Event logging specification', 'Monitoring coverage review']),

('MANAGE 4.1', 'au-6', 'Partial',
 'AU-6 audit record review implements the monitoring analysis component of post-deployment AI system monitoring plans. Systematic review of AI system logs is the primary mechanism for detecting performance issues and incidents.',
 'Implement AU-6 review as the analysis layer of post-deployment AI monitoring. Define review frequency based on AI system risk level, automate initial analysis, and establish human review for anomalies and escalations.',
 ARRAY['Post-deployment monitoring plan', 'Audit review procedures', 'Review frequency documentation']),

('MANAGE 4.1', 'au-11', 'Supportive',
 'AU-11 audit record retention ensures the monitoring record needed for post-deployment review, appeal, and decommissioning decisions is preserved throughout the AI system lifecycle.',
 'Define AI system audit record retention periods that cover: operational life of the system, appeal or review periods for AI decisions, and any regulatory retention requirements. Ensure records are accessible for post-deployment lifecycle decisions.',
 ARRAY['Retention policy', 'Lifecycle documentation']),

('MANAGE 4.1', 'au-12', 'Partial',
 'AU-12 audit record generation ensures that all components of a deployed AI system produce the monitoring data needed for post-deployment oversight and incident response.',
 'Verify AU-12 audit generation completeness across all deployed AI system components. Include generation requirements in post-deployment monitoring plan. Test that audit generation remains active across system updates and scaling events.',
 ARRAY['Generation verification records', 'Post-deployment audit coverage']),

('MANAGE 4.2', 'au-6', 'Partial',
 'AU-6 audit review and analysis can identify opportunities for continual improvement of deployed AI systems. Systematic monitoring reveals patterns that suggest targeted system improvements.',
 'Use AU-6 analysis findings to drive AI system improvement activities. Document improvement opportunities identified through audit review and track their implementation. Connect audit findings to the AI system update and retraining cycle.',
 ARRAY['Improvement opportunity log', 'Audit-driven updates', 'Improvement tracking records']),

('MANAGE 4.3', 'au-6', 'Partial',
 'AU-6 audit record review enables identification and initial analysis of AI system incidents and errors. Systematic review processes support timely detection and documentation of incidents for communication.',
 'Use AU-6 to detect AI system incidents: define alert thresholds, establish incident review procedures, and document confirmed incidents. Ensure AU-6 findings feed into incident communication and tracking processes.',
 ARRAY['Incident detection procedures', 'Audit-confirmed incidents', 'Communication records']),

('MANAGE 4.3', 'au-10', 'Supportive',
 'AU-10 non-repudiation supports incident response by ensuring that records of AI system errors and incidents are attributable and cannot be disputed after the fact.',
 'Apply AU-10 non-repudiation to AI system incident records. Ensure incident logs include authenticated attribution so that the sequence of events, responsible parties, and system states during incidents are definitively established.',
 ARRAY['Non-repudiation implementation', 'Incident attribution records']),

('MANAGE 4.3', 'au-12', 'Partial',
 'AU-12 audit record generation captures the incident and error events that must be communicated to relevant AI actors. Comprehensive generation coverage ensures incidents are not missed due to logging gaps.',
 'Configure AU-12 to generate records for all AI system error conditions, threshold violations, and anomalous events. Ensure incident-relevant events are generated with sufficient detail to support root cause analysis and communication.',
 ARRAY['Error event logging config', 'Incident audit records']);

-- Total rows inserted: 40
