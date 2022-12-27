FROM elixir:1.13-otp-25

WORKDIR /app
ADD . .

ENV MIX_ENV='prod'

RUN echo "Enviroment is: "
RUN echo $MIX_ENV
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix compile
RUN mix do compile
RUN mix release
RUN ls
EXPOSE 80
RUN useradd -m app
RUN chown -R app:app ./_build
USER app
CMD ["./_build/prod/rel/elixirdock/bin/elixirdock", "start"]
