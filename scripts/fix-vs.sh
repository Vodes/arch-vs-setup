USER_SITE_PACKAGES=$(python -m site --user-site)

find $USER_SITE_PACKAGES -name "vapoursynth*.so" -exec rm -f {} \;
find $USER_SITE_PACKAGES -type d -name "VapourSynth-??.dist-info" -exec rm -rf {} \;

VAPOURSYNTH_VERSION=$(pacman -Q | grep -P 'vapoursynth' | grep -oP '(?<=R)[0-9]+')

NEW_SITE_PKG_DIR=$USER_SITE_PACKAGES/VapourSynth-$VAPOURSYNTH_VERSION.dist-info

mkdir $NEW_SITE_PKG_DIR

printf 'vapoursynth' > $NEW_SITE_PKG_DIR/top_level.txt
printf 'pip' > $NEW_SITE_PKG_DIR/INSTALLER
printf 'vapoursynth-stubs/__init__.pyi,,' > $NEW_SITE_PKG_DIR/RECORD
printf "Metadata-Version: 2.1\nName: VapourSynth\nVersion: $VAPOURSYNTH_VERSION\nSummary: A frameserver for the 21st century\nHome-page: https://www.vapoursynth.com/\nDownload-URL: https://github.com/vapoursynth/vapoursynth\nAuthor: Fredrik Mellbin\nAuthor-email: fredrik.mellbin@gmail.com\nLicense: LGPL 2.1 or later\nPlatform: All\n\nA modern replacement for Avisynth" > $NEW_SITE_PKG_DIR/METADATA
