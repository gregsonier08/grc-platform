-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — MP Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 MP controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- MP-1: Policy and Procedures
('GOVERN 1.1', 'mp-1', 'Partial',
 'MP-1 establishes the media protection policy framework that can incorporate AI-specific requirements for protecting media containing model weights, training datasets, inference logs, and AI configuration artifacts. Addresses the policy layer for media protection but not the full scope of AI risk management policies.',
 'Extend MP-1 policy to require media protection procedures for AI-specific assets including model weight storage media, training dataset repositories, inference log archives, and hyperparameter configuration backups. Define protection levels for AI media based on model sensitivity, training data classification, and intellectual property value.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'mp-1', 'Partial',
 'MP-1 procedures define organizational media protection processes that support AI risk management through structured handling of AI data and model artifacts on physical and digital media. Addresses media process discipline but not AI-specific risk tolerance determination.',
 'Define media protection procedures for AI assets covering labeling, handling, storage, transport, and disposal of media containing training data, model weights, and evaluation datasets. Establish procedures that account for the unique sensitivity of AI artifacts such as model weights that encode proprietary training data patterns.',
 ARRAY['Policy documents', 'MP procedure documentation', 'AI media handling procedures']),

-- MP-2: Media Access
('MANAGE 2.4', 'mp-2', 'Partial',
 'MP-2 media access controls protect AI system integrity by restricting physical and logical access to media containing model weights, training datasets, and AI configuration artifacts to authorized personnel. Addresses media-level access control but not the broader AI system protection mechanisms.',
 'Restrict access to media containing AI model weights, training datasets, evaluation data, and inference logs to authorized personnel with documented need-to-access. Implement access controls for AI data storage media including encrypted drives, secure network shares, and air-gapped storage used for sensitive AI artifacts.',
 ARRAY['Media access control records', 'Authorization documentation', 'Access restriction configurations']),

('MAP 1.1', 'mp-2', 'Supportive',
 'MP-2 media access controls support understanding of AI deployment context by requiring organizations to identify which media contain AI assets and who should have access to them. Addresses access identification but not the broader AI context documentation.',
 'Maintain an inventory of media containing AI assets including training datasets, model weights, evaluation benchmarks, and configuration files. Use the media inventory to inform AI system documentation and ensure all AI data repositories are accounted for in access control and protection schemes.',
 ARRAY['AI media inventory records', 'Access authorization lists', 'Repository documentation']),

-- MP-3: Media Marking
('MAP 1.1', 'mp-3', 'Partial',
 'MP-3 media marking supports AI data classification visibility by requiring labels on media that indicate the sensitivity, handling requirements, and distribution limitations of AI training data and model artifacts. Addresses marking for visibility but not the broader AI deployment context understanding.',
 'Mark media containing AI training data, model weights, and evaluation datasets with appropriate classification labels including data sensitivity levels, handling restrictions, and distribution limitations. Apply AI-specific marking categories that distinguish between training data, production model weights, pre-release models, and deprecated model versions.',
 ARRAY['Media marking standards', 'AI classification label documentation', 'Marking compliance records']),

('GOVERN 1.4', 'mp-3', 'Supportive',
 'MP-3 media marking supports transparent AI governance by making the classification and handling requirements for AI data assets visible to personnel who encounter the media. Addresses physical transparency but not comprehensive AI governance documentation.',
 'Use media markings to communicate AI data handling requirements to all personnel who may encounter AI-related media. Ensure markings convey relevant information such as whether media contains personally identifiable training data, proprietary model weights, or data subject to regulatory restrictions.',
 ARRAY['Marking guidelines', 'Handling instruction documentation', 'Regulatory marking records']),

-- MP-4: Media Storage
('MANAGE 2.4', 'mp-4', 'Partial',
 'MP-4 media storage protections support AI system integrity by requiring controlled storage environments for media containing model weights, training data, and AI configuration artifacts. Addresses physical storage security but not the broader AI system protection framework.',
 'Store media containing AI model weights, training datasets, and evaluation data in physically controlled and environmentally protected locations. Apply storage protections commensurate with the sensitivity of AI assets, using secure vaults or restricted areas for media containing production model weights or sensitive training data.',
 ARRAY['Storage location documentation', 'Environmental control records', 'AI media storage procedures']),

('MEASURE 2.10', 'mp-4', 'Supportive',
 'MP-4 media storage supports AI privacy risk management by ensuring that media containing personal data used for AI training or inference is stored with appropriate physical protections. Addresses storage-level privacy protection but not the broader AI privacy risk examination.',
 'Apply enhanced storage protections to media containing personally identifiable training data, inference results with personal information, and AI evaluation datasets derived from personal records. Ensure storage controls meet applicable regulatory requirements for physical protection of personal data used in AI systems.',
 ARRAY['PII media storage records', 'Regulatory compliance documentation', 'Enhanced storage configurations']),

