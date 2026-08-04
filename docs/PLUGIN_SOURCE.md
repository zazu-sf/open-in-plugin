# Stash Plugin Source via GitHub Pages

This repository publishes a Stash-compatible plugin source automatically with GitHub Actions.

## One-time GitHub setup

1. Create a public GitHub repository named `open-in-plugin`.
2. Push the repository contents to the `main` branch.
3. Open **Repository Settings → Pages**.
4. Under **Build and deployment**, choose **GitHub Actions** as the source.
5. Open **Actions** and wait for **Publish Stash plugin source** to finish.

The Stash source URL will then be:

```text
https://[GITHUB-OWNER].github.io/open-in-plugin/index.yml
```

## Add the source in Stash

1. Open **Settings → Plugins**.
2. In **Available Plugins**, choose **Add Source**.
3. Use a descriptive name such as `Open In Plugin`.
4. Enter the GitHub Pages URL above.
5. Save or refresh the available plugin sources.
6. Select **Open In Plugin** and install it.

The generated `index.yml` contains a relative path to the versioned ZIP file, so no personal GitHub username is hard-coded in the plugin source.

## Publishing an update

1. Increase `version:` in `open-in-plugin.yml`.
2. Update `CHANGELOG.md`.
3. Commit and push to `main`.
4. GitHub Pages republishes the ZIP and `index.yml` automatically.
5. Stash will detect the higher version as an update after refreshing plugin sources.

To create a matching GitHub Release, create and push a tag matching the manifest version:

```bash
git tag v1.0.1
git push origin v1.0.1
```

The release workflow verifies that the tag and plugin version match before publishing the ZIP.

## Local test

Build the exact source output locally:

```bash
./scripts/build-source.sh
```

Generated files:

```text
dist/site/index.yml
dist/site/open-in-plugin-v[VERSION].zip
```
