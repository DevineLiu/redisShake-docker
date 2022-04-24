FROM golang:1.16 as builder
RUN git clone -b 'release-v2.1.2-20220329' --single-branch --depth 1 https://github.com/alibaba/RedisShake.git /workspace/RedisShake
WORKDIR /workspace/RedisShake
COPY ./build.sh /workspace/RedisShake/build.sh
RUN chmod +x  build.sh
RUN  make build


FROM alpine:3.15.3

COPY --from=builder /workspace/RedisShake/bin/redis-shake.linux /redis-shake
COPY --from=builder /workspace/RedisShake/conf/redis-shake.conf /redis-shake.conf
ENV TYPE sync
CMD /redis-shake -type=${TYPE} -conf=/redis-shake.conf
