-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — CA Family Crosswalk Mappings
-- Source: NIST AI 100-1 × NIST SP 800-53 Rev 5
-- 36 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
('GOVERN 1.3', 'ca-1', 'Supportive',
 'CA-1 establishes the assessment and authorization policy framework that supports risk-based decision-making processes. Assessment policies can be extended to address AI-specific risk tolerance determinations.',
 'Extend CA-1 policy to define assessment requirements specific to AI systems, including criteria for what level of risk management activity is required based on AI system impact classification.',
 ARRAY['Assessment policy', 'AI risk classification documentation']),

('GOVERN 4.2', 'ca-5', 'Supportive',
 'CA-5 Plan of Action and Milestones provides the documentation mechanism for teams to record identified AI risks and track their communication. POA&M entries can capture AI risk findings and their disposition.',
 'Use CA-5 POA&M entries to document AI risks identified during assessments and track their communication to relevant teams. Include risk severity, affected stakeholders, and communication status in each entry.',
 ARRAY['POA&M records', 'Risk communication tracking']),

('GOVERN 5.2', 'ca-5', 'Partial',
 'CA-5 POA&M provides a structured mechanism for tracking incorporation of feedback from AI actors into system improvements. Remediation items can represent feedback-driven design changes.',
 'Create CA-5 POA&M entries for substantive feedback received from AI actors that requires system design changes. Track feedback incorporation progress, responsible parties, and completion milestones.',
 ARRAY['POA&M entries', 'Feedback tracking records', 'Design change documentation']),

('MEASURE 1.2', 'ca-7', 'Direct',
 'CA-7 continuous monitoring directly addresses the need for ongoing assessment of AI metric appropriateness and control effectiveness. The continuous monitoring program is the operational implementation of regular metric reassessment.',
 'Integrate AI system metrics into the CA-7 continuous monitoring program. Define monitoring objectives for each AI risk dimension, establish monitoring frequencies based on risk level, and include metric reassessment triggers in the monitoring plan.',
 ARRAY['Continuous monitoring plan', 'Monitoring strategy', 'Metric reassessment records']),

('MEASURE 1.3', 'ca-2', 'Direct',
 'CA-2 control assessments directly require involvement of assessors who are independent of system development, which maps precisely to the MEASURE 1.3 requirement for internal experts and independent assessors in AI system evaluation.',
 'Structure CA-2 AI system assessments to include personnel independent of the AI development team. Define assessor qualifications for AI-specific assessment activities. Document the independence and expertise of personnel conducting AI system evaluations.',
 ARRAY['Assessment plan', 'Assessor qualifications', 'Independence verification', 'Assessment report']),

('MEASURE 1.3', 'ca-8', 'Partial',
 'CA-8 penetration testing uses independent specialists to evaluate system security, directly supporting the MEASURE 1.3 requirement for independent assessors in AI system evaluation — particularly for security and adversarial robustness.',
 'Include AI-specific adversarial testing in CA-8 scope: prompt injection, model inversion, membership inference, and evasion attacks. Engage independent specialists with AI security expertise.',
 ARRAY['Penetration test plan', 'Independent assessor records', 'AI adversarial test results']),

('MEASURE 2.3', 'ca-2', 'Partial',
 'CA-2 control assessments provide a structured framework for measuring AI system performance and demonstrating it meets assurance criteria. Assessment methodology can be applied to AI-specific performance dimensions.',
 'Include AI performance measurement in CA-2 assessment scope: accuracy metrics, performance under distribution shift, latency, and reliability. Document assessment methods and demonstrate performance against defined criteria.',
 ARRAY['Assessment methodology', 'Performance measurement records', 'Assurance criteria documentation']),

('MEASURE 2.5', 'ca-2', 'Partial',
 'CA-2 control assessments provide the systematic evaluation framework for demonstrating AI system validity and reliability. Structured assessments generate the evidence that the AI system has been tested against defined criteria.',
 'Apply CA-2 assessment processes to AI TEVV: define assessment objectives for validity and reliability, conduct structured evaluations, document findings, and produce assessment reports that constitute TEVV evidence.',
 ARRAY['Assessment plan', 'TEVV assessment report', 'Validity and reliability evidence']),

('MEASURE 2.6', 'ca-2', 'Partial',
 'CA-2 security-focused control assessments contribute to examination of AI system safety by evaluating security controls that prevent unsafe AI behaviors. Safety and security are interrelated for AI systems.',
 'Include safety-related controls in CA-2 assessment scope for AI systems: input validation, output filtering, rate limiting, and override mechanisms. Assess whether safety controls function as designed.',
 ARRAY['Safety-focused assessment report', 'Control effectiveness findings']),

