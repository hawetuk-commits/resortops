-- phpMyAdmin SQL Dump
-- International Enterprise-Grade Database Schema for Dome Interior and Architects
-- Designed for MySQL 8.0+ / MariaDB with strict security constraints, UTF-8mb4 internationalization, and IDOR/DoS hardening.

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS dome_architects_db;
CREATE DATABASE dome_architects_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE dome_architects_db;

-- 1. Company Profile Table (Core Brand & Localization Metadata)
CREATE TABLE company_profile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    year_established INT NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    office_location VARCHAR(255) NOT NULL,
    primary_phone_1 VARCHAR(50) NOT NULL,
    primary_phone_2 VARCHAR(50),
    brand_colors VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Staff Members Table (Internal Team & Leadership Directory)
CREATE TABLE staff_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    department VARCHAR(100) NOT NULL,
    job_title VARCHAR(150) NOT NULL,
    bio_summary TEXT,
    profile_image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_department (department)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Services Table (Core Offerings Catalog)
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(150) NOT NULL,
    service_slug VARCHAR(150) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    icon_class VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service_slug (service_slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Portfolio Projects Table (Architectural Archetypes & Showcase Master)
CREATE TABLE portfolio_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_title VARCHAR(200) NOT NULL,
    archetype VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    client_name VARCHAR(150),
    description TEXT,
    before_image_url VARCHAR(255),
    after_image_url VARCHAR(255),
    project_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_archetype_category (archetype, category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Project Gallery Images Table (Multi-angle visual design assets supporting sliders)
CREATE TABLE project_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    image_caption VARCHAR(200),
    is_featured BOOLEAN DEFAULT FALSE,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_project_gallery FOREIGN KEY (project_id) REFERENCES portfolio_projects(id) ON DELETE CASCADE,
    INDEX idx_project_order (project_id, display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Consultation Requests Table (Hardened against IDOR with public UUIDs & rate-limiting fields)
CREATE TABLE consultation_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    public_uuid CHAR(36) DEFAULT (uuid()) UNIQUE,
    client_name VARCHAR(150) NOT NULL,
    client_email VARCHAR(150) NOT NULL,
    client_phone VARCHAR(50) NOT NULL,
    service_id INT,
    project_scope TEXT NOT NULL,
    status ENUM('Pending', 'Reviewed', 'In Progress', 'Completed') DEFAULT 'Pending',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    CONSTRAINT fk_consultation_service FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    INDEX idx_status (status),
    INDEX idx_client_email (client_email),
    INDEX idx_ip_address (ip_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Testimonials Table (Verified Client Feedback Portal)
CREATE TABLE testimonials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(150) NOT NULL,
    client_organization VARCHAR(150),
    feedback_text TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    is_approved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_approval (is_approved)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Admin Users Table (Secure Backend Authentication & RBAC Control)
CREATE TABLE admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Super Admin', 'Architect Manager', 'Marketing Editor') DEFAULT 'Architect Manager',
    last_login TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_admin_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed Initial Baseline Data
INSERT INTO company_profile (company_name, year_established, country, city, office_location, primary_phone_1, primary_phone_2, brand_colors) 
VALUES ('Dome interior and Architects', 2015, 'Ethiopia', 'Addis Ababa', 'Addis Ababa, Lideta Flintstone, 3rd Floor', '0921315091', '0911397421', 'Classic Green, White, Black');

INSERT INTO staff_members (full_name, department, job_title, bio_summary) VALUES
('Arch. Anteneh Abebe', 'Executive Leadership / Architectural Design', 'Owner / Founder & Lead Architect', 'Founder and senior architect overseeing overall firm operations and design direction.'),
('Arch. Araya Abrha', 'Architectural Design Unit', 'Senior Architect', 'Specialist in architectural portfolio development and structural design integration.'),
('Mekdes Asgedom', 'Architectural Design Unit', 'Architectural Designer', 'Focuses on spatial planning and modern architectural concepts.'),
('Yonas Jemane', 'Interior Design & Creative', 'Graphics & Interior Designer', 'Expert in visual design aesthetics and interior spatial styling.'),
('Hana', 'Engineering Support', 'Electrical & Sanitary Engineer', 'Manages building services, electrical layouts, and sanitary system designs.'),
('Billy Girma', 'HR & Operations', 'Human Resources Manager', 'Oversees internal personnel structure and administrative operations.'),
('Daniel Abebe', 'HR & Operations', 'Marketing Manager', 'Handles client outreach, brand promotion, and portfolio visibility.');

INSERT INTO services (service_name, service_slug, description) VALUES
('Interior Design', 'interior-design', 'Comprehensive interior spatial layouts, styling, and material selection.'),
('Finishing Works', 'finishing-works', 'High-end architectural finishing and execution works.'),
('Architectural Design', 'architectural-design', 'Full-cycle architectural planning, drafting, and conceptual modeling.'),
('Consulting Services', 'consulting-services', 'Professional engineering, structural, and design advisory services.');

COMMIT;