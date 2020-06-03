FROM jupyter/minimal-notebook as converter

USER root

WORKDIR /data

COPY . .

RUN find . -type f -name "*.ipynb" -execdir jupyter nbconvert --to html --no-input --template basic {} \;


FROM nginx:alpine as server

COPY --from=converter /data/notebooks .