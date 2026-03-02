-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — CP Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 CP controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- CP-1: Policy and Procedures
('GOVERN 1.1', 'cp-1', 'Partial',
 'CP-1 establishes the contingency planning policy framework that can incorporate AI-specific continuity and resilience requirements for model serving, training pipelines, and inference infrastructure. Addresses the policy layer for continuity but not the full scope of AI risk management policies.',
 'Extend CP-1 policy to require contingency planning for AI systems including model serving availability, training pipeline recovery, inference fallback strategies, and AI-specific recovery time objectives based on decision criticality.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'cp-1', 'Partial',
 'CP-1 procedures define organizational contingency processes that support AI risk tolerance through documented recovery and degradation procedures for AI systems. Addresses contingency process discipline but not AI-specific risk tolerance determination.',
 'Define contingency procedures for AI system failures including model degradation response, training pipeline interruption recovery, and graceful degradation protocols for inference services. Establish AI-specific recovery procedures that account for model state, data pipeline continuity, and inference quality thresholds.',
 ARRAY['Policy documents', 'CP procedure documentation', 'AI recovery procedure definitions']),

-- CP-2: Contingency Plan
('MANAGE 2.2', 'cp-2', 'Strong',
 'CP-2 contingency plans directly support AI system resilience by requiring documented recovery strategies for system disruptions that include AI model failures, training pipeline outages, and inference service degradation. Core continuity control for maintaining AI system value during adverse events.',
 'Develop contingency plans for AI systems covering model serving failures, training data corruption, inference quality degradation, and complete AI system outages. Include AI-specific recovery strategies such as model version rollback procedures, fallback to simpler models, rule-based alternatives, and human-in-the-loop escalation during AI unavailability.',
 ARRAY['Contingency plans', 'AI recovery strategy documentation', 'Fallback procedure specifications']),

('MANAGE 4.1', 'cp-2', 'Partial',
 'CP-2 contingency planning supports AI risk treatment by preparing recovery actions for identified AI system risks before they materialize. Addresses recovery preparation but not the risk treatment decision-making process itself.',
 'Include AI-specific recovery procedures in contingency plans addressing scenarios such as adversarial model compromise, training data poisoning recovery, and inference pipeline failure. Define recovery priorities for AI systems based on the criticality of decisions they inform and the availability of manual alternatives.',
 ARRAY['AI contingency procedures', 'Recovery priority documentation', 'Risk scenario coverage records']),

('GOVERN 6.2', 'cp-2', 'Partial',
 'CP-2 contingency planning supports contingency processes for third-party AI failures by documenting recovery actions when external AI services or components become unavailable. Addresses recovery documentation but not the broader third-party risk management framework.',
 'Include contingency procedures for third-party AI service outages covering alternative inference providers, cached model fallbacks, and manual processing alternatives. Document dependencies on external AI services and define acceptable downtime thresholds and switchover criteria.',
 ARRAY['Third-party contingency procedures', 'Dependency documentation', 'Switchover criteria records']),

('MAP 2.3', 'cp-2', 'Partial',
 'CP-2 contingency planning supports AI system TEVV considerations by requiring organizations to plan for and test AI system behavior under failure conditions as part of contingency plan development. Addresses failure-mode planning but not the testing methodology itself.',
 'Design AI contingency plans that account for tested failure modes including model degradation under load, inference quality decline over time, and data pipeline interruption impacts. Reference TEVV results when defining recovery thresholds and acceptable degradation levels for AI system contingency operations.',
 ARRAY['Failure mode planning documentation', 'TEVV-informed recovery thresholds', 'Degradation level specifications']),

