#/bin/bash
docker run -p 4440:4440 -e EXTERNAL_SERVER_URL=serveraress:4440 --name cloud-rundeck -t latestrundeck -v data:/home/rundeck/server/data
