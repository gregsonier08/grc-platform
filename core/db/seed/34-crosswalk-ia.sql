-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — IA Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 IA controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- IA-1: Policy and Procedures
('GOVERN 1.1', 'ia-1', 'Partial',
 'IA-1 establishes the identification and authentication policy framework that can incorporate AI-specific authentication requirements for model endpoints, training pipelines, and inference APIs. Addresses the policy layer for identity management but not the full scope of AI risk management policies.',
 'Extend IA-1 policy to require strong authentication for AI system interfaces including model serving APIs, training pipeline access, and administrative functions. Define authentication standards for both human and service-to-service AI system interactions.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'ia-1', 'Partial',
 'IA-1 procedures define organizational authentication processes that support AI risk tolerance through controlled identity verification for AI system access. Addresses authentication discipline but not AI-specific risk tolerance determination.',
 'Define authentication procedures for AI model endpoints, training pipeline access, and data ingestion interfaces. Establish authentication strength requirements based on AI system criticality and data sensitivity levels.',
 ARRAY['Policy documents', 'IA procedure documentation', 'Authentication standard definitions']),

-- IA-2: Identification and Authentication (Organizational Users)
('MANAGE 2.4', 'ia-2', 'Partial',
 'IA-2 user identification supports AI system access accountability by requiring unique identification and authentication before granting access to AI resources. Addresses user authentication but not the decision criteria for AI system disengagement.',
 'Require authenticated access to AI inference endpoints, model management interfaces, and training pipeline controls. Implement multi-factor authentication for privileged AI system operations such as model deployment, retraining, and configuration changes.',
 ARRAY['Authentication configuration records', 'MFA enrollment records', 'Access audit logs']),

('MEASURE 2.8', 'ia-2', 'Partial',
 'IA-2 user identification supports AI transparency and accountability by ensuring all AI system interactions are attributable to identified users. Addresses user attribution but not the broader transparency evaluation.',
 'Ensure all AI system actions are logged with authenticated user identity to support accountability and audit. Link AI system queries, model modifications, and deployment actions to specific authenticated individuals for post-hoc review.',
 ARRAY['Authentication audit logs', 'User attribution records', 'Action traceability documentation']),

-- IA-3: Device Identification and Authentication
('MANAGE 2.4', 'ia-3', 'Partial',
 'IA-3 device identification supports AI system boundary protection by authenticating devices before granting access to AI training and inference infrastructure. Addresses device-level trust but not the broader criteria for AI system disengagement.',
 'Authenticate devices connecting to AI training clusters, GPU compute resources, and inference serving infrastructure. Implement device certificates or hardware attestation for systems that access AI model weights or training data.',
 ARRAY['Device authentication configurations', 'Certificate management records', 'Hardware attestation logs']),

-- IA-4: Identifier Management
('MANAGE 2.4', 'ia-4', 'Partial',
 'IA-4 identifier management supports AI system access tracking by providing unique, persistent identifiers for users, services, and devices that interact with AI systems. Addresses identifier lifecycle but not AI-specific disengagement criteria.',
 'Manage unique identifiers for AI system service accounts, API keys, and machine identities. Implement identifier lifecycle management including provisioning, review, and revocation for AI system access credentials.',
 ARRAY['Identifier management records', 'API key inventory', 'Service account registry']),

('GOVERN 1.6', 'ia-4', 'Partial',
 'IA-4 identifier management supports AI system inventory by providing trackable identifiers for AI system components and their access relationships. Addresses identity infrastructure but not the AI inventory mechanism itself.',
 'Use identifier management to track AI system service accounts, API integrations, and inter-service dependencies. Maintain a registry of all identifiers associated with AI system components to support inventory and access auditing.',
 ARRAY['AI service account registry', 'Integration identifier tracking', 'Access relationship documentation']),

-- IA-5: Authenticator Management
('MANAGE 2.4', 'ia-5', 'Partial',
 'IA-5 authenticator management protects AI system credentials by establishing secure practices for creating, distributing, and revoking authentication secrets. Addresses credential security but not the broader AI system protection mechanisms.',
 'Manage API keys, tokens, certificates, and credentials for AI services through secure authenticator management practices. Implement automated rotation for AI system service credentials and enforce secure storage using secrets management infrastructure.',
 ARRAY['Authenticator management records', 'Rotation schedule documentation', 'Secrets management configurations']),

('MANAGE 2.2', 'ia-5', 'Partial',
 'IA-5 authenticator management supports sustaining AI system value by preventing unauthorized access through compromised credentials. Addresses credential security but not the broader AI value sustainment mechanisms.',
 'Protect AI model serving API keys, training pipeline credentials, and data access tokens from unauthorized disclosure. Monitor for credential exposure in code repositories, configuration files, and logging systems.',
 ARRAY['Credential monitoring records', 'Exposure detection logs', 'Remediation documentation']),

-- IA-6: Authentication Feedback
('MEASURE 2.8', 'ia-6', 'Supportive',
 'IA-6 authentication feedback supports AI transparency by ensuring authentication processes do not reveal exploitable information about AI system internals. Addresses feedback security but not the broader AI transparency assessment.',
 'Ensure AI system authentication error messages do not reveal system architecture details, model versioning, or internal endpoint information. Obscure authentication feedback for AI APIs to prevent adversarial reconnaissance of AI system infrastructure.',
 ARRAY['Authentication feedback configurations', 'Security review records']),

