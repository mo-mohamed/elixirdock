FROM elixir:1.13-otp-25

WORKDIR /app
COPY . .

ENV MIX_ENV='prod'
RUN echo $MIX_ENV
RUN echo "hello"
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile
RUN mix do compile
RUN mix release



FROM elixir:1.13-otp-25
EXPOSE 80
RUN useradd -m app
WORKDIR '/my_app'
COPY --from=0 /app/_build .
RUN chown -R app:app ./prod
USER app
CMD ["./prod/rel/elixirdock/bin/elixirdock", "start"]
