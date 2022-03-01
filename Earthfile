VERSION 0.6
FROM python:3
WORKDIR /circle_ci_python_example

build:
  COPY ./requirements.txt .
  RUN pip install -r requirements.txt
  COPY . .

lint:
  FROM +build
  RUN pylint my_media/ media_organizer/

test:
  FROM +build
  COPY . .
  WITH DOCKER --compose docker-compose.yml
      RUN sleep 20 && python manage.py test
  END
  SAVE ARTIFACT test_results/results.xml test_results/results.xml AS LOCAL ./test_results/results.xml

docker:
  FROM +build
  ENTRYPOINT ["python", "manage.py"," runserver", "0.0.0.0:8000"]
  SAVE IMAGE --push jalletto/circle_ci_python_example