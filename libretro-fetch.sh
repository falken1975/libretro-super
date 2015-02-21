#! /usr/bin/env bash
# vim: set ts=3 sw=3 noet ft=sh : bash

SCRIPT="${0#./}"
BASE_DIR="${SCRIPT%/*}"
WORKDIR=$(pwd)

if [ "$BASE_DIR" = "$SCRIPT" ]; then
	BASE_DIR="$WORKDIR"
else
	if [[ "$0" != /* ]]; then
		# Make the path absolute
		BASE_DIR="$WORKDIR/$BASE_DIR"
	fi
fi

. $BASE_DIR/libretro-config.sh
. $BASE_DIR/script-modules/fetch-rules.sh


# Keep three copies so we don't have to rebuild stuff all the time.
# FIXME: If you need 3 copies of source to compile 3 sets of objects, you're
#        doing it wrong.  We should fix this.
fetch_project_bsnes()
{
	echo "=== Fetching $3 ==="
	fetch_git "$1" "$2" ""
	fetch_git "$WORKDIR/$2" "$2/perf" ""
	fetch_git "$WORKDIR/$2" "$2/balanced" ""
}


fetch_retroarch() {
	echo "=== Fetching RetroArch ==="
	fetch_git "https://github.com/libretro/RetroArch.git" "retroarch" ""
	fetch_git "https://github.com/libretro/common-shaders.git" "retroarch/media/shaders_cg" ""
	fetch_git "https://github.com/libretro/common-overlays.git" "retroarch/media/overlays" ""
	fetch_git "https://github.com/libretro/retroarch-assets.git" "retroarch/media/assets" ""
	fetch_git "https://github.com/libretro/retroarch-joypad-autoconfig.git" "retroarch/media/autoconfig" ""
	fetch_git "https://github.com/libretro/libretro-database.git" "retroarch/media/libretrodb" ""
}

fetch_tools() {
	fetch_git "https://github.com/libretro/libretro-manifest.git" "libretro-manifest" "libretro/libretro-manifest"
	fetch_git "https://github.com/libretro/libretrodb.git" "libretrodb" "libretro/libretrodb"
	fetch_git "https://github.com/libretro/libretro-dat-pull.git" "libretro-dat-pull" "libretro/libretro-dat-pull"
}

# FIXME: Not ready for a meta-fetch rule
#libretro_bsnes_url="https://github.com/libretro/bsnes-libretro.git"
#libretro_bsnes_dir="libretro-bsnes"
#libretro_bsnes_name="bsnes/higan"

libretro_snes9x_url="https://github.com/libretro/snes9x.git"
libretro_snes9x_dir="libretro-snes9x"
libretro_snes9x_name="SNES9x"

libretro_snes9x_url="https://github.com/libretro/snes9x-next.git"
libretro_snes9x_dir="libretro-snes9x_next"
libretro_snes9x_name="SNES9x Next"

libretro_genesis_plus_gx_url="https://github.com/libretro/Genesis-Plus-GX.git"
libretro_genesis_plus_gx="libretro-genesis_plus_gx"
libretro_genesis_plus_gx="Genesis Plus GX"

libretro_fb_alpha_url="https://github.com/libretro/fba-libretro.git"
libretro_fb_alpha_dir="libretro-fb_alpha"
libretro_fb_alpha_name="Final Burn Alpha"

libretro_vba_next_url="https://github.com/libretro/vba-next.git"
libretro_vba_next_dir="libretro-vba_next"
libretro_vba_next_name="VBA Next"

libretro_vbam_url="https://github.com/libretro/vbam-libretro.git"
libretro_vbam_dir="libretro-vbam"
libretro_vbam_name="VBA-M"

libretro_handy_url="https://github.com/libretro/libretro-handy.git"
libretro_handy_dir="libretro-handy"
libretro_handy_name="Handy"

libretro_bnes_url="https://github.com/libretro/bnes-libretro.git"
libretro_bnes_dir="libretro-bnes"
libretro_bnes_name="bnes/higan"

libretro_fceumm_url="https://github.com/libretro/libretro-fceumm.git"
libretro_fceumm_dir="libretro-fceumm"
libretro_fceumm_name="FCEUmm"

libretro_gambatte_url="https://github.com/libretro/gambatte-libretro.git"
libretro_gambatte_dir="libretro-gambatte"
libretro_gambatte_name="Gambatte"

libretro_meteor_url="https://github.com/libretro/meteor-libretro.git"
libretro_meteor_dir="libretro-meteor"
libretro_meteor_name="Meteor"

libretro_nxengine_url="https://github.com/libretro/nxengine-libretro.git"
libretro_nxengine_dir="libretro-nxengine"
libretro_nxengine_name="NXEngine"

libretro_prboom_url="https://github.com/libretro/libretro-prboom.git"
libretro_prboom_dir="libretro-prboom"
libretro_prboom_name="PrBoom"

libretro_stella_url="https://github.com/libretro/stella-libretro.git"
libretro_stella_dir="libretro-stella"
libretro_stella_name="Stella"

libretro_desmume_url="https://github.com/libretro/desmume.git"
libretro_desmume_dir="libretro-desmume"
libretro_desmume_name="DeSmuME"

libretro_quicknes_url="https://github.com/libretro/QuickNES_Core.git"
libretro_quicknes_dir="libretro-quicknes"
libretro_quicknes_name="QuickNES"

libretro_nestopia_url="https://github.com/libretro/nestopia.git"
libretro_nestopia_dir="libretro-nestopia"
libretro_nestopia_name="Nestopia"

libretro_tyrquake_url="https://github.com/libretro/tyrquake.git"
libretro_tyrquake_dir="libretro-tyrquake"
libretro_tyrquake_name="TyrQuake"

libretro_pcsx_rearmed_url="https://github.com/libretro/pcsx_rearmed.git"
libretro_pcsx_rearmed_dir="libretro-pcsx_rearmed"
libretro_pcsx_rearmed_name="PCSX ReARMed"

libretro_mednafen_gba_url="https://github.com/libretro/beetle-gba-libretro.git"
libretro_mednafen_gba_dir="libretro-mednafen_gba"
libretro_mednafen_gba_name="Mednafen/Beetle GBA"

libretro_mednafen_lynx_url="https://github.com/libretro/beetle-lynx-libretro.git"
libretro_mednafen_lynx_dir="libretro-mednafen_lynx"
libretro_mednafen_lynx_name="Mednafen/Beetle Lynx"

libretro_mednafen_ngp_url="https://github.com/libretro/beetle-ngp-libretro.git"
libretro_mednafen_ngp_dir="libretro-mednafen_ngp"
libretro_mednafen_ngp_name="Mednafen/Beetle NeoPop"

libretro_mednafen_pce_fast_url="https://github.com/libretro/beetle-pce-fast-libretro.git"
libretro_mednafen_pce_fast_dir="libretro-mednafen_pce_fast"
libretro_mednafen_pce_fast_name="Mednafen/Beetle PCE FAST"

libretro_mednafen_supergrafx_url="https://github.com/libretro/beetle-supergrafx-libretro.git"
libretro_mednafen_supergrafx_dir="libretro-mednafen_supergrafx"
libretro_mednafen_supergrafx_name="Mednafen/Beetle SuperGrafx"

libretro_mednafen_psx_url="https://github.com/libretro/mednafen-psx-libretro.git"
libretro_mednafen_psx_dir="libretro-mednafen_psx"
libretro_mednafen_psx_name="Mednafen PSX"

libretro_mednafen_pcfx_url="https://github.com/libretro/beetle-pcfx-libretro.git"
libretro_mednafen_pcfx_dir="libretro-mednafen_pcfx"
libretro_mednafen_pcfx_name="Mednafen/Beetle PC-FX"

libretro_mednafen_snes_url="https://github.com/libretro/beetle-bsnes-libretro.git"
libretro_mednafen_snes_dir="libretro-mednafen_snes"
libretro_mednafen_snes_name="Mednafen/Beetle bsnes"

libretro_mednafen_vb_url="https://github.com/libretro/beetle-vb-libretro.git"
libretro_mednafen_vb_dir="libretro-mednafen_vb"
libretro_mednafen_vb_name="Mednafen/Beetle VB"

libretro_mednafen_wswan_url="https://github.com/libretro/beetle-wswan-libretro.git"
libretro_mednafen_wswan_dir="libretro-mednafen_wswan"
libretro_mednafen_wswan_name="Mednafen/Beetle WonderSwan"

libretro_scummvm_url="https://github.com/libretro/scummvm.git"
libretro_scummvm_dir="libretro-scummvm"
libretro_scummvm_name="ScummVM"

libretro_yabause_url="https://github.com/libretro/yabause.git"
libretro_yabause_dir="libretro-yabause"
libretro_yabause_name="Yabause"

libretro_dosbox_url="https://github.com/libretro/dosbox-libretro.git"
libretro_dosbox_dir="libretro-dosbox"
libretro_dosbox_name="DOSBox"

libretro_virtualjaguar_url="https://github.com/libretro/virtualjaguar-libretro.git"
libretro_virtualjaguar_dir="libretro-virtualjaguar"
libretro_virtualjaguar_name="Virtual Jaguar"

libretro_mame078_url="https://github.com/libretro/mame2003-libretro.git"
libretro_mame078_dir="libretro-mame078"
libretro_mame078_name="MAME 2003 (0.78)"

libretro_mame139_url="https://github.com/libretro/mame2010-libretro.git"
libretro_mame139_dir="libretro-mame139"
libretro_mame139_name="MAME 2010 (0.139)"

libretro_mame_url="https://github.com/libretro/mame.git"
libretro_mame_dir="libretro-mame"
libretro_mame_name="MAME (git)"

libretro_ffmpeg_url="https://github.com/libretro/FFmpeg.git"
libretro_ffmpeg_dir="libretro-ffmpeg"
libretro_ffmpeg_name="FFmpeg"

libretro_bsnes_cplusplus98_url="https://github.com/libretro/bsnes-libretro-cplusplus98.git"
libretro_bsnes_cplusplus98_dir="libretro-bsnes_cplusplus98"
libretro_bsnes_cplusplus98_name="bsnes C++98 (v0.85)"

libretro_bsnes_mercury_url="https://github.com/libretro/bsnes-mercury.git"
libretro_bsnes_mercury_dir="libretro-bsnes_mercury"
libretro_bsnes_mercury_name="bsnes-mercury"

libretro_picodrive_url="https://github.com/libretro/picodrive.git"
libretro_picodrive_dir="libretro-picodrive"
libretro_picodrive_name="Picodrive"
libretro_picodrive_fetch_modules="1"
libretro_picodrive_update_modules="1"

libretro_tgbdual_url="https://github.com/libretro/tgbdual-libretro.git"
libretro_tgbdual_dir="libretro-tgbdual"
libretro_tgbdual_name="TGB Dual"

libretro_mupen64plus_url="https://github.com/libretro/mupen64plus-libretro.git"
libretro_mupen64plus_dir="libretro-mupen64plus"
libretro_mupen64plus_name="Mupen64Plus"

libretro_dinothawr_url="https://github.com/libretro/Dinothawr.git"
libretro_dinothawr_dir="libretro-dinothawr"
libretro_dinothawr_name="Dinothawr"

libretro_uae_url="https://github.com/libretro/libretro-uae.git"
libretro_uae_dir="libretro-uae"
libretro_uae_name="UAE"

libretro_3dengine_url="https://github.com/libretro/libretro-3dengine.git"
libretro_3dengine_dir="libretro-3dengine"
libretro_3dengine_name="3DEngine"

libretro_remotejoy_url="https://github.com/libretro/libretro-remotejoy.git"
libretro_remotejoy_dir="libretro-remotejoy"
libretro_remotejoy_name="RemoteJoy"

libretro_bluemsx_url="https://github.com/libretro/blueMSX-libretro.git"
libretro_bluemsx_dir="libretro-bluemsx"
libretro_bluemsx_name="blueMSX"

libretro_fmsx_url="https://github.com/libretro/fmsx-libretro.git"
libretro_fmsx_dir="libretro-fmsx"
libretro_fmsx_name="fMSX"

libretro_2048_url="https://github.com/libretro/libretro-2048.git"
libretro_2048_dir="libretro-2048"
libretro_2048_name="2048"

libretro_vecx_url="https://github.com/libretro/libretro-vecx.git"
libretro_vecx_dir="libretro-vecx"
libretro_vecx_name="vecx"

libretro_ppsspp_url="https://github.com/libretro/ppsspp.git"
libretro_ppsspp_dir="libretro-ppsspp"
libretro_ppsspp_name="PPSSPP"
libretro_ppsspp_fetch_submodules="1"
libretro_ppsspp_update_submodules="1"

libretro_prosystem_url="https://github.com/libretro/prosystem-libretro.git"
libretro_prosystem_dir="libretro-prosystem"
libretro_prosystem_name="ProSystem"

libretro_o2em_url="https://github.com/libretro/libretro-o2em.git"
libretro_o2em_dir="libretro-o2em"
libretro_o2em_name="O2EM"

libretro_4do_url="https://github.com/libretro/4do-libretro.git"
libretro_4do_dir="libretro-4do"
libretro_4do_name="4DO"

libretro_catsfc_url="https://github.com/libretro/CATSFC-libretro.git"
libretro_catsfc_dir="libretro-catsfc"
libretro_catsfc_name="CATSFC"

libretro_stonesoup_url="https://github.com/libretro/crawl-ref.git"
libretro_stonesoup_dir="libretro-stonesoup"
libretro_stonesoup_name="Dungeon Crawl Stone Soup"
libretro_stonesoup_fetch_submodules="1"

libretro_hatari_url="https://github.com/libretro/hatari.git"
libretro_hatari_dir="libretro-hatari"
libretro_hatari_name="Hatari"

libretro_tempgba_url="https://github.com/libretro/TempGBA-libretro.git"
libretro_tempgba_dir="libretro-tempgba"
libretro_tempgba_name="TempGBA"

libretro_gpsp_url="https://github.com/libretro/gpsp.git"
libretro_gpsp_dir="libretro-gpsp"
libretro_gpsp_name="gpSP"

libretro_emux_url="https://github.com/libretro/emux.git"
libretro_emux_dir="libretro-emux"
libretro_emux_name="Emux"

libretro_fuse_url="https://github.com/libretro/fuse-libretro.git"
libretro_fuse_dir="libretro-fuse"
libretro_fuse_name="Fuse"


fetch_libretro_bsnes() {
	fetch_project_bsnes "https://github.com/libretro/bsnes-libretro.git" "libretro-bsnes" "libretro/bSNES"
}

fetch_libretro_snes9x() {
	fetch_git "https://github.com/libretro/snes9x.git" "libretro-snes9x" "libretro/SNES9x"
}

fetch_libretro_snes9x_next() {
	fetch_git "https://github.com/libretro/snes9x-next.git" "libretro-snes9x_next" "libretro/SNES9x-Next"
}

fetch_libretro_genesis_plus_gx() {
	fetch_git "https://github.com/libretro/Genesis-Plus-GX.git" "libretro-genesis_plus_gx" "libretro/Genplus GX"
}

fetch_libretro_fb_alpha() {
	fetch_git "https://github.com/libretro/fba-libretro.git" "libretro-fb_alpha" "libretro/FBA"
}

fetch_libretro_vba_next() {
	fetch_git "https://github.com/libretro/vba-next.git" "libretro-vba_next" "libretro/VBA Next"
}

fetch_libretro_vbam() {
	fetch_git "https://github.com/libretro/vbam-libretro.git" "libretro-vbam" "libretro/VBA-M"
}

fetch_libretro_handy() {
	fetch_git "https://github.com/libretro/libretro-handy.git" "libretro-handy" "libretro/Handy"
}

fetch_libretro_bnes() {
	fetch_git "https://github.com/libretro/bnes-libretro.git" "libretro-bnes" "libretro/bNES"
}

fetch_libretro_fceumm() {
	fetch_git "https://github.com/libretro/libretro-fceumm.git" "libretro-fceumm" "libretro/FCEUmm"
}

fetch_libretro_gambatte() {
	fetch_git "https://github.com/libretro/gambatte-libretro.git" "libretro-gambatte" "libretro/Gambatte"
}

fetch_libretro_meteor() {
	fetch_git "https://github.com/libretro/meteor-libretro.git" "libretro-meteor" "libretro/Meteor"
}

fetch_libretro_nxengine() {
	fetch_git "https://github.com/libretro/nxengine-libretro.git" "libretro-nxengine" "libretro/NX"
}

fetch_libretro_prboom() {
	fetch_git "https://github.com/libretro/libretro-prboom.git" "libretro-prboom" "libretro/PRBoom"
}

fetch_libretro_stella() {
	fetch_git "https://github.com/libretro/stella-libretro.git" "libretro-stella" "libretro/Stella"
}

fetch_libretro_desmume() {
	fetch_git "https://github.com/libretro/desmume.git" "libretro-desmume" "libretro/Desmume"
}

fetch_libretro_quicknes() {
	fetch_git "https://github.com/libretro/QuickNES_Core.git" "libretro-quicknes" "libretro/QuickNES"
}

fetch_libretro_nestopia() {
	fetch_git "https://github.com/libretro/nestopia.git" "libretro-nestopia" "libretro/Nestopia"
}

fetch_libretro_tyrquake() {
	fetch_git "https://github.com/libretro/tyrquake.git" "libretro-tyrquake" "libretro/tyrquake"
}

fetch_libretro_pcsx_rearmed() {
	fetch_git "https://github.com/libretro/pcsx_rearmed.git" "libretro-pcsx_rearmed" "libretro/pcsx_rearmed"
}

fetch_libretro_mednafen_gba() {
	fetch_git "https://github.com/libretro/beetle-gba-libretro.git" "libretro-mednafen_gba" "libretro/Beetle GBA"
}

fetch_libretro_mednafen_lynx() {
	fetch_git "https://github.com/libretro/beetle-lynx-libretro.git" "libretro-mednafen_lynx" "libretro/Beetle Lynx"
}

fetch_libretro_mednafen_ngp() {
	fetch_git "https://github.com/libretro/beetle-ngp-libretro.git" "libretro-mednafen_ngp" "libretro/Beetle NGP"
}

fetch_libretro_mednafen_pce_fast() {
	fetch_git "https://github.com/libretro/beetle-pce-fast-libretro.git" "libretro-mednafen_pce_fast" "libretro/Beetle PCE Fast"
}

fetch_libretro_mednafen_supergrafx() {
	fetch_git "https://github.com/libretro/beetle-supergrafx-libretro.git" "libretro-mednafen_supergrafx" "libretro/Beetle SuperGrafx"
}

fetch_libretro_mednafen_psx() {
	fetch_git "https://github.com/libretro/mednafen-psx-libretro.git" "libretro-mednafen_psx" "libretro/Mednafen PSX"
}

fetch_libretro_mednafen_pcfx() {
	fetch_git "https://github.com/libretro/beetle-pcfx-libretro.git" "libretro-mednafen_pcfx" "libretro/Beetle PCFX"
}

fetch_libretro_mednafen_snes() {
	fetch_git "https://github.com/libretro/beetle-bsnes-libretro.git" "libretro-mednafen_snes" "libretro/Beetle bSNES"
}

fetch_libretro_mednafen_vb() {
	fetch_git "https://github.com/libretro/beetle-vb-libretro.git" "libretro-mednafen_vb" "libretro/Beetle VB"
}

fetch_libretro_mednafen_wswan() {
	fetch_git "https://github.com/libretro/beetle-wswan-libretro.git" "libretro-mednafen_wswan" "libretro/Beetle WSwan"
}

fetch_libretro_scummvm() {
	fetch_git "https://github.com/libretro/scummvm.git" "libretro-scummvm" "libretro/scummvm"
}

fetch_libretro_yabause() {
	fetch_git "https://github.com/libretro/yabause.git" "libretro-yabause" "libretro/yabause"
}

fetch_libretro_dosbox() {
	fetch_git "https://github.com/libretro/dosbox-libretro.git" "libretro-dosbox" "libretro/dosbox"
}

fetch_libretro_virtualjaguar() {
	fetch_git "https://github.com/libretro/virtualjaguar-libretro.git" "libretro-virtualjaguar" "libretro/virtualjaguar"
}

fetch_libretro_mame078() {
	fetch_git "https://github.com/libretro/mame2003-libretro.git" "libretro-mame078" "libretro/mame078"
}

fetch_libretro_mame139() {
	fetch_git "https://github.com/libretro/mame2010-libretro.git" "libretro-mame139" "libretro/mame139"
}

fetch_libretro_mame() {
	fetch_git "https://github.com/libretro/mame.git" "libretro-mame" "libretro/mame"
}

fetch_libretro_ffmpeg() {
	fetch_git "https://github.com/libretro/FFmpeg.git" "libretro-ffmpeg" "libretro/FFmpeg"
}

fetch_libretro_bsnes_cplusplus98() {
	fetch_git "https://github.com/libretro/bsnes-libretro-cplusplus98.git" "libretro-bsnes_cplusplus98" "libretro/bsnes-cplusplus98"
}

fetch_libretro_bsnes_mercury() {
	fetch_git "https://github.com/libretro/bsnes-mercury.git" "libretro-bsnes_mercury" "libretro/bsnes-mercury"
}

fetch_libretro_picodrive() {
	fetch_git "https://github.com/libretro/picodrive.git" "libretro-picodrive" "libretro/picodrive" "1" "1"
}

fetch_libretro_tgbdual() {
	fetch_git "https://github.com/libretro/tgbdual-libretro.git" "libretro-tgbdual" "libretro/tgbdual"
}

fetch_libretro_mupen64plus() {
	fetch_git "https://github.com/libretro/mupen64plus-libretro.git" "libretro-mupen64plus" "libretro/mupen64plus"
}

fetch_libretro_dinothawr() {
	fetch_git "https://github.com/libretro/Dinothawr.git" "libretro-dinothawr" "libretro/Dinothawr"
}

fetch_libretro_uae() {
	fetch_git "https://github.com/libretro/libretro-uae.git" "libretro-uae" "libretro/UAE"
}

fetch_libretro_3dengine() {
	fetch_git "https://github.com/libretro/libretro-3dengine.git" "libretro-3dengine" "libretro/3DEngine"
}

fetch_libretro_remotejoy() {
	fetch_git "https://github.com/libretro/libretro-remotejoy.git" "libretro-remotejoy" "libretro/RemoteJoy"
}

fetch_libretro_bluemsx() {
	fetch_git "https://github.com/libretro/blueMSX-libretro.git" "libretro-bluemsx" "libretro/blueMSX"
}

fetch_libretro_fmsx() {
	fetch_git "https://github.com/libretro/fmsx-libretro.git" "libretro-fmsx" "libretro/fmsx"
}

fetch_libretro_2048() {
	fetch_git "https://github.com/libretro/libretro-2048.git" "libretro-2048" "libretro/2048"
}

fetch_libretro_vecx() {
	fetch_git "https://github.com/libretro/libretro-vecx.git" "libretro-vecx" "libretro/vecx"
}

fetch_libretro_ppsspp() {
	fetch_git "https://github.com/libretro/ppsspp.git" "libretro-ppsspp" "libretro/ppsspp" "1" "1"
}

fetch_libretro_prosystem() {
	fetch_git "https://github.com/libretro/prosystem-libretro.git" "libretro-prosystem" "libretro/prosystem"
}

fetch_libretro_o2em() {
	fetch_git "https://github.com/libretro/libretro-o2em.git" "libretro-o2em" "libretro/o2em"
}

fetch_libretro_4do() {
	fetch_git "https://github.com/libretro/4do-libretro.git" "libretro-4do" "libretro/4do"
}

fetch_libretro_catsfc() {
	fetch_git "https://github.com/libretro/CATSFC-libretro.git" "libretro-catsfc" "libretro/CATSFC"
}

fetch_libretro_stonesoup() {
	fetch_git "https://github.com/libretro/crawl-ref.git" "libretro-stonesoup" "libretro/DungeonCrawler StoneSoup" "1" ""
}

fetch_libretro_hatari() {
	fetch_git "https://github.com/libretro/hatari.git" "libretro-hatari" "libretro/hatari"
}

fetch_libretro_tempgba() {
	fetch_git "https://github.com/libretro/TempGBA-libretro.git" "libretro-tempgba" "libretro/TempGBA"
}

fetch_libretro_gpsp() {
	fetch_git "https://github.com/libretro/gpsp.git" "libretro-gpsp" "libretro/gpsp"
}

fetch_libretro_emux() {
	fetch_git "https://github.com/libretro/emux.git" "libretro-emux" "libretro/Emux"
}

fetch_libretro_fuse() {
	fetch_git "https://github.com/libretro/fuse-libretro.git" "libretro-fuse" "libretro/fuse"
}

# Shouldn't this be part of the tools fetch?  Eh, later...
fetch_libretro_common() {
	fetch_git "https://github.com/libretro/libretro-common.git" "libretro-common" "libretro/common"
}


if [ -n "$1" ]; then
	while [ -n "$1" ]; do
		"$1"
		shift
	done
else
	fetch_retroarch
	fetch_tools
	fetch_libretro_bsnes
	fetch_libretro_snes9x
	fetch_libretro_snes9x_next
	fetch_libretro_genesis_plus_gx
	fetch_libretro_fb_alpha
	fetch_libretro_vba_next
	fetch_libretro_vbam
	fetch_libretro_handy
	fetch_libretro_bnes
	fetch_libretro_fceumm
	fetch_libretro_gambatte
	fetch_libretro_meteor
	fetch_libretro_nxengine
	fetch_libretro_prboom
	fetch_libretro_stella
	fetch_libretro_desmume
	fetch_libretro_quicknes
	fetch_libretro_nestopia
	fetch_libretro_tyrquake
	fetch_libretro_pcsx_rearmed
	fetch_libretro_mednafen_gba
	fetch_libretro_mednafen_lynx
	fetch_libretro_mednafen_ngp
	fetch_libretro_mednafen_pce_fast
	fetch_libretro_mednafen_supergrafx
	fetch_libretro_mednafen_psx
	fetch_libretro_mednafen_pcfx
	fetch_libretro_mednafen_snes
	fetch_libretro_mednafen_vb
	fetch_libretro_mednafen_wswan
	fetch_libretro_scummvm
	fetch_libretro_yabause
	fetch_libretro_dosbox
	fetch_libretro_virtualjaguar
	fetch_libretro_mame078
	fetch_libretro_mame139
	fetch_libretro_mame
	fetch_libretro_ffmpeg
	fetch_libretro_bsnes_cplusplus98
	fetch_libretro_bsnes_mercury
	fetch_libretro_picodrive
	fetch_libretro_tgbdual
	fetch_libretro_mupen64plus
	fetch_libretro_dinothawr
	fetch_libretro_uae
	fetch_libretro_3dengine
	fetch_libretro_remotejoy
	fetch_libretro_bluemsx
	fetch_libretro_fmsx
	fetch_libretro_2048
	fetch_libretro_vecx
	fetch_libretro_ppsspp
	fetch_libretro_prosystem
	fetch_libretro_o2em
	fetch_libretro_4do
	fetch_libretro_catsfc
	fetch_libretro_stonesoup
	fetch_libretro_hatari
	fetch_libretro_tempgba
	fetch_libretro_gpsp
	fetch_libretro_emux
	fetch_libretro_common
	fetch_libretro_fuse
fi
