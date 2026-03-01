-- GRC Platform Database Schema
-- NIST SP 800-53 Rev 5 + AI RMF Crosswalk
-- Phase 1: NIST 800-53 tables
-- Phase 2: AI RMF + crosswalk tables

-- ============================================================
-- PHASE 1: NIST SP 800-53 Rev 5
-- ============================================================

CREATE TABLE IF NOT EXISTS nist_families (
    family_id   VARCHAR(10)  PRIMARY KEY,  -- e.g. 'ac', 'au'
    name        VARCHAR(100) NOT NULL,     -- e.g. 'Access Control'
    abbreviation VARCHAR(10) NOT NULL      -- e.g. 'AC'
);

CREATE TABLE IF NOT EXISTS nist_controls (
    control_id   VARCHAR(20)  PRIMARY KEY,  -- e.g. 'ac-2'
    family_id    VARCHAR(10)  NOT NULL REFERENCES nist_families(family_id),
    number       VARCHAR(10)  NOT NULL,     -- e.g. '2', '2.1'
    title        VARCHAR(200) NOT NULL,
    description  TEXT,
    guidance     TEXT,
    is_enhancement BOOLEAN NOT NULL DEFAULT FALSE,
    parent_id    VARCHAR(20)  REFERENCES nist_controls(control_id)
);

CREATE TABLE IF NOT EXISTS nist_baselines (
    id          SERIAL       PRIMARY KEY,
    control_id  VARCHAR(20)  NOT NULL REFERENCES nist_controls(control_id),
    level       VARCHAR(10)  NOT NULL CHECK (level IN ('low', 'moderate', 'high')),
    UNIQUE (control_id, level)
);

CREATE TABLE IF NOT EXISTS nist_params (
    id          SERIAL       PRIMARY KEY,
    control_id  VARCHAR(20)  NOT NULL REFERENCES nist_controls(control_id),
    param_id    VARCHAR(30)  NOT NULL,     -- e.g. 'ac-2_prm_1'
    label       TEXT         NOT NULL,
    UNIQUE (control_id, param_id)
);

CREATE TABLE IF NOT EXISTS nist_related_controls (
    id              SERIAL      PRIMARY KEY,
    control_id      VARCHAR(20) NOT NULL REFERENCES nist_controls(control_id),
    related_id      VARCHAR(20) NOT NULL,  -- may not always exist in DB
    UNIQUE (control_id, related_id)
);

-- ============================================================
-- CATALOG VERSION TRACKING
-- ============================================================

CREATE TABLE IF NOT EXISTS catalog_versions (
    id              SERIAL       PRIMARY KEY,
    catalog_name    VARCHAR(50)  NOT NULL,    -- e.g. 'nist-800-53'
    version         VARCHAR(20)  NOT NULL,    -- e.g. '5.2.0'
    source_hash     VARCHAR(64)  NOT NULL,    -- SHA-256 of source JSON
    applied_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    migration_type  VARCHAR(20)  NOT NULL CHECK (migration_type IN ('seed', 'migration')),
    notes           TEXT
);

-- ============================================================
-- PHASE 2: NIST AI RMF + CROSSWALK
-- ============================================================

CREATE TABLE IF NOT EXISTS ai_rmf_functions (
    function_id  VARCHAR(20)  PRIMARY KEY,  -- e.g. 'GOVERN'
    name         VARCHAR(50)  NOT NULL,
    description  TEXT
);

CREATE TABLE IF NOT EXISTS ai_rmf_categories (
    category_id  VARCHAR(20)  PRIMARY KEY,  -- e.g. 'GOVERN 1'
    function_id  VARCHAR(20)  NOT NULL REFERENCES ai_rmf_functions(function_id),
    name         VARCHAR(200) NOT NULL,
    description  TEXT
);

CREATE TABLE IF NOT EXISTS ai_rmf_subcategories (
    subcategory_id  VARCHAR(20)  PRIMARY KEY,  -- e.g. 'GOVERN 1.1'
    category_id     VARCHAR(20)  NOT NULL REFERENCES ai_rmf_categories(category_id),
    description     TEXT         NOT NULL
);

CREATE TABLE IF NOT EXISTS crosswalk_mappings (
    id               SERIAL       PRIMARY KEY,
    subcategory_id   VARCHAR(20)  NOT NULL REFERENCES ai_rmf_subcategories(subcategory_id),
    control_id       VARCHAR(20)  NOT NULL REFERENCES nist_controls(control_id),
    coverage_level   VARCHAR(20)  NOT NULL CHECK (coverage_level IN ('Direct', 'Strong', 'Partial', 'Supportive')),
    rationale        TEXT,
    guidance         TEXT,
    evidence_types   TEXT[],
    UNIQUE (subcategory_id, control_id)
);
