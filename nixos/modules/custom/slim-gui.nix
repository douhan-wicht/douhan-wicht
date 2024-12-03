{ lib, stdenv, fetchFromGitHub, cmake, gcc, gcc-unwrapped, qtbase, qttools, pkg-config }:

stdenv.mkDerivation rec {
  version = "4.2.2";
  pname = "messer-slim";

  src = fetchFromGitHub {
    owner = "MesserLab";
    repo = "SLiM";
    rev = "v${version}";
    sha256 = "sha256-TlB7Hj4pVN4p4VanACWjQBeTxP9/DvRvdCdgelrXx60=";
  };

  nativeBuildInputs = [ cmake gcc gcc-unwrapped pkg-config qttools ];

  buildInputs = [ qtbase ];

  cmakeFlags = [
    "-DCMAKE_AR=${gcc-unwrapped}/bin/gcc-ar"
    "-DCMAKE_RANLIB=${gcc-unwrapped}/bin/gcc-ranlib"
    "-D BUILD_SLIMGUI=ON"  # Enable building SLiMgui
  ];

  # Build SLiMgui specifically
  buildPhase = ''
    cmake . ${cmakeFlags}
    make SLiMgui
  '';

  # Optional: if you want to install SLiMgui
  installPhase = ''
    make install
  '';

  meta = {
    description = "An evolutionary simulation framework with GUI support (SLiMgui)";
    homepage = "https://messerlab.org/slim/";
    license = with lib.licenses; [ gpl3 ];
    maintainers = with lib.maintainers; [ bzizou ];
    platforms = lib.platforms.all;
  };
}
