#!/bin/bash

WORKSPACE=/vagrant/workspace

rm -f $WORKSPACE/*
prefix=$3

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"

    # Export the :latest tags for both the 14.04 and 16.04 docker images.
    export_ubuntu-lamp-latest-images

    # Export the :beta tags for both the 14.04 and 16.04 docker images.
    export_ubuntu-14.04-images
    #export_ubuntu-14.04-lamp-php5.5
    #export_ubuntu-14.04-lamp-php5.6
    #export_ubuntu-14.04-lamp-php7.0
    #export_ubuntu-14.04-lamp-php7.1
    #export_ubuntu-14.04-lamp-php7.2

    export_ubuntu-16.04-images
    #export_ubuntu-16.04-lamp-php7.0
    #export_ubuntu-16.04-lamp-php7.1
    #export_ubuntu-16.04-lamp-php7.2

    # Export the PHP 5 beta images.
    #export_ubuntu-lamp-php5-images

    # Export the PHP 7.0 beta images.
    #export_ubuntu-lamp-php7.0-images

    # Export the PHP 7.1 beta images.
    #export_ubuntu-lamp-php7.1-images

    # Export the PHP 7.2 beta images.
    #export_ubuntu-lamp-php7.2-images

    # Export the dotnet core images.
    #export_dotnet-core-images

else

  docker login -u$1 -p$2
  docker push $3/ubuntu-16.04:latest
  docker push $3/ubuntu-16.04:php7.0
  docker push $3/ubuntu-16.04:php7.1
  docker push $3/ubuntu-16.04:php7.2
  docker push $3/ubuntu-14.04:latest
  docker push $3/ubuntu-14.04:php5.6
  docker push $3/ubuntu-14.04:php5.5
  docker push $3/ubuntu-14.04:php7.0
  docker push $3/ubuntu-14.04:php7.1
  docker push $3/ubuntu-14.04:php7.2
fi



export_ubuntu-14.04-lamp-latest () {
	docker save $3/ubuntu-14.04-lamp:latest > $WORKSPACE/ubuntu-14.04-lamp-latest.tar
}

export_ubuntu-14.04-lamp-php5.5 () {
	docker save $3/ubuntu-14.04-lamp:php5.5 > $WORKSPACE/ubuntu-14.04-lamp-php5.5.tar
}

export_ubuntu-14.04-lamp-php5.6 () {
	docker save $3/ubuntu-14.04-lamp:php5.6 > $WORKSPACE/ubuntu-14.04-lamp-php5.6.tar
}

export_ubuntu-14.04-lamp-php7.0 () {
	docker save $3/ubuntu-14.04-lamp:php7.0 > $WORKSPACE/ubuntu-14.04-php7.0.tar
}

export_ubuntu-14.04-lamp-php7.1 () {
	docker save $3/ubuntu-14.04-lamp:php7.1 > $WORKSPACE/ubuntu-14.04-php7.1.tar
}

export_ubuntu-14.04-lamp-php7.2 () {
	docker save $3/ubuntu-14.04-lamp:php7.2 > $WORKSPACE/ubuntu-14.04-php7.2.tar
}

export_ubuntu-16.04-dotnet-sdk1.0.1 () {
	docker save $3/ubuntu-16.04-dotnet:sdk1.0.1 > $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1.tar
}

export_ubuntu-16.04-dotnet-sdk2.0.2 () {
	docker save $3/ubuntu-16.04-dotnet:sdk2.0.2 > $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2.tar
}

export_ubuntu-16.04-lamp-php7.0 () {
	docker save $3/ubuntu-16.04-lamp:php7.0 > $WORKSPACE/ubuntu-16.04-php7.0.tar
}

export_ubuntu-16.04-lamp-php7.1 () {
	docker save $3/ubuntu-16.04-lamp:php7.1 > $WORKSPACE/ubuntu-16.04-php7.1.tar
}

export_ubuntu-16.04-lamp-php7.2 () {
	docker save $3/ubuntu-16.04-lamp:php7.2 > $WORKSPACE/ubuntu-16.04-php7.2.tar
}

export_ubuntu-16.04-lamp-latest () {
	docker save $3/ubuntu-16.04-lamp:latest > $WORKSPACE/ubuntu-16.04-lamp-latest.tar
}

export_ubuntu-lamp-latest-images () {
	export_ubuntu-14.04-lamp-latest
	export_ubuntu-16.04-lamp-latest
}

export_ubuntu-14.04-images () {
	# Export Ubuntu LAMP 14.04 PHP Beta Images
	export_ubuntu-14.04-lamp-php5.5
	export_ubuntu-14.04-lamp-php5.6
	export_ubuntu-14.04-lamp-php7.0
	export_ubuntu-14.04-lamp-php7.1
	export_ubuntu-14.04-lamp-php7.2
}

export_ubuntu-16.04-images () {
	# Export Ubuntu LAMP 16.04 PHP Beta Images
	export_ubuntu-16.04-lamp-php7.0
	export_ubuntu-16.04-lamp-php7.1
	export_ubuntu-16.04-lamp-php7.2
}

export_dotnet-core-images () {
	# Export .NET Core images.
	export_ubuntu-16.04-dotnet-sdk1.0.1
	export_ubuntu-16.04-dotnet-sdk2.0.2
}

export_ubuntu-lamp-php5-images () {
	# Export Ubuntu LAMP PHP 5 Beta Images
	export_ubuntu-14.04-lamp-php5.5
	export_ubuntu-14.04-lamp-php5.6
}

export_ubuntu-lamp-php7.0-images () {
	# Export Ubuntu LAMP PHP 7.0 Beta Images
	export_ubuntu-14.04-lamp-php7.0
	export_ubuntu-16.04-lamp-php7.0
}

export_ubuntu-lamp-php7.1-images () {
	# Export Ubuntu LAMP PHP 7.1 Beta Images
	export_ubuntu-14.04-lamp-php7.1
	export_ubuntu-16.04-lamp-php7.1
}

export_ubuntu-lamp-php7.2-images () {
	# Export Ubuntu LAMP PHP 7.2 Beta Images
	export_ubuntu-14.04-lamp-php7.2
	export_ubuntu-16.04-lamp-php7.2
}
