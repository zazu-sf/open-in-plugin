# Configuration

## Supported apps

### Moon Player

```text
moonplayer://open?url={url}
```

### Infuse

```text
infuse://x-callback-url/play?url={url}&filename={filename}
```

### Custom Player

Default template:

```text
player://open?url={url}
```

Placeholders: `{url}`, `{rawUrl}`, `{filename}`, `{sceneId}`, `{source}`.

## Sources

### Stream

```text
/scene/{id}/stream
```

### SMB

```text
Stash file: /media/folder/movie.mp4
Prefix: /media
Server: [SERVER-IP]
SMB base: /share/media
Result: smb://[SERVER-IP]/share/media/folder/movie.mp4
```

## Button visibility

- `controls`: visible while paused or briefly after interaction
- `paused`: visible only while paused
- `always`: always visible
