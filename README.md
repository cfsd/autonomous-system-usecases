# Chalmers formula student driverless

## GitHub repositories index

Perception parts - process sensor data

- cfsd18-perception-detectcone
- cfsd18-sensation-attention
- cfsd18-perception-ukf
- opendlv-logic-cfsd18-sensation-slam

Cognition parts - plan the path

- cfsd18-cognition-detectconelane
- cfsd18-cognition-track
- cfsd18-cognition-acceleration
- cfsd18-perception-skidpad

Action parts - action on the race car

- cfsd18-logic-action-steering
- cfsd18-logic-action-brakes
- cfsd18-logic-action-motion

Interface to the car

- cfsd18-proxy-lynx-gpio2
- cfsd18-logic-lynx-state-machine
- cfsd18-logic-lynx-steering
- cfsd18-proxy-lynx-pwm
- cfsd18-proxy-lynx-analog

PS3 controller

- cfsd18-proxy-ps3-lynx

Autonomous system usecases - docker-compose.yml files for full track tests

- cfsd18-autonomous-system-usecases

If the repository name includes **sim**, it means it is a simulation part for path planning.



# autonomous-system-usecases
Here are various docker-compose.yml files.

The commit history before 2018-07-09 is stored in the repository autonomous-system-usecases-old. Some careless commits made the old repository large, so move the files to this new repository.

# Instruction about loading docker images
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
