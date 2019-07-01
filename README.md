# Chalmers formula student driverless

## Autonomous System Usecase

- File structure in the onboard computer:

  ~~~bash
  ~/script/
  ├── missionname/
  │   ├── .env # including CID for mission microservices, missionName, and other specific parameters
  │   ├── missionname.yml     # mission microservices, including recorder and mission related services
  │   ├── missionname-up.sh   # start the mission microservices
  │   └── missionnane-down.sh # stop the mission microservices
  ├── .env     # including CID for basic microservices, USBdevice for stm
  ├── state-machine-test.yml  # basic microservices, including stm, can, etc. start on booting
  ~~~

- Start-up script

  ~~~bash
  cd /home/cfsd/script # in the onboard computer
  docker-compose -f state-machine-test.yml down
  docker-compose -f state-machine-test.yml up -d
  ~~~

  Microservices in *state-machine-test.yml*:

  | microservice                                | version |
  | ------------------------------------------- | ------- |
  | chalmersfsd/opendlv-device-stm32-lynx       |         |
  | chalmersfsd/cfsd-proxy-cangw-lynx           |         |
  | chalmersfsd/cfsd-proxy-cangw-res            |         |
  | chalmersfsd/cfsd-logic-lynx-state-machine   |         |
  | chalmersfsd/cfsd19-logic-lynx-steering      |         |
  | chalmersfsd/cfsd-logic-lynx-mission-control |         |

- Mission

  ~~~c++
  enum asMission {		// Index
      AMI_NONE,			//   0
      AMI_ACCELERATION, 	//   1
      AMI_SKIDPAD, 		//   2
      AMI_TRACKDRIVE, 	//   3
      AMI_AUTOCROSS,		//   4
      AMI_BRAKETEST,		//   5
      AMI_INSPECTION,		//   6
      AMI_MANUAL,			//   7
      AMI_TEST			//   8
  };
  ~~~

  | mission      | status | indoor test | outdoor test |
  | ------------ | ------ | ----------- | ------------ |
  | acceleration | to-do  |             |              |
  | skidpad      | to-do  |             |              |
  | trackdrive   | to-do  |             |              |
  | autocross    | to-do  |             |              |
  | braketest    | done   |             |              |
  | inspection   | done   | passed      |              |





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
