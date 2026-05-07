VERSION=$(curl -s https://open-vsx.org/api/YarnSpinner/yarn-spinner | jq -r .version)
if [ -z "$VERSION" ] || [ "$VERSION" = "null" ]; then
	echo "Failed to get version"
	exit 1
fi

echo $VERSION

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

curl -L "https://open-vsx.org/api/YarnSpinner/yarn-spinner/$VERSION/file/YarnSpinner.yarn-spinner-$VERSION.vsix" -o "$SCRIPT_DIR/extension.vsix"
rm -rf "$SCRIPT_DIR/yarn-spinner"
unzip "$SCRIPT_DIR/extension.vsix" -d "$SCRIPT_DIR/yarn-spinner"
rm -f "$SCRIPT_DIR/extension.vsix"
