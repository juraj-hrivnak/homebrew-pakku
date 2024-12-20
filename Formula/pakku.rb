class Pakku < Formula
  desc "Multiplatform modpack manager for Minecraft: Java Edition"
  homepage "https://juraj-hrivnak.github.io/Pakku/"
  url "https://github.com/juraj-hrivnak/Pakku/releases/download/v0.23.0/Pakku-0.23.0.tar"
  sha256 "ac04ce3995854ac04355474b2c9896293d9681eb78334398226724861b89413c"
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
