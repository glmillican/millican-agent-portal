Millican Agency Portal V6.1 - Integrated Medicare Fact Finder

INSTALL ORDER
1. Supabase > SQL Editor: run V6_1_DATABASE_MIGRATION.sql once.
2. Confirm: Success. No rows returned.
3. Replace the GitHub Pages index.html with this V6.1 index.html.
4. Keep your existing logo.png unchanged.
5. Let GitHub Pages deploy, then hard refresh the portal (Ctrl+Shift+R).

TEST
1. Open an EXISTING assigned lead.
2. Click Fact Finder.
3. Name and phone should prefill from the lead.
4. Complete a few fields and click Save Fact Finder.
5. Close/reopen the lead and confirm the data reloads.
6. Click Download Fact Finder PDF and confirm the one-page PDF downloads.

SECURITY
- Fact Finder data is stored separately from normal lead-list data.
- RLS allows admins or the currently assigned agent to read/write the Fact Finder.
- SSN, Medicare ID and Medicaid ID are not queried for dashboard/list views.
- No anonymous/public policy is created.
