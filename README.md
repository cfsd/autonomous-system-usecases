# autonomous-system-usecases
Here are various docker-compose.yml files.

The commit history before 2018-07-09 is stored in the repository autonomous-system-usecases-old. Some careless commits made the old repository large, so move the files to this new repository.

# Instruction
If wifi is available, download images from dockerhub chalmersfsd.

If wifi is not available, use save and load docker images.

Here's how to save and load docker images:

Example scenario: Copy local docker image to remote machine.

1. Save the image as a tarball (on the host machine)
  
  `docker save repositoryname:tag > repotag.tar`

2. Zip the image (on the host machine)
  
  `gzip repotag.tar`

3. Copy the tarball to the remote machine. (on the host machine)
  
  `scp repotag.tar.gz cfsd@xx.xx.xx.xx:<path to put the tarball>`

4. Unzip The tarball (on the remote machine)
  
  `gunzip repotag.tar.gz`

5. Load the docker image (on the remote machine)
  
  `docker load < repotar.tar`
