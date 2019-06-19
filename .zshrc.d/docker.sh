# Docker alias

# http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-containers
alias docker_rm_not_running_containers='docker rm $(docker ps -q -f status=exited)'


alias docker_rm_untagged_images='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'


# Delete all containers
# docker rm $(docker ps -a -q)
# Delete all images
# docker rmi $(docker images -q)
alias docker_initialize='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

# Update all running containers status to no.
# Let them can stop later
alias docker_update_running_containers_to_restart_no='docker update --restart=no $(docker ps -a -q)'

alias docker_stop_running_containers='docker stop $(docker ps -a -q)'

# Use `docker-cleanup --dry-run` to see what would be deleted.

# Remove all containers
alias docker_rm_all_containers='docker rm $(docker ps -aq)'

# Remove all images
alias docker_rm_all_images='docker rmi $(docker images -q)'

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