-- MP-5: Media Transport
('MANAGE 2.4', 'mp-5', 'Partial',
 'MP-5 media transport protections support AI system security by ensuring that model weights, training data, and AI configuration artifacts are protected from interception, tampering, and loss during physical transport. Addresses transport security but not the broader AI system protection mechanisms.',
 'Protect AI models, training datasets, and evaluation data during physical transport using encryption, tamper-evident packaging, and authorized courier services. Apply transport protections based on AI asset sensitivity with enhanced controls for media containing production model weights or sensitive training data that could enable model replication.',
 ARRAY['Transport protection records', 'Encryption documentation', 'Chain of custody logs']),

('MAP 1.2', 'mp-5', 'Supportive',
 'MP-5 transport protections support interdisciplinary AI context by addressing the physical security dimension of AI data movement that complements logical data protection measures. Addresses physical transport but not the broader interdisciplinary understanding of AI system context.',
 'Coordinate AI media transport protections with data governance teams to ensure physical transport security aligns with logical data protection policies. Account for AI-specific transport risks such as the value of model weights to competitors and the re-identification potential of training data if intercepted during transport.',
 ARRAY['Transport risk assessments', 'Cross-team coordination records', 'AI-specific transport procedures']),

-- MP-6: Media Sanitization
('MANAGE 2.4', 'mp-6', 'Partial',
 'MP-6 media sanitization protects AI system confidentiality by ensuring that model weights, training data, and inference logs are irrecoverably removed from media before disposal, release, or reuse. Addresses media-level data destruction but not the broader AI system protection framework.',
 'Sanitize media containing AI training data, model weights, hyperparameter configurations, and inference logs using methods commensurate with data sensitivity before disposal or reuse. Apply enhanced sanitization to media that contained sensitive training data or proprietary model weights to prevent recovery of AI intellectual property or personal data.',
 ARRAY['Sanitization records', 'Method documentation', 'Verification certificates']),

('MAP 1.1', 'mp-6', 'Supportive',
 'MP-6 media sanitization supports AI data lifecycle management by ensuring that decommissioned AI data assets are properly tracked through final disposition. Addresses end-of-life media handling but not the broader AI deployment context documentation.',
 'Track media sanitization for decommissioned AI assets including retired training datasets, deprecated model versions, and obsolete evaluation benchmarks. Maintain sanitization records as part of AI data lifecycle documentation to demonstrate proper disposition of AI artifacts and compliance with data retention and destruction requirements.',
 ARRAY['Sanitization tracking records', 'AI asset disposition documentation', 'Lifecycle completion records']),

('MEASURE 2.10', 'mp-6', 'Partial',
 'MP-6 media sanitization supports AI privacy risk management by ensuring personal data used for AI training or inference is irrecoverably destroyed when no longer needed. Addresses media-level privacy protection but not the broader AI privacy risk examination.',
 'Apply privacy-appropriate sanitization methods to media containing personally identifiable training data, inference results with personal information, and AI evaluation datasets derived from personal records. Verify sanitization effectiveness for AI media to ensure personal data cannot be recovered through advanced forensic techniques.',
 ARRAY['PII sanitization records', 'Verification documentation', 'Privacy-specific sanitization procedures']),

-- MP-7: Media Use
('MANAGE 2.4', 'mp-7', 'Partial',
 'MP-7 media use restrictions protect AI system integrity by controlling the types of media that can be connected to AI training and inference infrastructure, reducing the risk of malicious code introduction or unauthorized data exfiltration. Addresses media-level access restrictions but not the broader AI system protection mechanisms.',
 'Restrict use of removable media on AI training clusters, model serving infrastructure, and inference pipeline systems to prevent unauthorized introduction of modified model weights or training data and to block exfiltration of AI artifacts. Implement technical controls that enforce media use restrictions on AI infrastructure including USB device blocking and removable media write protection.',
 ARRAY['Media use restriction policies', 'Technical enforcement configurations', 'Exception documentation']),

('GOVERN 1.4', 'mp-7', 'Supportive',
 'MP-7 media use restrictions support transparent AI governance by documenting approved and prohibited media types for AI systems, providing clear boundaries for personnel who interact with AI infrastructure. Addresses usage transparency but not comprehensive AI governance documentation.',
 'Document approved media types and use cases for AI infrastructure and communicate restrictions to all personnel who access AI systems. Maintain exception records for authorized removable media use on AI infrastructure with documented justification and compensating controls.',
 ARRAY['Approved media documentation', 'Communication records', 'Exception and justification logs']),

-- MP-8: Media Downgrading
('MANAGE 2.4', 'mp-8', 'Supportive',
 'MP-8 media downgrading supports AI system protection by establishing procedures for reducing the classification of media that previously contained sensitive AI artifacts, enabling controlled reuse or release. Addresses media reclassification but not the broader AI system protection framework.',
 'Establish downgrading procedures for media that contained classified or sensitive AI artifacts including model weights, training data, and evaluation results. Verify that downgrading mechanisms adequately remove or overwrite AI artifacts to a level commensurate with the target classification before authorizing media reuse or release.',
 ARRAY['Downgrading procedure documentation', 'Verification records', 'Reclassification authorization logs'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
