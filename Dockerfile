FROM jekyll/jekyll:latest as builder
COPY . /srv/jekyll
RUN jekyll build

FROM caddy:alpine
COPY --from=builder /srv/jekyll/_site /srv
CMD [ "caddy", "run" ]
