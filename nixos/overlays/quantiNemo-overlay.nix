self: super: {
  quantiNemo = super.stdenv.mkDerivation rec {
    pname = "quantiNemo";
    version = "2.0.1";

    src = super.fetchFromGitHub {
      owner = "jgx65";
      repo = "quantiNemo";
      rev = "v${version}";
      sha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"; # Replace with correct hash
    };

    nativeBuildInputs = [ super.cmake super.gcc super.gcc-unwrapped ];

    cmakeFlags = [
      "-DCMAKE_AR=${super.gcc-unwrapped}/bin/gcc-ar"
      "-DCMAKE_RANLIB=${super.gcc-unwrapped}/bin/gcc-ranlib"
    ];

    buildPhase = ''
      mkdir build
      cd build
      cmake .. ${cmakeFlags}
      make
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp build/quantinemo $out/bin/
    '';

    meta = {
      description = "quantiNemo is a genetically explicit stochastic simulation program for population and quantitative genetics.";
      homepage = "https://www2.unil.ch/popgen/softwares/quantinemo/";
      license = with super.lib.licenses; [ super.lib.licenses.gpl3 ];
      platforms = super.lib.platforms.all;
      maintainers = with super.lib.maintainers; [ "your-name-here" ];
    };
  };
}
