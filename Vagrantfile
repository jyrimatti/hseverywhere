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
    c.vm.box = "chusiang/win10-x64-ansible"
    c.vm.box_version = "1.1.0"
    c.vm.boot_timeout = 600
    c.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.memory = "2048"
    end

    c.vm.provision "init",    type: "shell", path: "init-windows.bat",    args: "rnproject", privileged: true
    c.vm.provision "run",     type: "shell", path: "run-windows.bat",     args: "rnproject", privileged: true, powershell_elevated_interactive: true
    c.vm.provision "package", type: "shell", path: "package-windows.bat", args: "rnproject", privileged: false

  end
end
