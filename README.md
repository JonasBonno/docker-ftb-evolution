# ftb-evolution
FTB Evolution modpack
made by Feed The Beast at https://feed-the-beast.com

Modpack for Minecraft 1.21.1.</br>
FTB Evolution propels you into a limitless Minecraft universe, where advanced technology, intricate magic, and immersive exploration await at every turn.

<img src="https://www.feed-the-beast.com/_next/image?url=https%3A%2F%2Fcdn.feed-the-beast.com%2Fblob%2Fa3%2Fa3716bf4fbab2a80750a32b74ed1d64201d8bdeaecece0f3caa20cb9b5d95d30.png&w=256&q=75" width="256" height="256">

NOTE: In compliance with Mojang "End User License Agreement", you will need to agree to the EULA in order to run your own Minecraft server. By using this container you acknowledge the EULA! If you do not agree, then you are not permitted to use this container!
https://account.mojang.com/documents/minecraft_eula 

The worldname must be the default "world". 
Settings will reset when upgrading.
Access the console to op and whitelist.

Running ftb-evolution data container:
<code>docker run --name [name of your data container] jonasbonno/ftb-evolution echo 'Data-only container'</code>

Running ftb-evolution server:
<code>docker run --tty=true --interactive=true --detach=true --name [name of your container] --volumes-from [name of your data container] --publish=[port on your host]:25565 jonasbonno/ftb-evolution</code>

When upgrading sometime items have been remove and therefor you have to confirm removal. </br>
To do so run <code>docker attach [name of your container]</code> and type <code>/fml confirm</code> when prompted to confirm or cancel. </br>
Exit with CTRL+P CTRL+Q. </br>

To access the console:
</br><code>docker attach [name of container]</code>
</br>Run your commands
</br>To exit: CTRL+P CTRL+Q

Tips:
</br>Check for OS updates: <code>docker exec -u 0 -it [name of your container] /usr/bin/apt update</code>
</br>Install OS updates: <code>docker exec -u 0 -it [name of your container] /usr/bin/apt full-upgrade -y</code>
</br>Download file: <code>docker cp [name of your container]:/minecraft/options.txt .</code>
</br>Upload file: <code>docker cp options.txt [name of your container]:/minecraft/options.txt</code>
</br>Say Hi!: <code>echo "say Hi!" | socat EXEC:"docker attach [name of your container]",pty STDIN</code>
</br>Say CPU and RAM usage: <code>echo "say $(docker stats [name of your container] --no-stream --format "table CPU: {{.CPUPerc}} RAM: {{.MemPerc}}" | sed -n -e 2p)" | socat EXEC:"docker attach [name of your container]",pty STDIN</code>

The first time the server starts it creates the server.properties file with default settings and spawns "world". 
Not recommended to change these settings by hand.
