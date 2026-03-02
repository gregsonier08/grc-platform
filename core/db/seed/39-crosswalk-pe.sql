-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — PE Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 PE controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- PE-1: Policy and Procedures
('GOVERN 1.1', 'pe-1', 'Partial',
 'PE-1 establishes the physical and environmental protection policy framework that can incorporate AI-specific requirements for protecting GPU clusters, model storage facilities, and training infrastructure. Addresses the policy layer for physical protection but not the full scope of AI risk management policies.',
 'Extend PE-1 policy to address physical protection requirements for AI-specific infrastructure including GPU compute clusters, high-performance storage systems for training data and model weights, and specialized cooling infrastructure for AI workloads. Define physical protection tiers based on AI system criticality and data sensitivity.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'pe-1', 'Partial',
 'PE-1 procedures define organizational physical protection processes that support AI risk management through structured physical security for AI infrastructure components. Addresses physical process discipline but not AI-specific risk tolerance determination.',
 'Define physical protection procedures for AI infrastructure covering access control to GPU clusters, environmental monitoring for AI compute facilities, and physical security for media containing model weights and training data. Establish procedures that account for the high concentration of compute resources and sensitive data typical of AI deployments.',
 ARRAY['Policy documents', 'PE procedure documentation', 'AI infrastructure protection procedures']),

-- PE-2: Physical Access Authorizations
('MANAGE 2.4', 'pe-2', 'Supportive',
 'PE-2 physical access authorizations support AI system protection by ensuring that only vetted and authorized individuals can physically access facilities housing AI training clusters, model storage, and inference infrastructure. Addresses physical authorization but not the broader AI system protection mechanisms.',
 'Maintain authorization lists for facilities housing AI infrastructure including GPU clusters, training data storage, and model serving equipment. Review and update physical access authorizations when AI personnel change roles or when AI infrastructure is relocated, and ensure authorization levels reflect the sensitivity of AI assets in each facility area.',
 ARRAY['Physical access authorization lists', 'Review and update records', 'AI facility zone documentation']),

-- PE-3: Physical Access Control
('MANAGE 2.4', 'pe-3', 'Supportive',
 'PE-3 physical access controls protect AI infrastructure integrity by enforcing authorized entry to facilities containing AI compute resources, model storage, and training data. Addresses physical entry control but not the broader AI system protection framework.',
 'Enforce physical access controls at facilities housing AI training clusters, inference servers, and model storage systems using authentication mechanisms appropriate for the sensitivity of AI assets. Apply enhanced physical controls such as multi-factor entry, mantrap vestibules, or biometric authentication for areas containing production AI model weights or sensitive training data.',
 ARRAY['Physical access control configurations', 'Entry point documentation', 'Authentication mechanism records']),

-- PE-4: Access Control for Transmission
('MANAGE 2.4', 'pe-4', 'Supportive',
 'PE-4 transmission access controls support AI system protection by preventing physical tampering with network cabling that carries AI training data, model weights, and inference traffic. Provides physical layer protection for AI data in transit within facilities.',
 'Control physical access to network transmission lines that carry AI training data, model distribution traffic, and inference communications. Protect cabling infrastructure connecting AI compute clusters, storage arrays, and model serving endpoints using conduit, locked wiring closets, or physical tamper detection to prevent interception or modification of AI data in transit.',
 ARRAY['Transmission infrastructure documentation', 'Physical protection configurations', 'Cabling security records']),

-- PE-5: Access Control for Output Devices
('MANAGE 2.4', 'pe-5', 'Supportive',
 'PE-5 output device access controls support AI system protection by preventing unauthorized viewing or capture of AI system outputs including model predictions, training metrics, and evaluation results displayed on screens or produced by printers. Addresses output-level physical security for AI systems.',
 'Control physical access to output devices that display or produce AI system information including training dashboards, model evaluation results, inference outputs, and performance metrics. Position AI monitoring displays and restrict printer access in areas where AI system outputs may contain sensitive information such as model architecture details or training data samples.',
 ARRAY['Output device placement documentation', 'Access restriction records', 'AI display security configurations']),

