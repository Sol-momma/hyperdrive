.PHONY: setup dev test lint typecheck verify build deploy

setup:
	pnpm install

dev:
	pnpm run dev

test:
	pnpm run test

lint:
	pnpm run lint

typecheck:
	pnpm run typecheck

verify:
	pnpm run verify

build:
	pnpm run build

deploy:
	pnpm run cf:deploy