('MEASURE 2.6', 'ca-8', 'Partial',
 'CA-8 penetration testing examines AI system resilience against adversarial conditions, which directly informs the safety examination required. Adversarial testing reveals failure modes that affect safety.',
 'Conduct adversarial testing of AI systems specifically targeting safety-critical failure modes: manipulation of inputs to induce harmful outputs, bypassing safety filters, and exploiting model behavior at distribution boundaries.',
 ARRAY['Adversarial test plan', 'Safety test results', 'Penetration test report']),

('MEASURE 2.7', 'ca-2', 'Partial',
 'CA-2 security assessments directly address evaluation of AI system security posture. Structured security assessments produce the documented evaluation of AI security and resilience required.',
 'Scope CA-2 assessments to cover AI-specific security risks: model theft, adversarial attacks, data poisoning, and inference attacks. Document security control effectiveness and residual security risks.',
 ARRAY['Security assessment report', 'AI security findings', 'Residual risk documentation']),

('MEASURE 2.7', 'ca-8', 'Strong',
 'CA-8 penetration testing is a primary mechanism for evaluating AI system security and resilience against active adversarial threats. Penetration testing directly demonstrates security and resilience under realistic attack conditions.',
 'Conduct penetration testing of AI system interfaces and infrastructure: API endpoints, model serving infrastructure, training data pipelines, and administrative interfaces. Include AI-specific attack vectors in scope. Document resilience findings.',
 ARRAY['Penetration test results', 'Security resilience report', 'Remediation plan']),

('MEASURE 2.10', 'ca-2', 'Partial',
 'CA-2 assessments can be scoped to evaluate privacy-related controls for AI systems, contributing to examination of AI privacy risk. Privacy control assessments assess whether privacy protections function as designed.',
 'Include privacy control evaluation in CA-2 AI assessments: consent mechanisms, data minimization controls, de-identification processes, and access controls on personal data used for training or inference.',
 ARRAY['Privacy control assessment', 'Privacy findings report']),

('MEASURE 2.11', 'ca-2', 'Supportive',
 'CA-2 assessments can include evaluation of bias and fairness controls as part of AI system trustworthiness assessment. Structured assessment processes can be applied to fairness metrics and bias mitigation measures.',
 'Include fairness and bias evaluation in CA-2 AI system assessments: assess whether bias testing was conducted, whether bias mitigation controls are in place and effective, and whether fairness criteria are measurable.',
 ARRAY['Fairness assessment records', 'Bias evaluation findings']),

('MEASURE 2.13', 'ca-2', 'Partial',
 'CA-2 assessments can be applied to evaluate the effectiveness of TEVV processes themselves, not just the AI system outcomes. Meta-assessment of evaluation methods is a legitimate CA-2 scope extension.',
 'Conduct periodic CA-2 assessments of AI TEVV processes: evaluate whether test sets are representative, metrics are appropriate, and validation methods are sound. Document findings and update TEVV approaches accordingly.',
 ARRAY['TEVV process assessment', 'Meta-evaluation records', 'Process improvement documentation']),

('MEASURE 3.1', 'ca-7', 'Partial',
 'CA-7 continuous monitoring directly implements approaches for tracking AI risks over time. The continuous monitoring program is the operational framework for ongoing AI risk identification and tracking.',
 'Integrate AI risk tracking into the CA-7 continuous monitoring program. Define monitoring indicators for each major AI risk category, establish escalation thresholds, and maintain risk tracking dashboards connected to monitoring outputs.',
 ARRAY['Continuous monitoring plan', 'Risk tracking dashboard', 'Monitoring indicators']),

('MEASURE 3.2', 'ca-7', 'Supportive',
 'CA-7 continuous monitoring provides a framework for tracking AI risks in settings where formal metrics are not yet available. Monitoring can include qualitative observation and expert review in addition to automated metrics.',
 'Adapt CA-7 monitoring to handle AI risk categories that lack quantitative metrics: include expert review cycles, qualitative assessment checkpoints, and placeholder monitoring indicators for emerging risk areas.',
 ARRAY['Adapted monitoring plan', 'Qualitative monitoring records']),

('MEASURE 4.1', 'ca-7', 'Partial',
 'CA-7 continuous monitoring directly connects AI system measurement to organizational risk management by providing the ongoing data stream that informs risk management decisions. Monitoring results feed the organizational risk picture.',
 'Ensure CA-7 monitoring outputs are routed to organizational risk management processes. Connect AI monitoring dashboards to risk management reporting. Define escalation criteria that trigger formal risk management review.',
 ARRAY['Monitoring-to-risk workflow', 'Risk management reports', 'Escalation criteria documentation']),

