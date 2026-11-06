# Portfolio GitHub Pages + Supabase setup

## 1. Configure the public Supabase browser values
Open `supabase-config.js` and replace:
- `https://YOUR-PROJECT-REF.supabase.co` with your Supabase Project URL.
- `YOUR_SUPABASE_PUBLISHABLE_KEY` with the `sb_publishable_...` key from Supabase API Keys.

These two values are intended for browser use. NEVER put a Supabase `sb_secret_...` key or legacy `service_role` key in this website.

## 2. Configure the database
In Supabase Dashboard, open SQL Editor, paste all of `supabase-setup.sql`, and run it.
The policy grants public visitors permission to INSERT contact messages only. Only the admin UUID below can SELECT and DELETE them.

Admin Auth UID configured in SQL and admin.html:
`c29f6e85-0171-4c7d-9e03-7d5d969fe788`

## 3. Admin sign-in
Use the Supabase Auth user whose UID matches the configured admin UID. Set/reset its password in Supabase Authentication > Users if needed. Open:
`https://YOUR-GITHUB-USERNAME.github.io/Portfolio/admin.html`

If your GitHub Pages repository path is `/Portfolio/`, relative config and script paths work as included.

## 4. Publish
Upload/commit all files in this ZIP to the root of the GitHub repository, replacing the existing `index.html` and adding:
- `admin.html`
- `supabase-config.js`
- `supabase-setup.sql`

Then wait for GitHub Pages to publish. Test a message from the public Contact form, then sign in to `/Portfolio/admin.html`.

## Important
- GitHub Pages does not use Vercel Environment Variables. The browser config must be in `supabase-config.js`.
- The publishable key can be public only because Row Level Security is enabled. Keep the secret key private.
- Do not make the admin UUID or SQL policy permissive. Never add a public SELECT policy to messages.