-- IA-7: Cryptographic Module Authentication
('MANAGE 2.2', 'ia-7', 'Supportive',
 'IA-7 cryptographic module authentication supports AI system integrity by ensuring cryptographic modules used to protect AI data and models are themselves authenticated. Provides foundational trust for AI cryptographic protections.',
 'Use validated cryptographic modules for AI model encryption, training data protection, and secure communication between AI pipeline components. Verify cryptographic module authentication as part of AI system security baseline assessments.',
 ARRAY['Cryptographic module validation records', 'FIPS compliance documentation']),

-- IA-8: Identification and Authentication (Non-Organizational Users)
('MANAGE 2.4', 'ia-8', 'Partial',
 'IA-8 non-organizational user identification supports AI multi-tenant access control by authenticating external users who access AI services. Addresses external user authentication but not AI-specific disengagement criteria.',
 'Authenticate external users accessing AI services including API consumers, partner integrations, and public-facing AI applications. Apply appropriate authentication strength for external AI access based on data sensitivity and decision impact.',
 ARRAY['External authentication configurations', 'Partner integration records', 'Access tier documentation']),

('GOVERN 6.1', 'ia-8', 'Partial',
 'IA-8 non-organizational user authentication supports third-party AI risk management by verifying the identity of external parties who interact with AI systems. Addresses identity verification but not the broader third-party risk assessment.',
 'Verify identities of third-party users and systems accessing organizational AI services. Implement authentication requirements proportional to the sensitivity of AI data and capabilities accessible to non-organizational users.',
 ARRAY['Third-party authentication records', 'Access level documentation', 'Risk-based authentication configurations']),

-- IA-9: Service Identification and Authentication
('MANAGE 2.4', 'ia-9', 'Partial',
 'IA-9 service identification supports AI pipeline security by requiring authentication between AI microservices, model components, and data processing stages. Addresses service-level trust but not the broader AI disengagement mechanisms.',
 'Authenticate AI microservices and model pipeline components using mutual TLS, service mesh identity, or API gateway authentication. Ensure all inter-service communication within AI pipelines is authenticated to prevent unauthorized component injection.',
 ARRAY['Service authentication configurations', 'mTLS certificate records', 'Service mesh identity documentation']),

('MANAGE 3.1', 'ia-9', 'Partial',
 'IA-9 service authentication supports monitoring of third-party AI resources by verifying the identity of external AI services before granting integration access. Addresses service identity verification but not the broader risk monitoring activities.',
 'Authenticate third-party AI services and APIs before integrating them into organizational workflows. Verify service identity for external model endpoints, data enrichment APIs, and AI-as-a-service providers.',
 ARRAY['Third-party service authentication records', 'Integration verification logs', 'Service identity documentation']),

-- IA-10: Adaptive Authentication
('MANAGE 2.4', 'ia-10', 'Partial',
 'IA-10 adaptive authentication supports AI system protection by adjusting authentication requirements based on risk context such as unusual access patterns or sensitive operations. Addresses dynamic authentication but not AI-specific disengagement.',
 'Implement adaptive authentication for AI system access that increases authentication requirements for high-risk operations such as model retraining, production deployment, and bulk data export. Adjust authentication strength based on access pattern anomalies.',
 ARRAY['Adaptive authentication configurations', 'Risk-based policy documentation', 'Authentication escalation records']),

-- IA-11: Re-authentication
('MANAGE 2.4', 'ia-11', 'Supportive',
 'IA-11 re-authentication supports ongoing AI session verification by requiring periodic identity confirmation for long-running AI operations. Addresses session continuity assurance but not the broader AI system protection mechanisms.',
 'Re-authenticate users and services during long-running AI processing sessions such as model training, batch inference, and large data pipeline operations. Define re-authentication intervals based on session sensitivity and operational risk.',
 ARRAY['Re-authentication configurations', 'Session management policies', 'Interval documentation']),

-- IA-12: Identity Proofing
('GOVERN 1.4', 'ia-12', 'Partial',
 'IA-12 identity proofing supports transparent AI governance by verifying the real-world identity of users granted privileged access to AI systems. Addresses identity verification but not comprehensive AI risk management documentation.',
 'Verify identities of users granted access to AI administrative functions, model deployment capabilities, and training data management through identity proofing procedures. Apply stronger proofing requirements for roles with elevated AI system privileges.',
 ARRAY['Identity proofing records', 'Verification documentation', 'Privilege-to-proofing mapping']),

-- IA-13: Identity Providers and Authorization Servers
('MANAGE 2.4', 'ia-13', 'Partial',
 'IA-13 identity provider integration supports centralized AI access management by enabling consistent authentication and authorization across AI system components. Addresses identity infrastructure but not AI-specific disengagement criteria.',
 'Integrate AI systems with organizational identity providers for centralized authentication and authorization management. Use identity provider capabilities for role-based access control, token-based API authentication, and single sign-on across AI management interfaces.',
 ARRAY['IdP integration configurations', 'Authorization server records', 'SSO documentation']),

('GOVERN 3.2', 'ia-13', 'Partial',
 'IA-13 identity provider integration supports human-AI role definition by enabling centralized role management and access control across AI systems. Addresses role infrastructure but not the policy framework for human-AI configurations.',
 'Use identity providers to enforce role-based access controls for AI systems including separate roles for model development, review, deployment, and monitoring. Centralize AI role definitions and access policies for consistent enforcement across all AI components.',
 ARRAY['Role definition records', 'Centralized policy documentation', 'Access control configurations'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
