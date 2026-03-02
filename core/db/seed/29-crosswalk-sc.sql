-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — SC Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 SC controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- SC-1: Policy and Procedures
('GOVERN 1.1', 'sc-1', 'Partial',
 'SC-1 establishes the system and communications protection policy framework that can incorporate AI-specific boundary, encryption, and network segmentation requirements. Addresses the policy layer for communications protection but not the full scope of AI risk management policies.',
 'Extend SC-1 policy to explicitly address AI system communication protection requirements including model API encryption, training data transfer controls, and inference traffic segmentation. Reference AI-specific threat models in SC policy scope.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'sc-1', 'Partial',
 'SC-1 procedures define organizational communications protection processes that support AI risk tolerance through controlled network boundaries and encryption standards. Addresses protection discipline but not AI-specific risk tolerance determination.',
 'Include AI system communication protection procedures covering model endpoint security, inter-service encryption for ML pipelines, and data-in-transit requirements for training data transfers.',
 ARRAY['Policy documents', 'SC procedure documentation']),

-- SC-2: Separation of System and User Functionality
('GOVERN 3.2', 'sc-2', 'Partial',
 'SC-2 separation of system and user functionality supports human-AI configuration by ensuring AI management functions are isolated from user-facing capabilities. Addresses functional separation but not the broader policy framework for human-AI role definitions.',
 'Separate AI model management interfaces (training, configuration, deployment) from end-user inference interfaces. Ensure administrative functions for AI systems run in isolated processes or containers from user-facing model serving.',
 ARRAY['Architecture documents', 'Separation verification reports']),

-- SC-3: Security Function Isolation
('MEASURE 2.7', 'sc-3', 'Partial',
 'SC-3 security function isolation supports AI system security evaluation by ensuring that security mechanisms protecting AI systems are themselves isolated from compromise. Addresses security mechanism integrity but not AI-specific security assessment methodology.',
 'Isolate AI security functions (content filters, access controls, monitoring agents) from the AI inference pipeline to prevent adversarial bypass. Ensure security controls protecting AI models cannot be disabled through model manipulation or input injection.',
 ARRAY['Security architecture documents', 'Isolation verification reports', 'Penetration test results']),

-- SC-4: Information in Shared System Resources
('MEASURE 2.10', 'sc-4', 'Partial',
 'SC-4 controls over shared resources support AI privacy risk by preventing information leakage between AI workloads sharing infrastructure. Addresses resource-level data isolation but not the broader AI privacy risk assessment methodology.',
 'Prevent AI model training data and inference results from leaking through shared memory, GPU resources, or storage in multi-tenant environments. Implement memory clearing between AI workloads and enforce tenant isolation for shared AI infrastructure.',
 ARRAY['Resource isolation configurations', 'Memory management policies', 'Multi-tenancy security assessments']),

('MAP 2.3', 'sc-4', 'Partial',
 'SC-4 shared resource controls are relevant to AI systems that process sensitive data on shared infrastructure, supporting TEVV considerations for data isolation. Addresses infrastructure-level data protection but not AI-specific testing methodology.',
 'Include shared resource isolation in AI system TEVV plans, particularly for models processing sensitive data on shared GPU clusters or cloud infrastructure. Test for cross-tenant data leakage in AI serving environments.',
 ARRAY['TEVV test plans', 'Isolation test results', 'Infrastructure security assessments']),

-- SC-5: Denial-of-service Protection
('MANAGE 2.2', 'sc-5', 'Partial',
 'SC-5 denial-of-service protection supports sustaining AI system availability by defending inference endpoints against resource exhaustion attacks. Addresses availability protection but not the broader mechanisms for sustaining AI system value.',
 'Protect AI inference endpoints from denial-of-service attacks including API flooding, computationally expensive query attacks, and model-specific adversarial inputs designed to maximize resource consumption. Implement request queuing and circuit breakers.',
 ARRAY['DoS protection configurations', 'Rate limiting policies', 'Incident response logs']),

('MANAGE 2.4', 'sc-5', 'Partial',
 'SC-5 DoS protection supports AI system disengagement decisions by ensuring availability degradation is detected and managed. Addresses availability defense but not the criteria for when to disengage an AI system.',
 'Implement rate limiting, load balancing, and auto-scaling for AI inference endpoints to maintain service availability. Configure health checks that trigger graceful degradation or failover when AI endpoints are under resource pressure.',
 ARRAY['Load balancer configurations', 'Auto-scaling policies', 'Health check configurations']),

-- SC-7: Boundary Protection
('MANAGE 2.4', 'sc-7', 'Strong',
 'SC-7 boundary protection directly controls AI system network exposure by establishing monitored perimeters around AI infrastructure. Core control for limiting AI attack surface and preventing unauthorized access to model training and serving environments.',
 'Segment AI training and inference environments with network boundaries including dedicated VPCs, security groups, and network ACLs. Restrict ingress to AI model endpoints to authorized clients and egress to approved data sources and monitoring destinations.',
 ARRAY['Network architecture diagrams', 'Security group configurations', 'Boundary monitoring logs']),

