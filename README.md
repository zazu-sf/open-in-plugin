# Open In Plugin

Open Stash scenes in external player apps directly from the video player.

Designed primarily for **Apple Vision Pro and visionOS**, while also supporting URL-based integrations on iOS, iPadOS, macOS, and compatible platforms.

## Included integrations

- **Moon Player** — immersive, VR180, 360-degree, and stereoscopic playback.
- **Infuse** — general-purpose playback on Apple platforms.
- **Custom Player** — configurable URL template for another compatible app.

## Features

- Dynamic default-app icon in the upper-left corner of the Stash player.
- Configurable default app and source.
- Dropdown with every enabled app.
- Stash stream or original SMB file per app.
- Configurable Stash-to-SMB path mapping.
- Visibility modes: `controls`, `paused`, or `always`.
- Anonymous defaults and examples only.

## Installation

Copy the folder to:

```text
[STASH-CONFIG]/plugins/open-in-plugin/
```

Then reload plugins in Stash and hard-refresh the browser.

## Example SMB mapping

```text
Stash path: /media/folder/movie.mp4
Prefix: /media
Server: [SERVER-IP]
SMB base: /share/media
Result: smb://[SERVER-IP]/share/media/folder/movie.mp4
```

See [docs/CONFIGURATION.md](docs/CONFIGURATION.md).

## GitHub setup

1. Create a repository named `open-in-plugin`.
2. Upload this folder.
3. Replace `OWNER` in `open-in-plugin.yml`.
4. Commit and tag:

```bash
git add .
git commit -m "Initial release"
git tag v1.0.0
git push origin main --tags
```

## License

MIT

## Install through Stash Available Plugins

This repository includes a GitHub Pages workflow that publishes a Stash-compatible
`index.yml` and versioned plugin ZIP automatically.

After pushing the repository and enabling **GitHub Pages → GitHub Actions**, add this URL under **Settings → Plugins → Available Plugins → Add Source**:

```text
https://[GITHUB-OWNER].github.io/open-in-plugin/index.yml
```

See [docs/PLUGIN_SOURCE.md](docs/PLUGIN_SOURCE.md) for the complete setup and update workflow.
