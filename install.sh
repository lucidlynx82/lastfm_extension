#!/bin/bash
GLIB_SCHEME="org.gnome.rhythmbox.plugins.lastfm_extension.gschema.xml"
GLIB_DIR="/home/${USER}/.local/share/glib-2.0/schemas/"
SCRIPT_NAME=`basename "$0"`
SCRIPT_PATH=${0%`basename "$0"`}
PLUGIN_PATH="/home/${USER}/.local/share/rhythmbox/plugins/lastfm_extension/"  

#build the dirs
mkdir -p $PLUGIN_PATH
mkdir -p $GLIB_DIR

#copy the files
cp -r "${SCRIPT_PATH}"* "$PLUGIN_PATH"

#install the glib schema
mv "${PLUGIN_PATH}${GLIB_SCHEME}" "$GLIB_DIR"
glib-compile-schemas "$GLIB_DIR"

#remove the install script from the dir (not needed)
rm "${PLUGIN_PATH}${SCRIPT_NAME}"