('MAP 2.1', 'sc-7', 'Partial',
 'SC-7 boundary protection documents the network scope of AI system operations, supporting documentation of AI implementation components. Addresses network architecture documentation but not the broader documentation of AI methods and tasks.',
 'Document AI system network boundaries, allowed communication paths, and data flow directions as part of system architecture documentation. Include boundary definitions in AI system documentation to clarify operational scope and communication dependencies.',
 ARRAY['Architecture documents', 'Network flow diagrams', 'Boundary documentation']),

('MEASURE 2.7', 'sc-7', 'Partial',
 'SC-7 boundary protection supports AI security evaluation by establishing a monitored network perimeter that can be assessed for effectiveness. Addresses network security posture but not the broader AI security and resilience evaluation.',
 'Include boundary protection effectiveness in AI system security evaluations. Test AI system boundaries for unauthorized access paths, data exfiltration channels, and network-level attack vectors specific to AI workloads.',
 ARRAY['Boundary penetration test results', 'Security evaluation reports', 'Network assessment findings']),

-- SC-8: Transmission Confidentiality and Integrity
('MANAGE 2.2', 'sc-8', 'Partial',
 'SC-8 transmission protection supports sustaining AI system value by ensuring model data, inference traffic, and training data transfers maintain confidentiality and integrity in transit. Addresses data-in-transit protection but not broader AI value sustainment.',
 'Encrypt all AI model data and inference traffic in transit using TLS 1.2+ for API communications, mutual TLS for service-to-service ML pipeline traffic, and encrypted channels for training data transfers between environments.',
 ARRAY['Encryption configurations', 'TLS certificate records', 'Network security audit results']),

('MEASURE 2.7', 'sc-8', 'Partial',
 'SC-8 transmission protection supports AI security evaluation by providing a verifiable control for data confidentiality and integrity during AI operations. Addresses transmission security but not the full AI security assessment scope.',
 'Verify encryption of AI inference API traffic, model weight transfers between environments, and training data pipeline communications. Include transmission protection testing in AI security evaluation plans.',
 ARRAY['Encryption verification reports', 'Security evaluation plans', 'Traffic analysis results']),

-- SC-12: Cryptographic Key Establishment and Management
('MANAGE 2.2', 'sc-12', 'Partial',
 'SC-12 cryptographic key management supports AI system integrity by ensuring keys used to protect AI models, training data, and inference traffic are properly generated, distributed, and rotated. Addresses key lifecycle but not AI-specific integrity concerns.',
 'Manage cryptographic keys used for AI model encryption, training data protection, and API authentication through a centralized key management service. Establish key rotation schedules aligned with AI model deployment cycles.',
 ARRAY['Key management procedures', 'Key rotation records', 'KMS audit logs']),

-- SC-13: Cryptographic Protection
('MANAGE 2.2', 'sc-13', 'Partial',
 'SC-13 cryptographic protection supports AI system value by applying encryption to protect model artifacts, training data, and inference results from unauthorized disclosure or modification. Addresses cryptographic mechanism selection but not broader AI value sustainment.',
 'Apply appropriate cryptographic protections to AI model weight files, training datasets, and inference logs. Use authenticated encryption for AI model artifacts to provide both confidentiality and tamper detection.',
 ARRAY['Cryptographic implementation records', 'Encryption standard documentation', 'Compliance verification reports']),

('MEASURE 2.5', 'sc-13', 'Partial',
 'SC-13 cryptographic protection supports demonstration of AI system validity by ensuring data and model integrity through cryptographic verification. Addresses integrity assurance but not the broader TEVV validation process.',
 'Use cryptographic hashing to verify AI model and training data integrity as part of deployment validation. Implement checksum verification in CI/CD pipelines for AI artifacts to ensure only validated models reach production.',
 ARRAY['Hash verification logs', 'CI/CD pipeline security reports', 'Deployment validation records']),

-- SC-24: Fail in Known State
('MANAGE 2.4', 'sc-24', 'Direct',
 'SC-24 fail in known state directly supports AI system disengagement by requiring systems to enter a predetermined safe state upon failure. Core control for AI safety that ensures failed AI systems do not produce harmful or unpredictable outputs.',
 'Configure AI systems to fail to a known safe state such as returning cached responses, falling back to rule-based systems, or displaying clear error messages rather than generating unvalidated outputs. Define the known failure state for each AI system based on its risk profile.',
 ARRAY['Failure state specifications', 'Fallback configuration records', 'Failure mode test results']),

