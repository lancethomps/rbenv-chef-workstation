#!/usr/bin/env bash

if [[ $RBENV_VERSION == cinc-workstation ]]; then
  if [ ! -x "$RBENV_COMMAND_PATH" ]; then
    chef_workstation_ruby_exe="/opt/cinc-workstation/embedded/bin/ruby"
    chef_workstation_ruby_lib_version=$("$chef_workstation_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')
    if [ -x "${HOME}/.chefdk/gem/ruby/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="${HOME}/.chefdk/gem/ruby/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/embedded/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/embedded/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/cinc-workstation/embedded/lib/ruby/gems/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/cinc-workstation/embedded/lib/ruby/gems/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    fi
  fi
fi
