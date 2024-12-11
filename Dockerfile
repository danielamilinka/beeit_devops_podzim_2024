FROM alpine AS test  
WORKDIR /home/DockerFile
COPY ./test /home/DockerFile/
RUN go test -v -> tests_output.txt



FROM alpine 
WORKDIR /home/DockerFile
COPY ./script2.sh  /home/DockerFile/script2.sh
COPY --from=test tests_output.txt /home/DockerFile/tests_output.txt
RUN chmod +x /home/DockerFile/script2.sh
ENTRYPOINT ["/bin/sh", "/home/DockerFile/script2.sh"]
CMD ["DIR"]