{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.rstudioWrapper.override {
      packages = with rPackages;
        let
          fantaxtic = buildRPackage {
          name = "fantaxtic";
          src = pkgs.fetchFromGitHub {
            owner = "gmteunisse";
            repo = "fantaxtic";
            rev = "b822d7f65bc14dc7a2a64c1f56eaa4043efe8caa";
            sha256 = "sha256-iF/RkQleip5agYa3awNhuNzhLYLASGEW94jLX7HKG1Q==";};
          propagatedBuildInputs = [ rlang  knitr ggplot2 phyloseq reshape2 dplyr tidyr stringr forcats ggnested magrittr ];
          nativeBuildInputs = [ rlang knitr ggplot2 phyloseq reshape2 dplyr tidyr stringr forcats ggnested magrittr ];};

          ggnested = buildRPackage {
          name = "ggnested";
          src = pkgs.fetchFromGitHub {
            owner = "gmteunisse";
            repo = "ggnested";
            rev = "e72a35c866a785cd4314427b9da0c3a3ed58c236";
            sha256 = "sha256-6aRp9qCRaiq6R435OdrxdQXFAH4oQvoTC1ObTELn/rg=";};
          propagatedBuildInputs = [ rlang  knitr ggplot2 tidyr dplyr purrr magrittr plotwidgets ggtext ];
          nativeBuildInputs = [ rlang knitr ggplot2 tidyr dplyr purrr magrittr plotwidgets ggtext ];};
        in [
        ggplot2
        gridExtra
        png
        ggrepel
        viridis
        dplyr
        rmarkdown
        readr
        stringi
        palmerpenguins
        janitor
        shiny
        leaflet
        maps
        ggmap
        kableExtra
        formatR
        broom
        moments
        # SAGE 24
        tidyverse
        tidyr
        dada2
        Biostrings
        phyloseq
        reshape2
        stringr
        forcats
        magrittr
        purrr
        plotwidgets
        ggtext
        ggnested
        fantaxtic
        BiocGenerics
        BiocManager
        devtools
        remotes
        harmony
        renv
        factoextra
        Seurat
        openssl
        RCurl
        curl
        stats4teaching
        S4Vectors
        IRanges
        XVector
        GenomeInfoDb
        vegan
        cowplot
        zoo
        survival
        lme4
        rsconnect
        matrixStats
        rgl
        tsne
        umap
        Matrix
        glmnet
        ggsci
        ggpubr
        RColorBrewer
      ];
    })
    vimPlugins.copilot-vim
  ];
}
