# Kuriftu Resorts & Spa — Enterprise UI/UX Master Design & Architecture Prompt for Stitch

Generate a comprehensive, production-grade luxury hospitality web application for **Kuriftu Resorts & Spa (Boston Partners PLC)**[cite: 2] using React and Tailwind CSS. The design must be built strictly to international elite resort standards (Aman / Six Senses design patterns), translating a complex enterprise database schema and rich client questionnaire requirements into a high-conversion, visually stunning digital platform.

The architecture must distinctly separate the **Public-Facing Guest Experience (Visible UI)** from the **Invisibly Handled Back-End Infrastructure (Hidden Logic)**.

---

## Part I: The Public-Facing Guest Experience (Visible UI)

### 1. Design System & Aesthetic Foundation

- **Primary Brand Color:** Dark Green (`#1E5631`) — Representing lush lakeside ecosystems, sustainability, and nature[cite: 2].
- **Luxury Accent Color:** Gold (`#C9A227`) — Used sparingly for interactive highlights, active states, delicate borders, and primary CTAs[cite: 2].
- **Neutral Palette:** Warm creams (`#FBF9F6`), soft off-whites, and dark charcoal (`#1A1A1A`) for sophisticated editorial typography.
- **Typography:** Headings set in 'Poppins' (geometric elegance), body text set in 'Open Sans' (superior legibility)[cite: 2].
- **Core Brand Slogan:** Must be prominently displayed: _"Built by Ethiopia. Shared with the world."_[cite: 2]

### 2. Global Header, Logo Placement & Multi-Context Navigation

- **Logo Placement Architecture:** Positioned on the top-left of the navigation bar, featuring a bespoke, minimalist monogram/emblem representing the Kuriftu crown and lakeside heritage, rendered in metallic gold (`#C9A227`) on dark backdrops and deep green on light headers, with a balanced 24px clearance padding.
- **Top Announcement Bar:** Multi-language selector supporting English and Amharic (አማርኛ), a dynamic currency switcher (ETB / USD), and direct front desk contact links (`+251 911 091 185`)[cite: 2].
- **Main Navigation:** Left-aligned custom Logo; centered editorial navigation (_Resorts, Stay, Dining, Spa, Water Park, Experiences, Resort Map, Careers_); right-aligned utility icons (Search, Account, and a persistent gold primary button: "Book Now").

### 3. Cinematic Homepage Master Layout (`/`)

- **Hero Section:** Full-bleed high-resolution visual container featuring slow-zoom ambient animations, an editorial dark overlay, the official brand slogan (_"Built by Ethiopia. Shared with the world."_), and an integrated floating Glassmorphism Unified Booking Bar (Property Selector, Check-in/out Dates, Guest Counter, and a "Check Availability" CTA)[cite: 2].
- **Brand Heritage & Craftsmanship Section:** Editorial 2-column layout highlighting 24 years of operation (established in 2002), in-house artisanal woodworking and furniture fabrication, and over 2,000 sustainable jobs created across Ethiopia[cite: 2].
- **Destination & Experience Grid:** Asymmetrical masonry cards allowing users to seamlessly explore signature locations like Bishoftu Lake, Entoto, and Bahir Dar[cite: 2].

### 4. Interactive Resort Map Experience (`/resort-map`)

- **Spatial Discovery UI:** A clean vector/satellite layout map of the Bishoftu resort property grounds.
- **Interactive Pins:** Clickable spatial nodes for Lakefront Villas, Kuriftu Spa, Water Park, and Dining Outlets that trigger a smooth slide-over preview drawer equipped with quick booking triggers.

### 5. Accommodation & Room Booking Flow (`/rooms`)

- **Catalog Grid:** Clean cards showcasing 150 fireplace-equipped rooms, premium bedding, panoramic lake views, base pricing, and occupancy badges[cite: 2].
- **Dynamic Availability Calendar:** Real-time date picker syncing availability status seamlessly.

### 6. Dynamic Restaurant Menu & Table Reservation Hub (`/dining`)

- **Filterable Culinary Hub:** Category tabs paired with dietary filter pills (**Fasting, Vegan, Gluten-Free**) and detailed culinary item cards[cite: 2].
- **Table Reservation Widget:** Real-time time slot selector, party size, minimum spend/deposit details, and table confirmation modal.

### 7. Custom Experience & Itinerary Portals (`/experiences`)

- **Water Park Portal (`/water-park`):** Family-focused ticketing engine featuring access package tiers, date pickers, and group event options[cite: 2].
- **Spa Sanctuary Portal (`/spa`):** Treatment catalog grid displaying duration indicators, pricing, description cards, and combined couples-massage slot booking flows[cite: 2].
- **Conferences, Weddings & Events:** Meeting hall selectors featuring interactive layout configuration previews (Banquet, Classroom, Theater styles) and an integrated Request for Quote (RFQ) form builder[cite: 2].

### 8. Careers & Talent Portal (`/careers`)

- **Departmental Job Board:** Dynamic listing cards sourced from active internal departments (Front Office, Housekeeping, F&B, Wellness, Engineering, HR, Finance)[cite: 1, 2].
- **Interactive Candidate Modal:** Professional application inputs for Full Name, Email, Phone, Department selector dropdown, Cover Letter text area, and a drag-and-drop PDF CV upload component routing submissions to `careers@kurifturesorts.com`[cite: 2].

### 9. Contact & Support Center (`/contact`)

- **Split Layout:** Interactive location map pinpoints for physical properties, executive reservation phone directories, secure inquiry forms, and a persistent floating WhatsApp live chat widget trigger[cite: 2].
- **Footer Structure:** Comprehensive multi-column corporate footer containing brand story snippets, newsletter subscription input, legal/privacy cancellation terms, and social media connectivity.

---

## Part II: The Invisible Back-End & Administrative Architecture (Hidden Logic)

### 1. Relational Database Mapping (`MySQL Schema Integration`)

- **User Accounts & Profiles:** Secure linking of customer profiles (`users`, `addresses`) to historical data[cite: 1].
- **Inventory & Resource Engines:** Automated background calculations synchronizing room inventory (`rooms`, `room_availability`), table capacities (`restaurant_tables`, `table_reservations`), and slot conflict management for spa/activity bookings[cite: 1].
- **Transactional & Payment Records:** Secure processing pipelines handling order items, water park tickets, and payment logs (`payments`, `orders`, `tickets`)[cite: 1].

### 2. System Automation & Workflow Routing

- **Candidate Processing:** Automated parsing and routing of career applications from the front-end modal directly to `careers@kurifturesorts.com`[cite: 1, 2].
- **Departmental Notifications:** Background dispatching of service requests to internal operational teams (Front Office, Housekeeping, Food & Beverage, Wellness & Spa, Human Resources, Sales & Marketing, Finance & Accounting)[cite: 1, 2].

### 3. Restricted Enterprise Admin Dashboard (`/admin`)

- **Management Interface:** A secure, enterprise-grade admin layout featuring sidebar navigation, statistics cards, data tables, filters, status badges, and full CRUD control over properties, room types, staff records (`staff`, `departments`), and active bookings[cite: 1, 2].
