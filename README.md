# stable-diffusion-webui-sage-maker
Use stable diffusion webui on sage maker

## Getting start

1. Register your sagemaker studio lab account

Normally you will be approved within 1 week

https://studiolab.sagemaker.aws/

2. Start your runtime with GPU

3. Open a terminal

```shell
$ cd ~
```

4. Create a new conda env in case you mess up later

```shell
$ conda create --name webui python=3.9 
$ conda activate webui
```

5. Run the install.sh

This installation will install a base mode [`chilloutmix_NiPrunedFp32Fix.safetensors`](https://civitai.com/models/6424/chilloutmix) for you by default. If you want to use other base model, feel free to replace it with other base model.

Because the disk is pretty restricted in the sagemaker studio lab. Highly suggest not to install more than 2 base models.

```shell
bash install.sh
```

6. Start the webui

Before running the following script. Make sure you get an API key from the [ngrok](https://ngrok.com/). And replace the `REPLACE_ME` in the script with your own token.

```shell
bash start.sh
```

7. After the first installation, next everytime you restart the runtime, you need to do the following steps to restart the webui

```
$ conda activate webui
$ bash start.sh
```

## Gocha

- If you want to use Lora from sources like civita, be sure to download the lora model to the new folder.

## Credits

[camenduru/stable-diffusion-webui-sagemaker](https://github.com/camenduru/stable-diffusion-webui-sagemaker)