('MANAGE 4.1', 'sc-24', 'Partial',
 'SC-24 fail-in-known-state supports post-deployment monitoring by defining what AI system failure looks like and ensuring failures are observable. Addresses failure behavior but not the broader monitoring and evaluation plan.',
 'Monitor AI system state transitions to detect when systems enter failure states. Log all failure events with sufficient context to support incident investigation and post-mortem analysis of AI system failures.',
 ARRAY['Failure state monitoring logs', 'State transition records', 'Incident investigation reports']),

-- SC-28: Protection of Information at Rest
('MANAGE 2.2', 'sc-28', 'Partial',
 'SC-28 protection of information at rest supports sustaining AI system value by ensuring stored model artifacts, training datasets, and inference logs are protected from unauthorized access or modification. Addresses storage protection but not broader AI value mechanisms.',
 'Encrypt stored AI models, training datasets, evaluation results, and inference logs at rest using organization-approved encryption standards. Apply storage-level access controls that restrict access to AI data assets based on role and need-to-know.',
 ARRAY['Encryption-at-rest configurations', 'Storage access control records', 'Compliance audit results']),

('MAP 1.1', 'sc-28', 'Partial',
 'SC-28 data-at-rest protection supports understanding of AI data context by requiring organizations to identify and protect stored AI data assets. Addresses data protection but not the broader understanding of deployment context and potential impacts.',
 'Apply encryption and access controls to stored AI data assets including training datasets, model registries, feature stores, and inference log archives. Document protection levels for each category of stored AI data.',
 ARRAY['Data protection inventory', 'Encryption configuration records', 'Access control documentation']),

('MEASURE 2.10', 'sc-28', 'Partial',
 'SC-28 protection of data at rest supports AI privacy risk management by ensuring personal data in AI training sets and inference logs is encrypted when stored. Addresses storage-level privacy protection but not the broader privacy risk assessment.',
 'Encrypt AI training datasets and inference logs containing personal data at rest. Verify encryption coverage for all AI data stores and document any exceptions with compensating controls and risk acceptance.',
 ARRAY['Encryption verification reports', 'Privacy protection assessments', 'Exception documentation']),

-- SC-29: Heterogeneity
('MANAGE 2.2', 'sc-29', 'Partial',
 'SC-29 heterogeneity supports AI system resilience by encouraging diverse technology implementations that resist single points of failure. Addresses architectural diversity but not the broader AI value sustainment mechanisms.',
 'Consider deploying critical AI systems using heterogeneous model architectures or diverse ML frameworks to reduce susceptibility to architecture-specific attacks. Use ensemble approaches where feasible to limit the impact of any single model compromise.',
 ARRAY['Architecture diversity documentation', 'Resilience assessment reports']),

-- SC-32: System Partitioning
('GOVERN 3.2', 'sc-32', 'Partial',
 'SC-32 system partitioning supports human-AI configuration by enabling physical or logical separation of AI system components into distinct domains with different trust levels. Addresses technical separation but not the policy framework for human-AI roles.',
 'Partition AI systems into separate domains for training, evaluation, and production inference with appropriate trust boundaries between them. Enforce data flow controls between partitions to prevent training environment data from flowing directly to production without validation.',
 ARRAY['Partition architecture documents', 'Trust boundary documentation', 'Data flow control configurations']),

('MANAGE 2.4', 'sc-32', 'Partial',
 'SC-32 partitioning supports AI disengagement by enabling isolation of compromised components without requiring full system shutdown. Addresses component isolation but not the decision criteria for disengagement.',
 'Design AI system partitions to enable independent shutdown or rollback of compromised components. Implement partition-level health monitoring that can isolate a failing AI model serving instance without affecting other system partitions.',
 ARRAY['Partition isolation test results', 'Health monitoring configurations', 'Failover documentation']),

-- SC-36: Distributed Processing and Storage
('MANAGE 2.2', 'sc-36', 'Partial',
 'SC-36 distributed processing supports AI system resilience and value sustainment by distributing AI workloads and data across multiple locations. Addresses distribution architecture but not broader AI value assessment.',
 'Distribute AI training data and model serving across multiple availability zones or regions to enhance resilience. Implement data replication strategies for AI model registries and critical training datasets.',
 ARRAY['Distribution architecture documents', 'Replication configuration records', 'Disaster recovery documentation']),

-- SC-38: Operations Security
('GOVERN 1.3', 'sc-38', 'Partial',
 'SC-38 operations security supports AI risk management by protecting sensitive information about AI system capabilities, weaknesses, and operational methods from adversarial exploitation. Addresses operational information protection but not AI risk tolerance determination.',
 'Apply operations security principles to AI model deployment details including architecture specifics, training data sources, and known model limitations. Restrict public disclosure of AI system internals that could enable targeted adversarial attacks.',
 ARRAY['OPSEC assessment reports', 'Information classification records', 'Disclosure review documentation']),

