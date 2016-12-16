#!/bin/bash

INSTALLER_CERT="Developer ID Installer: Francois TIFFREAU (EM3ER8T33A)"

# A weird way to get the absolute path
# http://stackoverflow.com/questions/3349105/how-to-set-current-working-directory-to-the-directory-of-the-script

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


trap error_exit ERR

error_exit () {
	errcode=$?
	echo "Error. Exiting"
	exit $errcode
}

rm -rf ${dir}/payload/usr/local/bin/cdef.app

xcodebuild archive \
	-project ${dir}/../cdef.xcodeproj \
	-scheme cdef \
	-archivePath ${dir}/archive


xcodebuild -exportArchive \
	-archivePath ${dir}/archive.xcarchive \
	-exportPath ${dir}/payload/usr/local/bin \
	-exportOptionsPlist ${dir}/exportOptionsPlist.plist

version=`defaults read ${dir}/payload/usr/local/bin/cdef.app/Contents/Info.plist CFBundleShortVersionString`

pkgbuild --root ${dir}/payload \
	 --scripts ${dir}/scripts \
	 --identifier io.fti.cdef \
	 --version ${version} \
	${dir}/cdef-${version}-unsigned.pkg


productsign --sign "${INSTALLER_CERT}" \
	${dir}/cdef-${version}-unsigned.pkg \
	${dir}/cdef-${version}.pkg