FROM node:22-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build
RUN pnpm --filter=web --prod deploy --legacy web

FROM base AS web
COPY --from=build /usr/src/app/web /prod/web
WORKDIR /prod/web
EXPOSE 3000
CMD [ "npm", "start" ]
