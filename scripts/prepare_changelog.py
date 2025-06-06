import os
from datetime import datetime
from pathlib import Path

TAG = os.environ["TAG"]
VERSION = TAG[1:]


def main():
    print(f"Preparing changelog for {TAG}")
    changelog = Path("CHANGELOG.md")

    with changelog.open() as f:
        lines = f.readlines()

    insert_index: int = -1
    for i in range(len(lines)):
        line = lines[i]
        if line.startswith("## Unreleased"):
            insert_index = i + 1
        elif line.startswith(f"## [v{VERSION}]"):
            print("CHANGELOG already up-to-date")
            return
        elif line.startswith("## [v"):
            break

    if insert_index < 0:
        raise RuntimeError("Couldn't find 'Unreleased' section")

    lines.insert(insert_index, "\n")
    lines.insert(
        insert_index + 1,
        f"## [v{VERSION}](https://github.com/cdmill/neomodern.nvim/releases/tag/v{VERSION}) - "
        f"{datetime.now().strftime('%Y-%m-%d')}\n",
    )

    with changelog.open("w") as f:
        f.writelines(lines)


if __name__ == "__main__":
    main()
