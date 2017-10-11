require "octokit"

module Casque
  def self.list(cask)
    path = "Casks/#{cask}.rb"
    Octokit.commits(REPO_SLUG, path: path, per_page: 1).each do |commit|
      contents = Octokit.contents(
        REPO_SLUG,
        path: path,
        ref: commit.sha,
        accept: "application/vnd.github.v3.raw"
      )
      version = parse(contents)
      formula = { version: version, commit: commit.sha }
      yield formula
    end
  end
end