-- PE-6: Monitoring Physical Access
('MANAGE 2.4', 'pe-6', 'Partial',
 'PE-6 physical access monitoring supports AI system protection by detecting unauthorized physical access to AI infrastructure that could lead to model tampering, training data theft, or inference service disruption. Addresses physical monitoring but not the broader AI system protection mechanisms.',
 'Monitor physical access to facilities housing AI training clusters, model storage, and inference infrastructure to detect unauthorized entry attempts and suspicious access patterns. Review physical access logs for AI facility areas and correlate unusual physical access with AI system change logs to identify potential physical tampering with AI infrastructure.',
 ARRAY['Physical access monitoring logs', 'Access review records', 'Correlation analysis documentation']),

-- PE-9: Power Equipment and Cabling
('MANAGE 2.2', 'pe-9', 'Supportive',
 'PE-9 power equipment protection supports AI system availability by safeguarding electrical infrastructure that supplies GPU clusters, training systems, and inference servers from damage and destruction. Provides foundational power resilience for AI infrastructure.',
 'Protect power equipment and cabling for AI compute infrastructure including GPU cluster power distribution, high-density rack power feeds, and cooling system electrical supplies. Apply enhanced power protection for AI infrastructure areas that consume significantly more power than standard computing facilities due to GPU and accelerator hardware requirements.',
 ARRAY['Power infrastructure documentation', 'Protection measure records', 'AI power requirement assessments']),

-- PE-10: Emergency Shutoff
('MANAGE 2.2', 'pe-10', 'Supportive',
 'PE-10 emergency shutoff supports AI system safety by providing the capability to immediately cut power to AI infrastructure in emergency situations such as electrical fires, coolant failures, or equipment malfunctions. Addresses emergency power control but not the broader AI system value sustainment.',
 'Include AI GPU clusters, training systems, and inference servers in emergency power shutoff planning. Place emergency shutoff controls in accessible locations near AI compute areas and ensure personnel are trained on shutoff procedures that account for the impact of abrupt power loss on active training jobs and model serving operations.',
 ARRAY['Emergency shutoff procedures', 'Shutoff switch location documentation', 'Training records']),

-- PE-11: Emergency Power
('MANAGE 2.2', 'pe-11', 'Partial',
 'PE-11 emergency power supports AI system availability by providing uninterruptible power to enable orderly shutdown or continued operation of critical AI inference workloads during primary power failures. Addresses power continuity but not the broader AI value sustainment framework.',
 'Provide uninterruptible power supplies for critical AI inference systems to enable graceful shutdown or continued operation during power disruptions. Size emergency power capacity to support orderly completion or checkpointing of active AI training jobs and continued operation of time-critical inference services until primary power is restored or alternate power is available.',
 ARRAY['UPS configuration records', 'Capacity planning documentation', 'AI workload priority classifications']),

-- PE-13: Fire Protection
('MANAGE 2.2', 'pe-13', 'Supportive',
 'PE-13 fire protection supports AI infrastructure availability by ensuring fire detection and suppression systems protect high-density GPU clusters and data storage areas that house AI model weights and training data. Provides environmental protection for AI infrastructure.',
 'Install and maintain fire detection and suppression systems in areas housing AI GPU clusters, high-performance storage systems, and network infrastructure supporting AI operations. Use suppression methods appropriate for high-value electronic equipment in AI compute areas and ensure fire protection systems account for the elevated heat generation typical of GPU-intensive AI workloads.',
 ARRAY['Fire protection system documentation', 'Inspection and maintenance records', 'AI facility coverage assessments']),

-- PE-14: Environmental Controls
('MANAGE 2.2', 'pe-14', 'Partial',
 'PE-14 environmental controls support AI system reliability by maintaining temperature, humidity, and airflow conditions that prevent hardware degradation in GPU clusters and AI compute infrastructure. AI workloads generate significantly more heat than standard computing, making environmental controls critical for availability.',
 'Maintain temperature, humidity, and airflow controls optimized for AI compute hardware including GPU clusters that generate substantially more heat than standard server equipment. Monitor environmental conditions continuously in AI infrastructure areas and configure alerts for conditions approaching hardware operating limits to enable proactive response before AI system performance degrades.',
 ARRAY['Environmental monitoring records', 'Temperature and humidity logs', 'Alert configuration documentation']),

