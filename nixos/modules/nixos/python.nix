{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # Python environment with required packages
    (pkgs.python312Full.withPackages (python-pkgs: [
      python-pkgs.libmambapy
      python-pkgs.conda
      python-pkgs.pip
      python-pkgs.webencodings
      python-pkgs.wcwidth
      python-pkgs.pure-eval
      python-pkgs.ptyprocess
      python-pkgs.fastjsonschema
      python-pkgs.websocket-client
      python-pkgs.webcolors
      python-pkgs.uri-template
      python-pkgs.types-python-dateutil
      python-pkgs.traitlets
      python-pkgs.tornado
      python-pkgs.tqdm
      python-pkgs.tinycss2
      python-pkgs.soupsieve
      python-pkgs.setuptools
      python-pkgs.send2trash
      python-pkgs.rpds-py
      python-pkgs.rfc3986-validator
      python-pkgs.rfc3339-validator
      python-pkgs.pyzmq
      python-pkgs.pyyaml
      python-pkgs.python-json-logger
      python-pkgs.pygments
      python-pkgs.psutil
      python-pkgs.prompt-toolkit
      python-pkgs.prometheus-client
      python-pkgs.pexpect
      python-pkgs.parso
      python-pkgs.pandocfilters
      python-pkgs.overrides
      python-pkgs.nest-asyncio
      python-pkgs.mistune
      python-pkgs.markupsafe
      python-pkgs.jupyterlab-pygments
      python-pkgs.json5
      python-pkgs.fqdn
      python-pkgs.executing
      python-pkgs.defusedxml
      python-pkgs.decorator
      python-pkgs.debugpy
      python-pkgs.bleach
      python-pkgs.babel
      python-pkgs.async-lru
      python-pkgs.asttokens
      python-pkgs.terminado
      python-pkgs.stack-data
      python-pkgs.referencing
      python-pkgs.matplotlib
      python-pkgs.matplotlib-inline
      python-pkgs.jupyter-core
      python-pkgs.jinja2
      python-pkgs.jedi
      python-pkgs.comm
      python-pkgs.beautifulsoup4
      python-pkgs.arrow
      python-pkgs.argon2-cffi-bindings
      python-pkgs.jupyter-server-terminals
      python-pkgs.jupyter-client
      python-pkgs.jsonschema-specifications
      python-pkgs.isoduration
      python-pkgs.ipython
      python-pkgs.argon2-cffi
      python-pkgs.jsonschema
      python-pkgs.ipykernel
      python-pkgs.nbformat
      python-pkgs.nbclient
      python-pkgs.jupyter-events
      python-pkgs.nbconvert
      python-pkgs.jupyter-server
      python-pkgs.notebook-shim
      python-pkgs.jupyterlab-server
      python-pkgs.jupyter-lsp
      python-pkgs.jupyterlab
      python-pkgs.notebook

      python-pkgs.pandas
      python-pkgs.requests
      python-pkgs.numpy
      python-pkgs.scipy

      python-pkgs.pyqt6
      python-pkgs.networkx
      python-pkgs.pygraphviz
      python-pkgs.ete3
    ]))

    # PyCharm Community with plugins
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm-professional [
      "github-copilot" # GitHub Copilot
      "nixidea" # NixIDEA
      # Bash Support Pro
      (pkgs.stdenv.mkDerivation {
        name = "bashsupport-pro";
        version = "4.3.1.243";
        src = pkgs.fetchurl { url = "https://downloads.marketplace.jetbrains.com/files/13841/617314/bashsupport-pro-signed-4.3.1.243.zip?updateId=617314&pluginId=13841&family=INTELLIJ"; hash = "sha256-TXvzR0DK2vaQ0/etyPI/bgvjxFKLqqcsldmrZMN1JeE="; };
        dontUnpack = true;
        installPhase = ''
          mkdir -p $out
          cp $src $out
        '';
      })
    ])

    # Jupyter Notebook Support
    jupyter-all

    # Jetbrains Tool to connect via ssh
    jetbrains.gateway
  ];
}
