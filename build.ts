import { cac } from "https://unpkg.com/cac@6/mod.ts"

const cli = cac()

type Asset = {
  type: "macos" | "linux"
  url: string
  sha: string
  arch: "arm" | "x86"
}

const renderAssests = (
  assets: Asset[],
  type: "macos" | "linux",
  bin: string
) => {
  return `
on_${type} do
  ${assets
    .filter((asset) => asset.type === type)
    .map(
      (asset) => `
  if Hardware::CPU.${asset.arch === "arm" ? "arm?" : "intel?"}${
        type === "linux" ? " && Hardware::CPU.is_64_bit?" : ""
      }
    url "${asset.url}"
    sha256 "${asset.sha}"

    def install
      bin.install "${bin}"
    end
  end
  `
    )
    .join("\n")}
end
  `
}

const renderTemplate = ({
  bin,
  repo,
  assets,
  version,
  description,
}: {
  bin: string
  repo: string
  assets: Asset[]
  version: string
  description: string
}) => `
class ${bin[0].toUpperCase()}${bin.slice(1)} < Formula
  desc "${description}"
  homepage "https://github.com/${repo}"
  version "${version}"

  ${renderAssests(assets, "macos", bin)}

  ${renderAssests(assets, "linux", bin)}

  test do
    system "#{bin}/${bin} -v"
  end
end

`

cli
  .command("[repo]", "build formula for repo")
  .action(async (repo: string | undefined) => {
    if (!repo) return cli.outputHelp()

    const { description } = await fetch(
      `https://api.github.com/repos/${repo}`
    ).then((res) => res.json())

    const data = await fetch(
      `https://api.github.com/repos/${repo}/releases/latest`
    ).then((res) => res.json())

    let checksumsUrl: string | undefined

    let assets: Asset[] = data.assets
      .map((asset: any) => {
        const name = asset.name.toLowerCase()
        const url = asset.browser_download_url
        if (url.endsWith("checksums.txt")) {
          checksumsUrl = url
        }
        return {
          url,
          type: name.includes("darwin")
            ? "macos"
            : name.includes("linux")
            ? "linux"
            : "unknown",
          sha: "",
          arch:
            name.includes("arm") || name.includes("aarch")
              ? "arm"
              : name.includes("x86")
              ? "x86"
              : "unknown",
        }
      })
      .filter((asset: any) => {
        return (
          asset.name !== "unknown" &&
          asset.arch !== "unknown" &&
          (asset.url.endsWith(".tar.gz") ||
            asset.url.endsWith(".zip") ||
            asset.url.endsWith(".tgz"))
        )
      })

    if (checksumsUrl) {
      const checksums = await fetch(checksumsUrl)
        .then((res) => res.text())
        .then((res) => res.split("\n").map((line) => line.split(" ")))

      assets = assets.map((asset) => {
        const line = checksums.find((line) => asset.url.endsWith(line[1]))
        if (line) {
          asset.sha = line[0]
        }
        return asset
      })
    }

    const bin = repo.split("/")[1]

    const output = renderTemplate({
      assets,
      bin,
      repo,
      description,
      version: data.tag_name.slice(1),
    })

    Deno.writeTextFileSync(`Formula/${bin}.rb`, output)
  })

cli.help()
cli.parse()
