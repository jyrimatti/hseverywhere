# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "linux" do |c|
    c.vm.box = "bento/ubuntu-16.04"
    c.vm.network "forwarded_port", guest: 8081, host: 8084
    c.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.memory = "1024"
    end
  
    c.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update;
      sudo apt-get install -y ubuntu-desktop;
    SHELL
  end

  config.vm.define "windows" do |c|
    c.vm.communicator = "winrm"
    c.winrm.username = "IEUser"
    c.winrm.password = "Passw0rd!"
    c.vm.box_url = "http://aka.ms/msedge.win10.vagrant"
    c.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.memory = "2048"
    end

    $app = File.basename(Dir.getwd)
    c.vm.provision "init",    type: "shell", path: "init-windows.bat",    args: $app, privileged: true
    c.vm.provision "run",     type: "shell", path: "run-windows.bat",     args: $app, privileged: true, powershell_elevated_interactive: true
    c.vm.provision "package", type: "shell", path: "package-windows.bat", args: $app, privileged: false

  end
end