('MANAGE 2.4', 'sc-38', 'Partial',
 'SC-38 operations security supports AI system protection by preventing adversaries from learning enough about AI systems to craft effective attacks or exploitation techniques. Addresses information protection but not disengagement criteria.',
 'Protect AI system architecture details, model vulnerability assessments, and adversarial testing results from unauthorized disclosure. Implement need-to-know controls for AI model performance characteristics that could inform adversarial strategies.',
 ARRAY['OPSEC policies', 'Information access controls', 'Vulnerability disclosure procedures']),

('MAP 2.2', 'sc-38', 'Partial',
 'SC-38 operations security supports documentation of AI system knowledge limits by identifying what system information must be protected versus what can be shared. Addresses operational information classification but not scientific understanding of AI limitations.',
 'Balance transparency requirements for AI system documentation with operations security needs. Define what AI system details can be shared with users and stakeholders versus what must remain protected to prevent adversarial exploitation.',
 ARRAY['Information sharing policies', 'Transparency-security balance documentation']),

-- SC-39: Process Isolation
('MEASURE 2.7', 'sc-39', 'Partial',
 'SC-39 process isolation supports AI security evaluation by ensuring AI workloads run in isolated process spaces that prevent cross-contamination between AI and non-AI workloads. Addresses runtime isolation but not comprehensive AI security assessment.',
 'Run AI model inference and training workloads in isolated process spaces using containerization, virtual machines, or hardware enclaves. Verify process isolation prevents unauthorized access to AI model weights, intermediate computations, and inference results in memory.',
 ARRAY['Process isolation configurations', 'Container security assessments', 'Isolation verification reports']),

-- SC-42: Sensor Capability and Data
('MAP 1.1', 'sc-42', 'Strong',
 'SC-42 sensor data controls directly address AI systems that process sensor inputs by defining authorized data collection practices and managing sensor capabilities. Core control for AI systems using cameras, microphones, IoT sensors, or biometric inputs.',
 'Define authorized sensor data collection for AI-driven analysis systems including which sensors are enabled, collection frequency, data retention, and acceptable use. Implement technical controls to enforce sensor data collection boundaries for AI training and inference.',
 ARRAY['Sensor authorization policies', 'Data collection inventories', 'Technical control configurations']),

('MAP 1.5', 'sc-42', 'Strong',
 'SC-42 sensor controls directly support AI data collection impact assessment by requiring evaluation of sensor data collection on individuals and communities. Addresses data collection impacts but not broader organizational risk tolerance determination.',
 'Assess impacts of AI sensor data collection on individuals, communities, and vulnerable populations. Document how sensor data feeds AI models and what inferences are drawn, including potential surveillance or profiling implications.',
 ARRAY['Impact assessment reports', 'Sensor-AI data flow documentation', 'Community impact analysis']),

('GOVERN 1.4', 'sc-42', 'Partial',
 'SC-42 sensor controls support transparent AI data governance by requiring documented policies for sensor data collection and use. Addresses sensor-specific data governance transparency but not comprehensive AI risk management documentation.',
 'Ensure AI sensor data collection complies with privacy regulations, consent requirements, and organizational data governance policies. Document sensor data governance decisions and make policies accessible to affected individuals.',
 ARRAY['Sensor data policies', 'Compliance documentation', 'Consent management records']),

-- SC-43: Usage Restrictions
('MAP 2.1', 'sc-43', 'Partial',
 'SC-43 usage restrictions define boundaries for AI system operation by specifying acceptable use conditions and prohibited activities. Addresses use case boundaries but not the broader documentation of AI implementation methods.',
 'Restrict AI system usage to authorized purposes, user populations, and operational contexts. Document usage restrictions in AI system interfaces and enforce technical controls that prevent out-of-scope AI system use.',
 ARRAY['Usage restriction policies', 'Technical enforcement configurations', 'Acceptable use documentation']),

('GOVERN 1.4', 'sc-43', 'Partial',
 'SC-43 usage restrictions support transparent AI governance by documenting permitted and prohibited uses of AI systems. Addresses usage transparency but not comprehensive AI risk management documentation.',
 'Publish AI system usage policies that clearly communicate permitted uses, prohibited activities, and consequences of policy violations. Maintain audit trails of usage restriction enforcement actions.',
 ARRAY['Usage policy documents', 'Enforcement action logs', 'User acknowledgment records']),

('MAP 3.3', 'sc-43', 'Partial',
 'SC-43 usage restrictions support targeted application scope specification by defining the boundaries within which AI systems may operate. Addresses operational boundaries but not the full documentation of AI capabilities and limitations.',
 'Align AI system usage restrictions with the documented application scope and intended use. Enforce technical guardrails that prevent AI system operation outside its validated and approved scope of use.',
 ARRAY['Scope documentation', 'Guardrail configurations', 'Boundary enforcement logs'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
