import { cac } from "https://unpkg.com/cac@6/mod.ts"

const cli = cac()

type Asset = {
  name: string
  type: "macos" | "linux" | "unknown"
  url: string
  sha: string
  arch: "arm" | "x86" | "unknown"
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

    const checksums: Record<string, string> = {}

    let assets: Asset[] = await Promise.all<any>(
      data.assets.map(async (asset: any) => {
        const name = asset.name.toLowerCase()
        const url = asset.browser_download_url
        if (url.endsWith("sha256sum.txt")) {
          const [sha, name] = await fetch(url)
            .then((res) => res.text())
            .then((res) => {
              return res.trim().split(/\s+/)
            })
          checksums[name] = sha
        }
        return {
          name: asset.name,
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
    ).then((assets) =>
      assets.filter((asset: any) => {
        return (
          asset.name !== "unknown" &&
          asset.arch !== "unknown" &&
          (asset.url.endsWith(".tar.gz") ||
            asset.url.endsWith(".zip") ||
            asset.url.endsWith(".tgz"))
        )
      })
    )

    assets = assets.map((asset) => {
      asset.sha = checksums[asset.name]
      return asset
    })

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
