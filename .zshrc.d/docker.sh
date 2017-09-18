# Docker alias

# http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-containers
alias rm_docker_not_running_containers='docker rm $(docker ps -q -f status=exited)'


alias rm_docker_untagged_images='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
# Use `docker-cleanup --dry-run` to see what would be deleted.

function docker-cleanup {
    EXITED=$(docker ps -q -f status=exited)
    DANGLING=$(docker images -q -f "dangling=true")

    if [ "$1" == "--dry-run" ]; then
        echo "==> Would stop containers:"
        echo $EXITED
        echo "==> And images:"
        echo $DANGLING
    else
        if [ -n "$EXITED" ]; then
            docker rm $EXITED
        else
            echo "No containers to remove."
        fi
        if [ -n "$DANGLING" ]; then
            docker rmi $DANGLING
        else
            echo "No images to remove."
        fi
    fi
}