-- PE-16: Delivery and Removal
('MANAGE 2.4', 'pe-16', 'Supportive',
 'PE-16 delivery and removal controls support AI system protection by governing the physical entry and exit of hardware components that may contain model weights, training data, or AI configurations. Addresses component movement control but not the broader AI system protection framework.',
 'Authorize and control delivery and removal of AI infrastructure components including GPU accelerators, storage media containing model weights, and hardware with AI configurations. Maintain records of AI component movements to support asset tracking and ensure that components removed from AI facilities are sanitized of sensitive AI artifacts before leaving controlled areas.',
 ARRAY['Delivery and removal authorization records', 'Component movement logs', 'Sanitization verification documentation']),

-- PE-17: Alternate Work Site
('MANAGE 2.2', 'pe-17', 'Supportive',
 'PE-17 alternate work site controls support AI system continuity by enabling AI system administration, monitoring, and oversight from approved alternate locations when primary facilities are unavailable. Addresses work location flexibility but not the broader AI value sustainment framework.',
 'Enable AI system administration and monitoring from approved alternate work sites with security controls equivalent to primary facilities. Ensure alternate work sites support secure remote access to AI management interfaces, model monitoring dashboards, and incident response tools while maintaining authentication and encryption requirements for AI system management traffic.',
 ARRAY['Alternate work site documentation', 'Security control equivalency assessments', 'Remote access configuration records']),

-- PE-18: Location of System Components
('MAP 1.1', 'pe-18', 'Partial',
 'PE-18 component location documentation supports understanding of AI deployment context by requiring organizations to document where AI infrastructure is physically positioned, which informs both security planning and operational risk assessment. Addresses physical placement but not the broader AI context documentation.',
 'Document physical locations of AI compute clusters, model storage systems, training data repositories, and inference serving infrastructure within organizational facilities. Position AI infrastructure to minimize exposure to physical and environmental hazards while maintaining proximity to required power, cooling, and network infrastructure.',
 ARRAY['AI component location documentation', 'Facility layout records', 'Hazard proximity assessments']),

('MANAGE 2.4', 'pe-18', 'Supportive',
 'PE-18 component positioning supports AI system protection by minimizing physical and environmental risks to AI infrastructure through strategic placement within facilities. Addresses placement-based risk reduction but not the broader AI system protection mechanisms.',
 'Position AI infrastructure components to minimize unauthorized physical access opportunities while maintaining operational requirements for power density, cooling capacity, and network connectivity. Locate AI model storage and training data systems in areas with restricted physical access and appropriate environmental controls.',
 ARRAY['Component positioning rationale', 'Access minimization documentation', 'Environmental suitability records']),

-- PE-20: Asset Monitoring and Tracking
('MAP 1.1', 'pe-20', 'Supportive',
 'PE-20 asset monitoring supports AI infrastructure inventory by providing mechanisms to track the physical location and movement of AI hardware assets including GPU accelerators and storage devices containing model data. Addresses asset tracking but not the broader AI deployment context documentation.',
 'Track and monitor the location and movement of AI infrastructure components including GPU accelerators, specialized AI processors, and storage devices containing model weights or training data. Use asset tracking to maintain an accurate inventory of AI compute resources and detect unauthorized relocation of AI infrastructure components.',
 ARRAY['Asset tracking records', 'AI hardware inventory', 'Movement detection logs']),

-- PE-23: Facility Location
('MANAGE 2.2', 'pe-23', 'Supportive',
 'PE-23 facility location planning supports AI system availability by requiring consideration of physical and environmental hazards when siting facilities that house AI infrastructure. Provides location-level risk reduction for AI compute and storage resources.',
 'Consider physical and environmental hazards when planning facility locations for AI infrastructure including flood risk, seismic activity, and proximity to potential threat sources. Account for AI-specific facility requirements such as high-density power availability, cooling capacity for GPU workloads, and network connectivity for AI data pipelines when selecting facility sites.',
 ARRAY['Facility location planning records', 'Hazard assessment documentation', 'AI infrastructure requirement specifications'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
