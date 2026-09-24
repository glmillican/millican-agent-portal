MILLICAN AGENCY PORTAL V6.0 — LEAD INTAKE

1. In Supabase SQL Editor, run V6_DATABASE_MIGRATION.sql ONCE.
2. Confirm: Success. No rows returned.
3. Upload index.html to GitHub, replacing the current index.html.
4. Let GitHub Pages deploy, then hard-refresh the portal.

V6 adds:
- Agency Lead Inbox
- Lead Source
- Campaign / Event
- Source Detail
- New Intake vs Returned lead counts
- Source filtering/search
- Assignment only to active Lead Co-op members
- Admin manual intake feeds the same inbox
- Agent-created leads remain personal and bypass the Agency Lead Inbox

IMPORTANT:
This version does NOT yet open the database to Meta or public web forms.
That connection should use a secure server-side intake endpoint, not a public anonymous INSERT policy.
