Millican Insurance Agency Portal V3

Changes:
- Real Supabase email/password authentication
- Authenticated user's public.profiles record controls admin/agent role
- Active/inactive profile enforcement
- Session restoration after refresh
- No demo password displayed on login screen

Current limitation:
Lead, training, carrier and production screens still use prototype browser data.
Next step is converting those screens to the Supabase tables already created.

The Supabase publishable key included in index.html is a browser/public key by design.
Never add a service_role/secret key or database password to this repository.
