# PubKey Protocol Demo

A demonstration application for the PubKey Protocol, the social layer on Solana.

The protocol allows users to link verified accounts from multiple identity providers to their profile on Solana.

## Overview

This demo is a working implementation of PubKey Protocol (currently) on Solana Devnet. It allows users to:

- Create a Profile using a Solana wallet
- Link accounts from multiple identity providers (Discord, GitHub, Google, X/Twitter)
- Connect additional Solana wallets
- Set an avatar, display name, and bio

## Prerequisites

- Node.js (v20 or later)
- pnpm (v9 or later)
- Docker and Docker Compose (for local development with Postgres)
- Solana CLI tools
- Run `pnpm anchor localnet` in the [PubKey Protocol](https://github.com/pubkeyapp/pubkey-protocol) repo.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/pubkeyapp/pubkey-protocol-demo.git
cd pubkey-protocol-demo
```

### 2. Install dependencies

```bash
pnpm install
```

### 3. Set up environment variables

Copy the example environment file and update it with your settings:

```bash
cp .env.example .env
```

Required environment variables:

- `COOKIE_SECRET`: Generate a random secret using `openssl rand -hex 32`
- `DATABASE_URL`: Postgres connection string (default:
  `postgresql://pubkey-protocol-demo:pubkey-protocol-demo@localhost:5432/pubkey-protocol-demo?schema=public`)
- `DOMAIN`: Server domain (use `localhost` for local development)
- `PORT`: Server port (default: 3000)
- `SOLANA_FEE_PAYER_AUTHORITY`: Fee payer authority keypair (generate using `solana-keygen`)
- `SOLANA_FEE_PAYER_COMMUNITY`: Fee payer community keypair (generate using `solana-keygen`)
- `SOLANA_RPC_ENDPOINT`: Solana blockchain RPC endpoint (use `http://localhost:8899` for local development)

### 4. Start the database

```bash
pnpm dev:services
```

This will start a Postgres database using Docker Compose.

### 5. Run the setup script to create the database and tables

```bash
pnpm run setup
```

### 6. Run the application in development mode

Make sure you are running the [PubKey Protocol](https://github.com/pubkeyapp/pubkey-protocol) localnet.

```bash
pnpm dev
```

The application will be available at http://localhost:5173.

## Building for Production

To build the application for production:

```bash
pnpm build
```

To start the production server:

```bash
pnpm start
```

## Docker Support

You can build and run the application using Docker:

```bash
# Build the Docker image
pnpm docker:build

# Run the Docker container
pnpm docker:run
```

## Solana Validator

For local development with Solana, you can run a test validator:

```bash
pnpm validator
```

## Project Structure

- `app/`: Main application code
  - `api/`: API endpoints
  - `features/`: Feature-specific components and logic
  - `lib/`: Utility functions and shared code
  - `pubkey/`: PubKey protocol integration
  - `ui/`: UI components
- `prisma/`: Database schema and migrations

## License

See [LICENSE](LICENSE) file for details.
