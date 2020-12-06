FROM uselagoon/node-14-builder:latest as builder
COPY ./app/package.json ./app/yarn.lock /app/
COPY ./app /app/
RUN yarn install

FROM uselagoon/node-14-builder:latest as deployer-builder
COPY ./deployer/package.json ./deployer/yarn.lock /app/
COPY ./deployer /app/
RUN yarn install


FROM uselagoon/node-14:latest
RUN apk add rsync

COPY --from=builder /app/ /build/
COPY --from=deployer-builder /app/ /app/


EXPOSE 3000

CMD ["yarn", "run", "start"]