-- CP-3: Contingency Training
('MEASURE 1.1', 'cp-3', 'Partial',
 'CP-3 contingency training supports AI measurement approaches by ensuring personnel responsible for AI systems are trained to execute recovery procedures and recognize AI-specific failure conditions. Addresses training for recovery readiness but not the measurement methodology design.',
 'Include AI system recovery scenarios in contingency training exercises covering model rollback procedures, inference fallback activation, training pipeline recovery, and recognition of AI-specific failure indicators such as output quality degradation, confidence score anomalies, and drift detection alerts.',
 ARRAY['Training materials', 'AI recovery exercise records', 'Scenario documentation']),

('GOVERN 2.2', 'cp-3', 'Partial',
 'CP-3 contingency training supports AI workforce competency by developing the skills personnel need to maintain AI system availability during disruptions. Addresses recovery skill development but not the broader AI competency framework.',
 'Train AI system operators and administrators on contingency procedures specific to AI workloads including model serving failover, GPU resource reallocation, and data pipeline switchover. Develop hands-on exercises that simulate AI system failures requiring personnel to execute recovery procedures under realistic conditions.',
 ARRAY['AI contingency training records', 'Exercise participation logs', 'Competency verification documentation']),

-- CP-4: Contingency Plan Testing
('MEASURE 1.1', 'cp-4', 'Partial',
 'CP-4 contingency plan testing supports AI measurement validation by verifying that AI system recovery procedures achieve documented recovery objectives. Addresses recovery validation but not the broader AI measurement approach design.',
 'Test AI system failover and recovery procedures including model version rollback, inference service switchover, training pipeline restart, and fallback model activation. Verify that recovery time and recovery point objectives are achievable for AI systems under realistic failure conditions.',
 ARRAY['Test plans', 'AI recovery test results', 'RTO/RPO verification records']),

('MEASURE 1.3', 'cp-4', 'Partial',
 'CP-4 testing validates AI monitoring continuity during disruptions by confirming that measurement and monitoring capabilities survive contingency operations. Addresses monitoring continuity verification but not the assessment methodology itself.',
 'Verify that AI system monitoring, drift detection, and performance measurement continue to function during contingency operations. Test that alerting and logging remain active when AI systems operate in degraded or failover modes to ensure continued visibility into AI system behavior.',
 ARRAY['Monitoring continuity test results', 'Alerting verification records', 'Degraded-mode observation documentation']),

('MANAGE 4.2', 'cp-4', 'Partial',
 'CP-4 testing supports continual AI improvement by generating findings that inform updates to AI recovery procedures and resilience architectures. Addresses testing-driven improvement but not the broader stakeholder engagement for improvement.',
 'Use contingency plan test results to identify weaknesses in AI system recovery capabilities and update procedures accordingly. Track test findings over time to demonstrate continual improvement in AI system resilience and recovery effectiveness.',
 ARRAY['Test finding records', 'Procedure improvement documentation', 'Resilience improvement tracking']),

-- CP-5: Contingency Plan Update
('GOVERN 1.5', 'cp-5', 'Strong',
 'CP-5 contingency plan updates directly support ongoing review of AI risk management by requiring revision of contingency plans when AI system architectures change, new failure modes are identified, or recovery procedures are found inadequate during testing. Core control for keeping AI continuity documentation current.',
 'Update AI system contingency plans when models are retrained, deployment architectures change, new AI services are added, or test results reveal recovery gaps. Define update triggers for AI contingency plans including model version changes, infrastructure modifications, and post-incident findings.',
 ARRAY['Plan update records', 'Update trigger documentation', 'Change-to-plan traceability']),

('MANAGE 4.2', 'cp-5', 'Partial',
 'CP-5 plan updates support continual AI improvement by incorporating lessons learned from AI incidents, test results, and operational experience into recovery procedures. Addresses plan maintenance but not the broader stakeholder engagement for improvement.',
 'Incorporate post-incident findings, contingency test results, and operational observations into AI contingency plan updates. Track the evolution of AI recovery procedures over time to demonstrate that contingency capabilities improve alongside AI system complexity.',
 ARRAY['Plan revision history', 'Lesson learned integration records', 'Improvement tracking documentation']),

