class Pakku < Formula
  desc "Multiplatform modpack manager for Minecraft: Java Edition"
  homepage "https://juraj-hrivnak.github.io/Pakku/"
  url "https://github.com/juraj-hrivnak/Pakku/releases/download/v0.11.1/Pakku-0.11.1.tar"
  sha256 "929e3da62f31bac2521a8957351875e90ad812c2a8bfff7d6799a791a4e7b9d0"
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
