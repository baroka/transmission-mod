# build:
#  docker build -t baroka/transmission-mod .

FROM scratch

# Copy local files
COPY root/ /