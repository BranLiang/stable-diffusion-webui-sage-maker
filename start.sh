conda install -q -y aria2
conda install -q -y glib

cd ~/stable-diffusion-webui

python launch.py --listen --xformers --enable-insecure-extension-access --theme dark --gradio-queue --ngrok REPLACE_ME