-- CP-6: Alternate Storage Site
('MANAGE 2.2', 'cp-6', 'Partial',
 'CP-6 alternate storage supports AI system value sustainment by ensuring model weights, training data, and configuration artifacts are available from geographically distinct locations during primary site disruptions. Addresses storage redundancy but not the broader AI value sustainment mechanisms.',
 'Store backup copies of AI model weights, training datasets, configuration files, and pipeline definitions at alternate storage sites. Ensure alternate storage provides equivalent access controls and encryption for AI artifacts and that model versioning is maintained across storage locations.',
 ARRAY['Alternate storage configurations', 'AI artifact backup records', 'Storage equivalency assessments']),

-- CP-7: Alternate Processing Site
('MANAGE 2.2', 'cp-7', 'Partial',
 'CP-7 alternate processing supports AI system availability by providing inference and training capabilities at geographically distinct locations when primary compute resources are unavailable. Addresses processing redundancy but not the broader AI value sustainment framework.',
 'Identify alternate processing capabilities for critical AI workloads including inference serving, model monitoring, and essential training operations. Ensure alternate sites have compatible compute resources (GPU/TPU availability, memory capacity) and that AI models can be loaded and served within defined recovery time objectives.',
 ARRAY['Alternate processing site documentation', 'Compute capability assessments', 'AI workload transfer procedures']),

-- CP-8: Telecommunications Services
('MANAGE 2.2', 'cp-8', 'Supportive',
 'CP-8 alternate telecommunications supports AI system availability by ensuring network connectivity for AI inference APIs, model distribution, and training data pipelines during primary telecommunications disruptions. Provides foundational connectivity for AI system continuity.',
 'Establish alternate telecommunications capabilities for AI system communications including inference API connectivity, model update distribution channels, and training data pipeline network paths. Consider bandwidth requirements for AI workloads when provisioning alternate telecommunications to ensure inference latency and data throughput meet minimum operational thresholds.',
 ARRAY['Alternate telecommunications agreements', 'Bandwidth requirement documentation', 'AI connectivity contingency records']),

-- CP-9: System Backup
('MANAGE 2.2', 'cp-9', 'Strong',
 'CP-9 system backup directly supports AI system resilience by ensuring model weights, training data, pipeline configurations, and inference system state can be restored after disruption or corruption. Core data protection control for AI system continuity.',
 'Back up AI models, training datasets, hyperparameter configurations, pipeline definitions, and inference system configurations per documented recovery requirements. Implement versioned backups of AI model weights to support rollback to known-good model versions and verify backup integrity through periodic restoration testing.',
 ARRAY['Backup schedules', 'AI model backup records', 'Backup integrity verification results']),

('MANAGE 3.2', 'cp-9', 'Partial',
 'CP-9 backup supports AI pre-deployment risk management by ensuring that pre-production model versions, evaluation datasets, and approval artifacts are preserved for potential rollback. Addresses artifact preservation but not the pre-deployment risk assessment process.',
 'Maintain backups of AI models at each stage of the deployment pipeline including development, validation, staging, and production versions. Preserve evaluation datasets, approval records, and test results alongside model backups to support informed rollback decisions when production models exhibit unexpected behavior.',
 ARRAY['Pipeline stage backup records', 'Evaluation artifact preservation logs', 'Rollback support documentation']),

-- CP-10: System Recovery and Reconstitution
('MANAGE 2.2', 'cp-10', 'Strong',
 'CP-10 recovery and reconstitution directly supports AI system restoration by defining procedures for returning AI systems to known-good operational states after disruptions, compromises, or failures. Core recovery control for AI system integrity and availability.',
 'Define procedures for reconstituting AI systems to known-good states including verified model weight restoration, pipeline reconfiguration, and inference service validation. Include post-recovery verification steps for AI systems such as output quality checks against reference datasets, drift detection baseline reestablishment, and monitoring system recalibration.',
 ARRAY['Recovery procedures', 'Post-recovery verification records', 'AI system reconstitution documentation']),

