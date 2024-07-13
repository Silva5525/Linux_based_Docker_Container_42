ARG VARIANT=debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

ARG DEBIAN_FRONTEND=noninteractive

# Install basic software and libraries
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    libglfw3 libglfw3-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev \
    software-properties-common build-essential wget git valgrind pkg-config \
	vim ruby-full \
    && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Install cmake from downloaded script
RUN wget -O cmake-install.sh https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5-Linux-x86_64.sh \
    && chmod +x cmake-install.sh \
    && ./cmake-install.sh --skip-license --prefix=/usr/local \
    && rm cmake-install.sh

# Install additional software and set up permissions for PlatformIO
RUN export DEBIAN_FRONTEND=noninteractive && \
  sudo apt-get update && sudo apt-get install -y --no-install-recommends clang python3-venv udev \
  && curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules \
  && sudo service udev restart && sudo usermod -a -G dialout vscode && sudo usermod -a -G plugdev vscode

USER vscode

# Install PlatformIO CLI
RUN curl -fsSL -o /tmp/get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py \
    && python3 /tmp/get-platformio.py \
    && echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | tee -a ~/.bashrc ~/.zshrc

# Generate SSH key for Git operations ########################### change your mail adress with a git releatet one
RUN ssh-keygen -t ed25519 -C "example@nono.com" -f ~/.ssh/id_ed25519 -N "" \
    && echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

ARG DEBIAN_FRONTEND=


# ARG VARIANT=debian-11
# FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# ARG DEBIAN_FRONTEND=noninteractive

# RUN sudo apt-get update
# RUN export DEBIAN_FRONTEND=noninteractive && \
#     && apt-get install -y --no-install-recommends \
#     libglfw3 \
#     libglfw3-dev \
#     libglu1-mesa-dev \
#     freeglut3-dev \
#     mesa-common-dev \
#     software-properties-common \
#     build-essential \
#     wget \
# 	git \
#     valgrind \
#     pkg-config \
#     && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# RUN wget -O cmake-install.sh https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5-Linux-x86_64.sh \
#     && chmod +x cmake-install.sh \
#     && ./cmake-install.sh --skip-license --prefix=/usr/local \
#     && rm cmake-install.sh

# # Install PlatformIO CLI
# USER vscode
# RUN curl -fsSL -o /tmp/get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
# RUN python3 /tmp/get-platformio.py
# RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | tee -a /home/vscode/.bashrc /home/vscode/.zshrc 
# RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | sudo tee -a /root/.bashrc /root/.zshrc


# ARG DEBIAN_FRONTEND=

# ARG VARIANT=debian-11
# FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# RUN sudo apt-get update
# RUN export DEBIAN_FRONTEND=noninteractive && \
#   sudo apt-get -y install --no-install-recommends \
#   clang \
#   python3-venv \
#   udev

# ## Set up udev rules for PlatformIO
# RUN curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
# RUN service udev restart 
# RUN usermod -a -G dialout vscode
# RUN usermod -a -G plugdev vscode

# ARG FEDORA_COMPAT=0
# ### Set up compatibility with Fedora host (if needed)
# ### Since Fedora uses `18` as the group for dialout, we need to add it to the container
# RUN if [ "$FEDORA_COMPAT" = "1" ]; then \
#   sudo groupadd -g 18 compat_dialout; \
#   sudo usermod -a -G compat_dialout vscode; \
# fi


# # Install PlatformIO CLI
# USER vscode
# RUN curl -fsSL -o /tmp/get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
# RUN python3 /tmp/get-platformio.py
# RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | tee -a /home/vscode/.bashrc /home/vscode/.zshrc 
# RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | sudo tee -a /root/.bashrc /root/.zshrc
