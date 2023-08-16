mount /app/output to ../
sudo docker run \
    --rm \
    --mount type=bind,source="$(pwd)",target=/app/ \
    --gpus '"device=0"' \
    -it ldmvfi /bin/bash