('MANAGE 4.1', 'cp-10', 'Partial',
 'CP-10 recovery supports AI risk treatment by providing the operational capability to restore AI systems after risk events materialize. Addresses recovery execution but not the risk treatment decision framework.',
 'Execute AI system recovery procedures that restore model serving to validated states, reestablish monitoring baselines, and verify inference quality before returning AI systems to full operational status. Document recovery actions and outcomes to inform future risk treatment decisions and contingency plan improvements.',
 ARRAY['Recovery execution records', 'Post-recovery validation results', 'Outcome documentation']),

-- CP-11: Alternate Communications Protocols
('MANAGE 2.2', 'cp-11', 'Supportive',
 'CP-11 alternate communications protocols support AI system availability by providing backup communication pathways for AI inference requests, model updates, and monitoring data when primary protocols are unavailable. Provides communication resilience for AI operations.',
 'Establish alternate communications protocols for critical AI system interactions including inference API access, model deployment channels, and monitoring data transmission. Ensure AI client applications can switch to alternate protocols without loss of inference capability or monitoring visibility.',
 ARRAY['Alternate protocol configurations', 'Protocol switching documentation', 'AI communication resilience records']),

-- CP-12: Safe Mode
('MANAGE 2.4', 'cp-12', 'Strong',
 'CP-12 safe mode directly supports AI system disengagement by defining restricted operational states that AI systems enter when anomalous conditions are detected. Core control for implementing controlled AI system degradation when safety or reliability thresholds are breached.',
 'Define safe mode conditions for AI systems that trigger restricted operation when model confidence drops below thresholds, drift detection indicates significant distribution shift, or adversarial inputs are detected. Implement safe mode capabilities that restrict AI systems to conservative outputs, human-in-the-loop operation, or complete inference suspension based on the severity of detected conditions.',
 ARRAY['Safe mode trigger definitions', 'Restricted operation specifications', 'Condition detection configurations']),

('GOVERN 1.4', 'cp-12', 'Partial',
 'CP-12 safe mode supports transparent AI governance by documenting the conditions under which AI systems restrict their own operation, providing visibility into automated safety mechanisms. Addresses operational transparency but not comprehensive AI governance documentation.',
 'Document safe mode conditions, triggers, and restricted operational capabilities for each AI system. Communicate safe mode behavior to AI system users and stakeholders so they understand when and how AI systems will limit their own operation for safety or reliability reasons.',
 ARRAY['Safe mode documentation', 'Stakeholder communication records', 'Trigger-to-behavior mapping']),

('MEASURE 2.6', 'cp-12', 'Partial',
 'CP-12 safe mode supports AI system performance monitoring by providing defined operational states against which system behavior can be measured during degraded conditions. Addresses degraded-state operation definition but not the measurement methodology.',
 'Monitor AI system transitions into and out of safe mode to track frequency, duration, and triggering conditions. Use safe mode activation patterns as indicators of AI system reliability and as inputs to model retraining or architecture improvement decisions.',
 ARRAY['Safe mode activation logs', 'Transition frequency analysis', 'Pattern-to-improvement tracking']),

-- CP-13: Alternative Security Mechanisms
('MANAGE 2.2', 'cp-13', 'Supportive',
 'CP-13 alternative security mechanisms support AI system value sustainment by ensuring that security protections for AI systems can be maintained through backup mechanisms when primary controls fail. Provides security continuity for AI system operations.',
 'Identify alternative security mechanisms for critical AI system protections including backup authentication methods for AI API access, alternate encryption approaches for model weight protection, and fallback monitoring capabilities when primary security tools are unavailable.',
 ARRAY['Alternative mechanism documentation', 'Fallback security configurations', 'Security continuity records'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
