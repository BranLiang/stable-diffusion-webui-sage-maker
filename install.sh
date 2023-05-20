env TF_CPP_MIN_LOG_LEVEL=1

conda install -q -y aria2
conda install -q -y glib
pip install -q opencv-python-headless huggingface-hub
pip install -q torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 torchtext==0.14.1 torchdata==0.5.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
pip install -q xformers==0.0.16 triton==2.0.0 -U

git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui
git clone https://huggingface.co/embed/negative ~/stable-diffusion-webui/embeddings/negative
git clone https://huggingface.co/embed/lora ~/stable-diffusion-webui/models/Lora/positive

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d ~/stable-diffusion-webui/models/ESRGAN -o 4x-UltraSharp.pth
wget https://raw.githubusercontent.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O ~/stable-diffusion-webui/scripts/run_n_times.py
git clone -b v2.1 https://github.com/camenduru/deforum-for-automatic1111-webui ~/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui
git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui-images-browser ~/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui-huggingface ~/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface
git clone -b v2.1 https://github.com/camenduru/sd-civitai-browser ~/stable-diffusion-webui/extensions/sd-civitai-browser
git clone -b v2.1 https://github.com/camenduru/sd-webui-additional-networks ~/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone -b v2.1 https://github.com/camenduru/sd-webui-tunnels ~/stable-diffusion-webui/extensions/sd-webui-tunnels
git clone -b v2.1 https://github.com/camenduru/batchlinks-webui ~/stable-diffusion-webui/extensions/batchlinks-webui
git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui-catppuccin ~/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone -b v2.1 https://github.com/camenduru/a1111-sd-webui-locon ~/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui-rembg ~/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui-two-shot ~/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot
git clone -b v2.1 https://github.com/camenduru/sd_webui_stealth_pnginfo ~/stable-diffusion-webui/extensions/sd_webui_stealth_pnginfo

cd ~/stable-diffusion-webui

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/chilloutmix/resolve/main/chilloutmix_NiPrunedFp32Fix.safetensors -d ~/stable-diffusion-webui/models/Stable-diffusion -o chilloutmix_NiPrunedFp32Fix.safetensors

sed -i -e '''/    prepare_environment()/a\    os.system\(f\"""sed -i -e ''\"s/dict()))/dict())).cuda()/g\"'' /home/studio-lab-user/stable-diffusion-webui/repositories/stable-diffusion-stability-ai/ldm/util.py""")''' /home/studio-lab-user/stable-diffusion-webui/launch.py
sed -i -e 's/\"sd_model_checkpoint\"\,/\"sd_model_checkpoint\,sd_vae\,CLIP_stop_at_last_layers\"\,/g' /home/studio-lab-user/stable-diffusion-webui/modules/shared.py
