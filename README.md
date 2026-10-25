# いついく？ (Itsuiku)

候補日が多くても30秒で答えられる、スマホ向けの日程調整Webアプリです。ログイン不要で、URLを送るだけで投票と集計ができます。

A mobile-first scheduling web app for picking a date for dinners and get-togethers. No sign-up: share a URL, everyone answers yes, maybe or no for the candidate dates, and the dates are ranked by attendance.

Live: https://ituiku-snowy.vercel.app

| Desktop | Mobile (create an event) |
| --- | --- |
| ![Top page](docs/images/home.png) | ![Create event on mobile](docs/images/new-mobile.png) |

## Features

- Create an event with many candidate dates using a custom calendar (tap single days or add a range)
- Share one URL; participants answer without an account
- Three answers per date: yes, maybe, no
- Bulk and range voting, so even 30 dates take only a few taps
- Results ranked by attendance with stacked bar charts
- The event owner can close voting and pick the date
- Recently opened events are remembered in the browser (localStorage)

## Tech stack

- [Next.js](https://nextjs.org/) 16 (App Router) and TypeScript, React 19
- [Tailwind CSS](https://tailwindcss.com/) v4
- [Supabase](https://supabase.com/) (Postgres), accessed from Server Actions
- [Zod](https://zod.dev/) for input validation
- [Vitest](https://vitest.dev/) for unit tests, [Biome](https://biomejs.dev/) for lint and format
- Hosted on [Vercel](https://vercel.com/)

## Getting started

The repository uses npm (`package-lock.json`). Node.js 24 or later is recommended.

```sh
git clone https://github.com/Sol-momma/hyperdrive.git
cd hyperdrive
npm ci
npm test          # 53 unit tests
npm run build
npm run dev       # http://localhost:3000
```

The top page and the event form work without a database. To create and vote on events locally, create a Supabase project, run [supabase/migrations/0001_init.sql](supabase/migrations/0001_init.sql) in its SQL editor, and put these in `.env.local` with your own project's values:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`
- `SUPABASE_SERVICE_ROLE_KEY` (server only; never expose it to the browser)

## Project structure

```text
src/
├── app/            # pages: top, /new, /event/[eventId], /event/[eventId]/respond
├── actions/        # Server Actions (create event, submit response, close event)
├── components/     # calendar, voting form, ranking chart, header, sidebar
├── lib/            # schemas, scoring, date formatting, Supabase client
└── types/
supabase/migrations/  # database schema
tests/lib/            # unit tests
docs/                 # strengths write-up and README images
```

More background on the design choices is in [docs/strengths.md](docs/strengths.md) (Japanese).

## License

No license has been chosen yet; all rights reserved by Sol-momma.