('MEASURE 4.2', 'ca-2', 'Partial',
 'CA-2 assessments involve domain experts and independent reviewers who validate that measurement approaches are appropriate. The assessment process is a mechanism for engaging relevant expertise in evaluating AI measurement results.',
 'Ensure CA-2 AI assessments include domain experts relevant to the AI application: clinical experts for healthcare AI, financial experts for FinTech AI, etc. Document expert involvement and their input on measurement result interpretation.',
 ARRAY['Assessor qualifications', 'Expert involvement records', 'Measurement validation findings']),

('MEASURE 4.3', 'ca-5', 'Partial',
 'CA-5 POA&M directly tracks measurable improvement activities and their completion status. POA&M entries represent documented improvement commitments with measurable completion criteria.',
 'Use CA-5 POA&M to track AI system improvement activities identified through measurement. Each POA&M entry should include measurable success criteria, responsible parties, and target completion dates. Report POA&M progress to AI risk stakeholders.',
 ARRAY['POA&M records', 'Improvement tracking reports', 'Completion evidence']),

('MEASURE 4.3', 'ca-7', 'Partial',
 'CA-7 continuous monitoring enables detection of measurable performance improvements or declines over time. Trend analysis in monitoring data identifies when improvements take effect or when performance degrades.',
 'Use CA-7 monitoring trend analysis to document AI system performance changes. Correlate performance trends with system updates, retraining events, and remediation activities. Produce periodic performance change reports.',
 ARRAY['Performance trend reports', 'Monitoring trend analysis', 'Change correlation records']),

('MANAGE 1.1', 'ca-2', 'Strong',
 'CA-2 control assessments provide the structured evaluation needed to determine whether an AI system achieves its intended purposes and whether deployment should proceed. Assessments produce evidence for deployment authorization decisions.',
 'Conduct CA-2 assessments specifically designed to evaluate AI system achievement of intended purposes: performance against defined success criteria, stakeholder requirements, and intended use cases. Assessment findings directly inform deployment go/no-go decisions.',
 ARRAY['Go/no-go assessment report', 'Purpose achievement evaluation', 'Deployment decision documentation']),

('MANAGE 1.1', 'ca-6', 'Direct',
 'CA-6 authorization directly implements the governance decision about whether an AI system should proceed to deployment. The authorization process is the formal determination of whether AI system development or deployment should proceed.',
 'Implement formal AI system authorization using CA-6 processes: define authorization criteria, conduct pre-authorization assessment, make formal authorization decision, and document authorization conditions and limitations.',
 ARRAY['Authorization package', 'Authorization decision', 'Deployment conditions documentation']),

('MANAGE 1.2', 'ca-2', 'Partial',
 'CA-2 assessments produce findings that should be prioritized for risk treatment. Assessment reports establish the evidential basis for prioritizing AI risks based on assessed likelihood and impact.',
 'Structure CA-2 AI assessment reports to include risk prioritization: rank findings by severity, likelihood, and available remediation options. Use assessment findings as the input to formal risk treatment prioritization decisions.',
 ARRAY['Risk-prioritized assessment findings', 'Treatment prioritization records']),

('MANAGE 1.2', 'ca-6', 'Partial',
 'CA-6 authorization conditions can reflect risk prioritization decisions by requiring remediation of higher-priority risks before or after authorization. Authorization with conditions operationalizes risk treatment prioritization.',
 'Use CA-6 authorization conditions to enforce risk treatment priorities: require remediation of high-severity findings before authorization, and specify post-authorization remediation timelines for lower-severity findings.',
 ARRAY['Authorization conditions', 'Risk priority documentation']),

('MANAGE 1.3', 'ca-5', 'Strong',
 'CA-5 Plan of Action and Milestones is the primary mechanism for documenting planned risk responses. POA&M entries capture risk response plans, responsible parties, resources, and target completion dates.',
 'Create CA-5 POA&M entries for each identified AI risk requiring response treatment. Include response approach (mitigate, transfer, avoid, accept), specific remediation steps, responsible owners, resource requirements, and milestones.',
 ARRAY['POA&M records', 'Risk response plans', 'Milestone tracking']),

('MANAGE 1.3', 'ca-6', 'Partial',
 'CA-6 authorization conditions specify risk responses required as conditions of AI system deployment. Authorization conditions operationalize risk response planning by creating binding commitments to specific risk treatments.',
 'Document authorization conditions as formal risk response commitments. Track condition fulfillment as risk treatment completion. Use authorization renewal or condition modification to adapt risk responses as conditions change.',
 ARRAY['Authorization conditions', 'Condition fulfillment records']),

