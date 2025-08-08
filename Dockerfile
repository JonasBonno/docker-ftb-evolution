FROM eclipse-temurin:21-jre

MAINTAINER Jonas Bonno Mikkelsen (https://github.com/JonasBonno)

# Updating container
RUN apt-get update && \
	apt-get install apt-utils --yes && \
	apt-get upgrade --yes --allow-remove-essential && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Setting workdir
WORKDIR /minecraft

# Creating user and downloading files
RUN useradd -m -U minecraft && \
	mkdir -p /minecraft/world && \
	wget --no-check-certificate https://github.com/FTBTeam/FTB-Server-Installer/releases/download/latest/ftb-server-linux-amd64 -O serverinstaller && \
	chmod u+x serverinstaller && \
	./serverinstaller -auto -pack 125 -latest && \
	rm serverinstaller && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=true" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft

# Changing user to minecraft
USER minecraft

# Expose port 25565
EXPOSE 25565

# Expose volume
VOLUME ["/minecraft/world"]

# Start server
CMD ["/bin/bash", "/minecraft/run.sh"]
