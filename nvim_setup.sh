
ARCH=$(uname -m)

if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then

  NVIM_VERSION=nvim-linux-arm64
  echo $NVIM_VERSION

elif [[ "$ARCH" == "x86_64" ]]; then 

  NVIM_VERSION=nvim-linux-x86_64
  echo $NVIM_VERSION

else 

  echo "Unknown arch"
  exit 1
fi



curl -LO https://github.com/neovim/neovim/releases/latest/download/${NVIM_NAME}.tar.gz && \
sudo rm -rf /opt/${NVIM_NAME} && \
sudo tar -C /opt -xzf ${NVIM_NAME}.tar.gz && \
echo "export PATH=\"\$PATH:/opt/${NVIM_NAME}/bin\"" >> ~/.zshrc && \
source ~/.zshrc