('MANAGE 1.4', 'ca-5', 'Strong',
 'CA-5 POA&M documents all known unmitigated risks including residual risks after treatment. Open POA&M items represent the residual risk that has not yet been addressed, serving as documentation of negative residual risks.',
 'Maintain CA-5 POA&M entries for all accepted or unresolved AI risks. Clearly distinguish between risks accepted with explicit rationale and risks pending remediation. Share residual risk documentation with downstream AI system acquirers and end users.',
 ARRAY['POA&M residual risk entries', 'Risk acceptance documentation', 'Residual risk communication records']),

('MANAGE 1.4', 'ca-6', 'Partial',
 'CA-6 authorization documentation records the residual risks accepted as conditions of AI system authorization. Authorization with known residual risks documents the organizations acceptance of those risks.',
 'Document residual risks in CA-6 authorization packages. Include risk acceptance rationale, mitigating factors, and notification to downstream parties of accepted risks. Update authorization when residual risk profile changes significantly.',
 ARRAY['Authorization documentation', 'Residual risk acceptance records']),

('MANAGE 2.1', 'ca-5', 'Supportive',
 'CA-5 POA&M includes resource estimates for remediation activities, providing visibility into the resources needed to manage AI risks. POA&M resource requirements inform AI risk management resource planning.',
 'Include resource estimates (personnel hours, tooling costs, schedule impacts) in CA-5 POA&M entries for AI risk remediation. Use aggregate POA&M resource requirements to inform AI risk management resource allocation decisions.',
 ARRAY['POA&M resource estimates', 'Resource planning documentation']),

('MANAGE 2.3', 'ca-5', 'Supportive',
 'CA-5 POA&M provides the documentation mechanism for tracking response and recovery from newly identified AI risks. New POA&M entries capture unknown risks as they are discovered and track their remediation.',
 'Create CA-5 POA&M entries promptly when new AI risks are identified. Include initial risk characterization, interim mitigation measures, and planned permanent remediation. Track progress through the POA&M process.',
 ARRAY['New risk POA&M entries', 'Interim mitigation records', 'Unknown risk tracking']),

('MANAGE 2.3', 'ca-7', 'Partial',
 'CA-7 continuous monitoring enables detection of previously unknown AI risks as they emerge in production. Monitoring provides the early warning needed to activate risk response procedures.',
 'Configure CA-7 monitoring to detect indicators of new or unanticipated AI risks: unusual output distributions, unexpected failure modes, novel error patterns, and anomalous system behavior. Connect monitoring alerts to risk response procedures.',
 ARRAY['Monitoring alert configuration', 'New risk detection records', 'Response activation documentation']),

('MANAGE 4.2', 'ca-5', 'Strong',
 'CA-5 POA&M directly tracks measurable improvement activities with milestones, completion criteria, and responsible parties. The POA&M process operationalizes continual improvement by maintaining a structured list of planned enhancements.',
 'Use CA-5 POA&M as the primary tracking mechanism for AI system continual improvement activities. Define measurable completion criteria for each improvement item. Report POA&M progress at regular intervals to relevant AI stakeholders.',
 ARRAY['POA&M improvement entries', 'Progress tracking reports', 'Completion evidence']),

('MANAGE 4.2', 'ca-7', 'Partial',
 'CA-7 continuous monitoring provides the data needed to identify improvement opportunities and measure the effectiveness of improvements after implementation. Monitoring enables evidence-based improvement cycles.',
 'Use CA-7 monitoring data to identify improvement opportunities and measure improvement effectiveness. Establish pre/post monitoring comparisons for each improvement activity. Integrate monitoring insights into regular AI system improvement planning.',
 ARRAY['Improvement opportunity analysis', 'Pre/post monitoring comparison', 'Improvement effectiveness metrics']),

('MANAGE 4.3', 'ca-5', 'Partial',
 'CA-5 POA&M provides the tracking mechanism for incidents, errors, and their recovery status. Each significant AI system incident can be represented as a POA&M entry with remediation tracking.',
 'Create CA-5 POA&M entries for significant AI system incidents. Track incident status, remediation progress, and communication activities. Use POA&M to document root cause findings and preventive measures.',
 ARRAY['Incident POA&M entries', 'Remediation tracking', 'Root cause documentation']),

('MANAGE 4.3', 'ca-7', 'Partial',
 'CA-7 continuous monitoring detects AI system incidents and errors that must be communicated to relevant actors. Monitoring is the detection layer for the incident identification and communication process.',
 'Configure CA-7 to detect AI system incident conditions: performance threshold violations, error rate spikes, safety filter activations, and system anomalies. Route monitoring alerts to incident communication processes.',
 ARRAY['Incident detection configuration', 'Monitoring-to-incident workflow', 'Alert routing records']);

-- Total rows inserted: 36
