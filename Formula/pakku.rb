class Pakku < Formula
  desc "Multiplatform modpack manager for Minecraft: Java Edition"
  homepage "https://juraj-hrivnak.github.io/Pakku/"
  url "https://github.com/juraj-hrivnak/Pakku/releases/download/v1.0.0/Pakku-1.0.0.tar"
  sha256 "03ebde38fcad24efdc0dd6496a98ed42566cceaec601675927088f3631e5efc8"
  license "EUPL-1.2"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"pakku").write_env_script libexec/"bin/Pakku", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Could not read 'pakku-lock.json'", shell_output(bin/"pakku add jei", 1)
  end
end
