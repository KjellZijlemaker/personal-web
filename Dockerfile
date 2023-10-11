# start from an official image
FROM python:3.12.0

ENV ENV=PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.6.1

# System deps:
RUN pip install "poetry==$POETRY_VERSION"

# arbitrary location choice: you can change the directory
RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src

# install our dependencies
COPY poetry.lock pyproject.toml /opt/services/djangoapp/src/

# Project initialization:
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

# copy our project code
COPY . /opt/services/djangoapp/src
RUN cd kjellzijlemaker \
    && python manage.py collectstatic --no-input -v 2

# expose the port 8000
EXPOSE 8000

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "kjellzijlemaker", "--bind", ":8000", "kjellzijlemaker.wsgi:application"]