#!/usr/bin/env bash

LATEST_STABLE_VERSION_ENDPOINT="https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE";
BINARY_DOWNLOAD_BASE_ENDPOINT="https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/";
PLATFORM="linux64";

latest_stable_version="`curl -s $LATEST_STABLE_VERSION_ENDPOINT`";

if echo "$latest_stable_version" | grep --silent --invert-match --extended-regex '^[0-9\.]+$'; then
	echo "Unable to find latest stable version at the endpoint $LATEST_STABLE_VERSION_ENDPOINT.";
	exit 1;
fi

chrome_download_url="$BINARY_DOWNLOAD_BASE_ENDPOINT/$latest_stable_version/$PLATFORM/chrome-$PLATFORM.zip";
chrome_driver_download_url="$BINARY_DOWNLOAD_BASE_ENDPOINT/$latest_stable_version/$PLATFORM/chromedriver-$PLATFORM.zip";

echo "Downloading $chrome_download_url";
wget "$chrome_download_url";

echo "Dowloading $chrome_driver_download_url";
wget "$chrome_driver_download_url";
