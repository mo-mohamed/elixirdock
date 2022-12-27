# FROM elixir:1.13-otp-25

# WORKDIR /app
# COPY . .

# ENV MIX_ENV='prod'

# RUN echo "Enviroment is: "
# RUN echo $MIX_ENV
# RUN mix local.hex --force
# RUN mix local.rebar --force
# RUN mix compile
# RUN mix do compile
# RUN mix release



# FROM elixir:1.13-otp-25
# EXPOSE 80
# RUN useradd -m app
# WORKDIR '/my_app'
# COPY --from=0 /app/_build .
# RUN chown -R app:app ./prod
# USER app
# CMD ["./prod/rel/elixirdock/bin/elixirdock", "start"]

FROM python:2.7

# Add sample application
ADD application.py /tmp/application.py

EXPOSE 8000

# Run it
ENTRYPOINT ["python", "/tmp/application.py"]

